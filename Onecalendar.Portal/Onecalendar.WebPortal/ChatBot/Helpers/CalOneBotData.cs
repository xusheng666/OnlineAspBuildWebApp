using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TuitionPedia
{

    public partial class CalOneBotData
    {
        [JsonProperty("_text")]
        public string Text { get; set; }

        [JsonProperty("entities")]
        public Entities Entities { get; set; }

        [JsonProperty("msg_id")]
        public string MsgId { get; set; }
    }

    public partial class Entities
    {
        public bool IsNoEntityFound { get {
                return Intent_Subject == null && EntitySubjects == null && EntityGrades == null && Location == null;
            } }
    }

    public partial class Entities
    {
        [JsonProperty(WitDefinitions.definitions_intent_subject)]
        public EntityBase[] Intent_Subject { get; set; }

        [JsonProperty(WitDefinitions.definitions_entity_defaultanswers)]
        public EntityBase[] DefaultAnswers { get; set; }

        [JsonProperty(WitDefinitions.definitions_intent_direction)]
        public EntityBase[] Intent_Direction { get; set; }

        [JsonProperty(WitDefinitions.definitions_entity_subjects)]
        public EntityBase[] EntitySubjects { get; set; }

        [JsonProperty(WitDefinitions.definitions_entity_grade)]
        public EntityBase[] EntityGrades { get; set; }

        [JsonProperty(WitDefinitions.definitions_location)]
        public EntityBase[] Location { get; set; }

        [JsonProperty(WitDefinitions.definitions_bye)]
        public EntityBase[] Farewell { get; set; }

    }

    public partial class EntityBase
    {
        [JsonProperty("confidence")]
        public double Confidence { get; set; }

        [JsonProperty("value")]
        public string Value { get; set; }

        [JsonProperty("type")]
        public string Type { get; set; }
    }

    public partial class CalOneBotData
    {
        public static CalOneBotData FromJson(string json) {
           return JsonConvert.DeserializeObject<CalOneBotData>(json, Converter.Settings);
        }
    }

    public static class Serialize
    {
        public static string ToJson(this CalOneBotData self)
        {
            return JsonConvert.SerializeObject(self, Converter.Settings);
        }
    }

    public class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
        };
    }

}
