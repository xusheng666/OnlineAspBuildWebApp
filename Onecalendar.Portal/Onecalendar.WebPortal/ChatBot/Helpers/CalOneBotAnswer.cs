using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TuitionPedia
{
    public static class CalOneBotAnswer
    {
        //static RestForTitionPublish service = new RestForTitionPublish();

        public static string GetTutionPayment(List<IntentDefinition.IntentParam> param)
        {
            /*
            string subject = param.GetValueInJSON(WitContants.entity_subjects);
            string location = param.GetValueInJSON(WitContants.entity_location);
            string grade = param.GetValueInJSON(WitContants.entity_grade);

            var ss = service.GetTutionPayment(subject, location);
            */
            

            return "S$ 100.00";
        }


        public static string GetValue(this List<IntentDefinition.IntentParam> data, string Constant)
        {

            var ss = data.Where(m => m.ParamName == Constant).ToList();

            if (ss.Count > 0)
                return ss[0].Value;

            return "";
        }

        public static string GetValueInJSON(this List<IntentDefinition.IntentParam> data, string Constant)
        {
            return RestService.FormatTextForJSON(GetValue(data, Constant));
        }

    }
}
