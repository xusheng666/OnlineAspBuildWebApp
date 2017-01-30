using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Xml.Serialization;
using System.Diagnostics;
using System.Xml;

namespace OneCalendar.BusinessComponent
{
    public class Utility
    {
        public static String NewDataKey()
        {
            return Guid.NewGuid().ToString();
        }


        public static void UpdateCommonFields(DataRow dataRow)
        {
            DataTable dt = dataRow.Table;
            if (dt.Columns.Contains("LAST_UPDATED_BY"))
                dataRow["LAST_UPDATED_BY"] = "Internet";

            if (dt.Columns.Contains("LAST_UPDATED_TIME"))
                dataRow["LAST_UPDATED_TIME"] = DateTime.Now;

            if (dataRow.RowState != DataRowState.Modified && dataRow.RowState != DataRowState.Unchanged)
            {
                if (dt.Columns.Contains("TRANSACTION_ID"))
                    dataRow["TRANSACTION_ID"] = "Internet";

                if (dt.Columns.Contains("VERSION_NO"))
                    dataRow["VERSION_NO"] = 1;

                if (dt.Columns.Contains("CREATED_BY"))
                    dataRow["CREATED_BY"] = "Internet";

                if (dt.Columns.Contains("CREATED_TIME"))
                    dataRow["CREATED_TIME"] = DateTime.Now;
            }
        }
        public static string EncryptDES(string encryptString, string key)
        {
            try
            {
                byte[] rgbKey = Encoding.UTF8.GetBytes(key);
                byte[] rgbIV = Constants.DES.IVS;
                byte[] inputByteArray = Encoding.UTF8.GetBytes(encryptString.Substring(0, 8));
                using (DESCryptoServiceProvider dCSP = new DESCryptoServiceProvider())
                {
                    using (MemoryStream mStream = new MemoryStream())
                    {
                        using (CryptoStream cStream = new CryptoStream(mStream, dCSP.CreateEncryptor(rgbKey, rgbIV), CryptoStreamMode.Write))
                        {
                            cStream.Write(inputByteArray, 0, inputByteArray.Length);
                            cStream.FlushFinalBlock();
                            return Convert.ToBase64String(mStream.ToArray());
                        }
                    }
                }
            }
            catch (Exception se)
            {
                throw se;
            }
        }
        public static string DecryptDES(string decryptString, string key)
        {
            try
            {
                byte[] rgbKey = Encoding.UTF8.GetBytes(key);
                byte[] rgbIV = Constants.DES.IVS; ;
                byte[] inputByteArray = Convert.FromBase64String(decryptString.Substring(0, 8));
                using (DESCryptoServiceProvider DCSP = new DESCryptoServiceProvider())
                {
                    using (MemoryStream mStream = new MemoryStream())
                    {
                        using (CryptoStream cStream = new CryptoStream(mStream, DCSP.CreateDecryptor(rgbKey, rgbIV), CryptoStreamMode.Write))
                        {
                            cStream.Write(inputByteArray, 0, inputByteArray.Length);
                            cStream.FlushFinalBlock();
                            return Encoding.UTF8.GetString(mStream.ToArray()).Replace("\0", "");
                        }
                    }
                }
            }
            catch (Exception se)
            {
                throw se;
            }
        }
        public class IMAGE_FILE_HEADER
        {
            public uint Machine;
            public uint NumberOfSections;
            public uint TimeDateStamp;
            public uint PointerToSymbolTable;
            public uint NumberOfSymbols;
            public ushort SizeOfOptionalHeader;
            public ushort Characteristics;
            public IMAGE_FILE_HEADER(BinaryReader reader)
            {
                Machine = reader.ReadUInt32();
                NumberOfSections = reader.ReadUInt32();
                TimeDateStamp = reader.ReadUInt32();
                PointerToSymbolTable = reader.ReadUInt32();
                NumberOfSymbols = reader.ReadUInt32();
                SizeOfOptionalHeader = reader.ReadUInt16();
                Characteristics = reader.ReadUInt16();
            }
        }
        public class IMAGE_DOS_HEADER
        {
            public ushort e_magic;                     // Magic number
            public ushort e_cblp;                      // Bytes on last page of file
            public ushort e_cp;                        // Pages in file
            public ushort e_crlc;                      // Relocations
            public ushort e_cparhdr;                   // Size of header in paragraphs
            public ushort e_minalloc;                  // Minimum extra paragraphs needed
            public ushort e_maxalloc;                  // Maximum extra paragraphs needed
            public ushort e_ss;                        // Initial (relative) SS value
            public ushort e_sp;                        // Initial SP value
            public ushort e_csum;                      // Checksum
            public ushort e_ip;                        // Initial IP value
            public ushort e_cs;                        // Initial (relative) CS value
            public ushort e_lfarlc;                    // File address of relocation table
            public ushort e_ovno;                      // Overlay number
            public ushort[] e_res = new ushort[4];     // Reserved words
            public ushort e_oemid;                     // OEM identifier (for e_oeminfo)
            public ushort e_oeminfo;                   // OEM information; e_oemid specific
            public ushort[] e_res2 = new ushort[10];   // Reserved words
            public int e_lfanew;                       // File address of new exe header

