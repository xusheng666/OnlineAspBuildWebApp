using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace OneCalendar.BusinessComponent
{
    public static class CryptionUtil
    {
        private static readonly RandomNumberGenerator Random = RandomNumberGenerator.Create();

        #region AES configurations
        //Preconfigured Encryption Parameters
        public static readonly int BlockBitSize = 128;
        public static readonly int KeyBitSize = 256;

        //Preconfigured Password Key Derivation Parameters
        public static readonly int SaltBitSize = 128;
        public static readonly int Iterations = 5000;
        public static readonly int MinPasswordLength = 10;
        #endregion

        #region Public method for using
        /// <summary>
        /// Encrypt the message with password 
        /// </summary>
        /// <param name="secruedMsg">the message to be encrypted</param>
        /// <param name="password">the password to encrypt or decrypt the above message, salt will generate based on this value</param>
        /// <returns></returns>
        public static byte[] EncryptAESSecruedMsg(string secruedMsg, string password, byte[] saltBytes)
        {
            byte[] encryptedMsg = null;
            validUserInputs(secruedMsg, password, getStringFromBytes(saltBytes));
            
            try
            {
                encryptedMsg = AESCryption.AES_Encrypt(getBytesFromString(secruedMsg), getBytesFromString(password), saltBytes);
            }
            catch (Exception)
            {
                encryptedMsg = null;
            }
            return encryptedMsg;

        }

        public static string DecryptAESSecruedMsg(byte[] encryptedMsg, string password, byte[] saltBytes)
        {
            string decryptedMsg = null;
            validUserInputs(getStringFromBytes(encryptedMsg), password, getStringFromBytes(saltBytes));

            try
            {
                byte[] decryptMsg = AESCryption.AES_Decrypt(encryptedMsg, getBytesFromString(password), saltBytes);
                decryptedMsg = getStringFromBytes(decryptMsg);
            }
            catch (Exception)
            {
                decryptedMsg = null;
            }

            return decryptedMsg;
        }

        public static byte[] GeneratorSalt(string password)
        {
            using (var generator = new Rfc2898DeriveBytes(password, SaltBitSize / 8, Iterations))
            {
                return generator.Salt;
            }
        }
        #endregion

        #region Utility methods

        private static void validUserInputs(string secruedMsg, string password, string salts)
        {
            //User Error Checks
            //if (string.IsNullOrWhiteSpace(password) || password.Length < MinPasswordLength)
            //    throw new ArgumentException(String.Format("Must have a password of at least {0} characters!", MinPasswordLength), "password");

            if (secruedMsg == null || secruedMsg.Length == 0)
                throw new ArgumentException("Encrypted Message Required!", "encryptedMessage");

            if (salts == null || salts.Length == 0)
                throw new ArgumentException("Encrypted Salts Required!", "encryptedMessage");
        }

        /// <summary>
        /// convert from string and bytes
        /// </summary>
        /// <param name="inputstr"></param>
        /// <returns></returns>
        private static byte[] getBytesFromString(string inputstr)
        {
            return ASCIIEncoding.UTF8.GetBytes(inputstr);
        }
        private static string getStringFromBytes(byte[] byteArray)
        {
            return System.Text.Encoding.UTF8.GetString(byteArray); ;
        }
        #endregion
    }
    # region AESCryption class
    /// <summary>
    /// below is the real encryption and decryption class for AES
    /// </summary>
    static class AESCryption
    {
        public static byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes, byte[] saltBytes)
        {
            byte[] encryptedBytes = null;

            using (MemoryStream ms = new MemoryStream())
            {
                using (RijndaelManaged AES = new RijndaelManaged())
                {
                    initialAES(passwordBytes, saltBytes, AES);

                    using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
                        cs.Close();
                    }
                    encryptedBytes = ms.ToArray();
                }
            }

            return encryptedBytes;
        }

        public static byte[] AES_Decrypt(byte[] bytesToBeDecrypted, byte[] passwordBytes, byte[] saltBytes)
        {
            byte[] decryptedBytes = null;

            using (MemoryStream ms = new MemoryStream())
            {
                using (RijndaelManaged AES = new RijndaelManaged())
                {
                    initialAES(passwordBytes, saltBytes, AES);

                    using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(bytesToBeDecrypted, 0, bytesToBeDecrypted.Length);
                        cs.Close();
                    }
                    decryptedBytes = ms.ToArray();
                }
            }

            return decryptedBytes;
        }

        private static void initialAES(byte[] passwordBytes, byte[] saltBytes, RijndaelManaged AES)
        {
            AES.KeySize = CryptionUtil.KeyBitSize;
            AES.BlockSize = CryptionUtil.BlockBitSize;

            var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, CryptionUtil.Iterations);
            AES.Key = key.GetBytes(AES.KeySize / 8);
            AES.IV = key.GetBytes(AES.BlockSize / 8);

            AES.Mode = CipherMode.CBC;
            AES.Padding = PaddingMode.PKCS7;
        }
    }
    # endregion
}