            public IMAGE_DOS_HEADER(BinaryReader reader)
            {
                e_magic = reader.ReadUInt16();
                e_cblp = reader.ReadUInt16();
                e_cp = reader.ReadUInt16();
                e_crlc = reader.ReadUInt16();
                e_cparhdr = reader.ReadUInt16();
                e_minalloc = reader.ReadUInt16();
                e_maxalloc = reader.ReadUInt16();
                e_ss = reader.ReadUInt16();
                e_sp = reader.ReadUInt16();
                e_csum = reader.ReadUInt16();
                e_ip = reader.ReadUInt16();
                e_cs = reader.ReadUInt16();
                e_lfarlc = reader.ReadUInt16();
                e_ovno = reader.ReadUInt16();
                for (int i = 0; i < 4; i++)
                {
                    e_res[i] = reader.ReadUInt16();
                }
                e_oemid = reader.ReadUInt16();
                e_oeminfo = reader.ReadUInt16();
                for (int i = 0; i < 10; i++)
                {
                    e_res2[i] = reader.ReadUInt16();
                }
                e_lfanew = reader.ReadInt32();
            }
        }
        public const int IMAGE_DOS_SIGNATURE = 0x5A4D; // MZ
        public const int IMAGE_OS2_SIGNATURE = 0x454E; // NE
        public const int IMAGE_OS2_SIGNATURE_LE = 0x454C; // LE
        public const int IMAGE_NT_SIGNATURE = 0x00004550; // PE00

        public static bool ValidatePE(byte[] datas)
        {
            using (MemoryStream stream = new MemoryStream(datas))
            {
                using (BinaryReader reader = new BinaryReader(stream))
                {
                    IMAGE_DOS_HEADER dos = new IMAGE_DOS_HEADER(reader);
                    if (dos.e_magic == IMAGE_DOS_SIGNATURE)
                    {
                        reader.BaseStream.Seek(dos.e_lfanew, SeekOrigin.Begin);
                        uint signature = reader.ReadUInt32();
                        if (signature == IMAGE_NT_SIGNATURE)
                            return true;
                        return false;
                    }
                    return false;
                }
            }
        }
        public static bool ValidatePE(string path)
        {
            using (FileStream stream = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                using (BinaryReader reader = new BinaryReader(stream))
                {
                    IMAGE_DOS_HEADER dos = new IMAGE_DOS_HEADER(reader);
                    if (dos.e_magic == IMAGE_DOS_SIGNATURE)
                    {
                        reader.BaseStream.Seek(dos.e_lfanew, SeekOrigin.Begin);
                        uint signature = reader.ReadUInt32();
                        if (signature == IMAGE_NT_SIGNATURE)
                            return true;
                        return false;
                    }
                    return false;
                }
            }
        }

        public static object XmlDeserialize(Type type, string s)
        {
            using (TextReader sr = new StringReader(s))
            {
                XmlSerializer xz = new XmlSerializer(type);
                return xz.Deserialize(sr);
            }
        }

        public static string XmlSerialize(Object xmlobj)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            XmlSerializer xs = new XmlSerializer(xmlobj.GetType());
            xs.Serialize(sw, xmlobj);
            sw.Close();
            return sb.ToString();
        }
        //public static void WriteEventToWindowsLog(string strLog, string strMyApp, List<EventLogInfo> listEvent)
        //{

        //    EventLog log = new EventLog(strLog);
        //    if (!EventLog.SourceExists(strMyApp))
        //    {
        //        EventLog.CreateEventSource(strMyApp, strLog);
        //    }
        //    log.Source = strMyApp;
        //    foreach (var list in listEvent)
        //    {
        //        log.WriteEntry(list.EventInfo, list.EventType);
        //    }
        //}


        //Converts input file streams to byte array
        /// <summary>
        /// Reads to end.
        /// </summary>
        /// <param name="stream">The stream.</param>
        /// <returns></returns>
        public static class Streamer 
        {
            public static byte[] ReadToEnd(System.IO.Stream stream)
            {
                long originalPosition = 0;

                if (stream.CanSeek)
                {
                    originalPosition = stream.Position;
                    stream.Position = 0;
                }

                try
                {
                    byte[] readBuffer = new byte[4096];

                    int totalBytesRead = 0;
                    int bytesRead;

                    while ((bytesRead = stream.Read(readBuffer, totalBytesRead, readBuffer.Length - totalBytesRead)) > 0)
                    {
                        totalBytesRead += bytesRead;

                        if (totalBytesRead == readBuffer.Length)
                        {
                            int nextByte = stream.ReadByte();
                            if (nextByte != -1)
                            {
                                byte[] temp = new byte[readBuffer.Length * 2];
                                Buffer.BlockCopy(readBuffer, 0, temp, 0, readBuffer.Length);
                                Buffer.SetByte(temp, totalBytesRead, (byte)nextByte);
                                readBuffer = temp;
                                totalBytesRead++;
                            }
                        }
                    }

                    byte[] buffer = readBuffer;
                    if (readBuffer.Length != totalBytesRead)
                    {
                        buffer = new byte[totalBytesRead];
                        Buffer.BlockCopy(readBuffer, 0, buffer, 0, totalBytesRead);
                    }
                    return buffer;
                }
                finally
                {
                    if (stream.CanSeek)
                    {
                        stream.Position = originalPosition;
                    }
                }
            }

        }
        
    }
}
