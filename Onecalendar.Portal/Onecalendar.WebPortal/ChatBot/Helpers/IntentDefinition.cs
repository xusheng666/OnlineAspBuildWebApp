using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TuitionPedia
{
    public static class WitContantsIntent
    {
        public const string intent_subject_payment = "intent_subject_payment";
        public const string intent_subject_registration = "intent_subject_registration";
        public const string intent_subject_complaint = "intent_subject_complaint";

        public const string intent_subject_courses = "intent_subject_courses";
    }

    public static class WitDefinitions
    {
        public const string definitions_entity_defaultanswers = "entity_defaultanswers";
        public const string definitions_intent_subject = "intent_subject";
        public const string definitions_intent_direction = "intent_direction";
        public const string definitions_entity_subjects = "entity_subjects";
        public const string definitions_entity_grade = "entity_grade";
        public const string definitions_location = "location";
        public const string definitions_bye = "bye";
    }

    public static class WitContantAction
    {
        public const string intent_action_dotask = "intent_action_dotask";
        public const string intent_action_querytask = "intent_action_querytask";
    }

    public static class WitContants
    {

        public const string feedback_sentiment = "feedback_sentiment";

        public const string salutation_sorry = "salutation_sorry";
        public const string salutation_reaction_sorry = "salutation_reaction_sorry";
        public const string salutation_acknowledge = "salutation_acknowledge";
        public const string salutation_askfewquestions = "salutation_askfewquestions";
        public const string salutation_toomanyquestions = "salutation_toomanyquestions";

        public const string entity_bye = "wit/bye";

        public const string entity_location = "wit/location";
        public const string entity_location_request1 = "Where is your location?";
        public const string entity_location_request2 = "Where did it happen?";

        public const string entity_subjects = "entity_subjects";
        public const string entity_subjects_request = "What subject are you taking?";

        public const string entity_grade = "entity_grade";
        public const string entity_grade_request = "What Grade/Level are you taking?";

        public const string no_answer_response = "I sorry i am not able to find an answer to your query.   Maybe you can ask me something else.";

        public const string chatbot_introduction ="Hi i am the virtual assistant.  How can I help you?  I can do registration, payment inquiries and feedbacks/complaints.";
    }

    public static class IntentManager
    {
        private static List<IntentDefinition> m_DefinitionList;
        private static Queue<IntentDefinition> m_SegwayList = new Queue<IntentDefinition>();

        private static IntentDefinition m_segway;
        private static IntentDefinition m_currentIntent;
        private static IntentDefinition.IntentParam m_currentIntentQuestion;


        private static int sentiment = 0;

        static IntentManager()
        {
            m_DefinitionList = IntentDefinition.GetIntentDefinitions();
        }

        public static string ProcessChatBotMessage(CalOneBotData chatdata)
        {
            if (chatdata == null)
                return null;

            var reply_builder = new StringBuilder();
            string intent_subject = chatdata.Entities.Intent_Subject != null ? chatdata.Entities.Intent_Subject[0].Value : "";
            string intent_direction = chatdata.Entities.Intent_Direction != null ? chatdata.Entities.Intent_Direction[0].Value : "";
            string default_answer  = chatdata.Entities.DefaultAnswers != null ? chatdata.Entities.DefaultAnswers[0].Value : "";

            // IF SUBJECT AND NOT SURE INTENT!
            if (!string.IsNullOrEmpty(intent_subject) && string.IsNullOrEmpty(intent_direction))
            {
                // SUBJECT IS KNOW BUT DONT KNOW INTENT, ASSUME ASKING
                intent_direction = WitContantAction.intent_action_querytask;
            }

            if (!string.IsNullOrEmpty(intent_subject) && !string.IsNullOrEmpty(intent_direction))
            {
                string targetIntent = intent_subject + intent_direction;

                m_currentIntent = null;
                m_currentIntentQuestion = null;

                var ff = m_DefinitionList.Where(
                    m => m.Intent == targetIntent
                ).Select(m => m).ToList();

                m_currentIntentQuestion = null;

                if (ff.Count > 0)
                    m_currentIntent = ff[0];

                if (m_currentIntent != null)
                {
                    //INITIALIZE INTENT PARAMS
                    var paramList = m_currentIntent.IntentParameters.Where(m => m.IsRequired).ToList();
                    paramList.ForEach(m => {
                        m.Value = "";
                        AssignParameterData(m, chatdata);
                    });

                    reply_builder.Append(ReplyManager.Reply(m_currentIntent.Intent_Salutation));

                    var findRequiredField = m_currentIntent.IntentParameters.Where(m => m.IsRequired && string.IsNullOrEmpty(m.Value)).ToList();
                    if (findRequiredField.Count>=2)
                        reply_builder.Append(ReplyManager.Reply(WitContants.salutation_askfewquestions));
                }
            }

            if (m_segway != null)
            {
                if (default_answer == "default_yes")
                    m_currentIntent = m_segway;

                if (m_currentIntent == null)
                    reply_builder.Append("No problem.  Can I assist you in any other way?");

                m_segway = null;
            }

            if (m_currentIntentQuestion != null)
            {
                m_currentIntentQuestion.Value = chatdata.Text; // IF NO ENTITY DETECTED AND HAS A DEFAULT QUESTION, ASSIGN IT TO THE QUESTION
                
                //Append any remarks after an answer
                reply_builder.Append(ReplyManager.Reply(m_currentIntentQuestion.AfterAnswer));

                m_currentIntentQuestion = null;
            }

            if (chatdata.Entities.Farewell != null)
            {
                reply_builder.Append(ReplyManager.Reply(WitContants.entity_bye));
            }

            if (m_currentIntent != null)
            {
                var findRequiredField = m_currentIntent.IntentParameters.Where(m => m.IsRequired && string.IsNullOrEmpty(m.Value)).ToList();
                bool IsIntentSatisfied = findRequiredField.Count == 0;

                if (IsIntentSatisfied)
                {
                    string intent_value = "";
                    if (m_currentIntent.Intent == WitContantsIntent.intent_subject_payment + WitContantAction.intent_action_querytask)
                        intent_value = CalOneBotAnswer.GetTutionPayment(m_currentIntent.IntentParameters);

                    if (m_currentIntent.Intent == WitContantsIntent.intent_subject_complaint + WitContantAction.intent_action_dotask)
                        intent_value = "I have heard you and we will get back at you as soon as possible.";

                    if (m_currentIntent.Intent == WitContantsIntent.intent_subject_registration + WitContantAction.intent_action_dotask)
                        intent_value = "Thank you.  Your registration has been filed.";

                    if (m_currentIntent.Intent == WitContantsIntent.intent_subject_courses + WitContantAction.intent_action_querytask)
                    {
                        intent_value = "Math, Mandarin, Science.";

                        var seg1 = m_DefinitionList.Find(m => m.Intent == WitContantsIntent.intent_subject_registration + WitContantAction.intent_action_dotask);
                        m_SegwayList.Enqueue(seg1);
                    }

                    if (string.IsNullOrEmpty(intent_value))
                        intent_value = WitContants.no_answer_response;

                    reply_builder.Append(intent_value);

                    if (m_SegwayList.Count > 0)
                    {
                        m_segway = m_SegwayList.Dequeue();
                        reply_builder.Append("\n"+m_segway.Intent_AskToDo);
                    }

                    m_currentIntent = null;
                    return reply_builder.ToString();
                }

                if (findRequiredField.Count > 0)
                {
                    m_currentIntentQuestion = findRequiredField[0];
                    m_currentIntentQuestion.Value = "";

                    reply_builder.Append(m_currentIntentQuestion.QuestionIfMissing);
                }
                else
                {
                    reply_builder.Append("Processing.");
                }
            }
            return reply_builder.ToString();
        }

        private static void AssignParameterData(IntentDefinition.IntentParam param, CalOneBotData chatdata)
        {
            if (param.ParamName == WitContants.entity_location && chatdata.Entities.Location != null)
                param.Value = FindBestEntity(chatdata.Entities.Location.ToList()).Value;

            if (param.ParamName == WitContants.entity_subjects && chatdata.Entities.EntitySubjects != null)
                param.Value = FindBestEntity(chatdata.Entities.EntitySubjects.ToList()).Value;

            if (param.ParamName == WitContants.entity_grade && chatdata.Entities.EntityGrades != null)
                param.Value = FindBestEntity(chatdata.Entities.EntityGrades.ToList()).Value;
        }

        private static EntityBase FindBestEntity(List<EntityBase> entities)
        {
            if (entities.Count == 0)
                return null;

            if (entities.Count == 1)
                return entities[0];

            return entities.OrderByDescending(m => m.Confidence).First();
        }

        #region Sentiments
        private static void SentimentNegative()
        {
            if (sentiment>-1)
                sentiment = -1;
        }

        private static void SentimentAngry()
        {
            if (sentiment > -3)
                sentiment = -3;
        }

        private static void SentimentFurious()
        {
            if (sentiment > -5)
                sentiment = -5;
        }

        private static void SentimentDecreased()
        {
            if (sentiment > -2)
                sentiment = sentiment - 1;
        }

        private static void SentimentImproved()
        {
            if (sentiment < 1)
                sentiment = sentiment + 1;
        }

        private static void SentimentImprovedGreately()
        {
            if (sentiment < 2)
                sentiment = sentiment + 2;
        }
        #endregion
    }

    public static class ReplyManager
    {
        public static string Reply(string type)
        {
            if (string.IsNullOrEmpty(type))
                return "";

            Random random = new Random();
            int randomNumber = random.Next(0, 2);

            if (type==WitContants.salutation_acknowledge)
            {
                switch (randomNumber)
                {
                    case 1:
                        return "Okay. ";
                    case 2:
                        return "Great.";
                    default:
                        return "I see. ";
                }
            }

            if (type == WitContants.salutation_sorry)
            {
                switch (randomNumber)
                {
                    default:
                        return "We are sorry to hear that. ";
                }
            }

            if (type == WitContants.entity_bye)
            {
                switch (randomNumber)
                {
                    case 1:
                        return "Thank you.  Have a nice day. ";

                    case 2:
                        return "Thank you.  Have a great day. ";

                    default:
                        return "Thank you. ";
                }
            }

            if (type == WitContants.salutation_reaction_sorry)
            {
                switch (randomNumber)
                {
                    case 1:
                        return "Really? That's terrible.";
                    case 2:
                        return "My goodness. ";
                    default:
                        return "Oh no. ";
                }
            }


            if (type == WitContants.salutation_askfewquestions)
            {
                switch (randomNumber)
                {
                    case 1:
                        return "I have a few queries regarding this, i hope you don't mind. ";
                    case 2:
                        return "I will ask you a few questions. ";
                    default:
                        return "I hope you don't mind, i will ask a few questions. ";
                }
            }

            if (type == WitContants.salutation_toomanyquestions)
            {
                switch (randomNumber)
                {
                    case 1:
                        return "Sorry for all the questions! ";
                    default:
                        return "Sorry for all these inquiries! ";
                }
            }

            return "";
        }

    }

    public partial class IntentDefinition
    {

        //LIST ALL AVAILABLE INTENTS THAT CAN BE DONE IN TUTION PUBLISH
        public static List<IntentDefinition> GetIntentDefinitions()
        {
            var defs = new List<IntentDefinition>();

            if (1 == 1)
            {
                var availCourses = new IntentDefinition(WitContantsIntent.intent_subject_courses + WitContantAction.intent_action_querytask, WitContants.salutation_acknowledge,"Do you wish to find applicable courses?");
                availCourses.AddRequiredParam(WitContants.entity_grade, WitContants.entity_grade_request);
                availCourses.AddRequiredParam(WitContants.entity_location, WitContants.entity_location_request1);
                defs.Add(availCourses);
            }

            if (1 == 1)
            {
                var payment = new IntentDefinition(WitContantsIntent.intent_subject_payment + WitContantAction.intent_action_querytask, WitContants.salutation_acknowledge,"Do you wish to find payment details?");
                payment.AddRequiredParam(WitContants.entity_location, WitContants.entity_location_request1);
                payment.AddRequiredParam(WitContants.entity_subjects, WitContants.entity_subjects_request);
                payment.AddRequiredParam(WitContants.entity_grade, WitContants.entity_grade_request);
                defs.Add(payment);
            }

            if (1 == 1)
            {
                var complaint = new IntentDefinition(WitContantsIntent.intent_subject_complaint + WitContantAction.intent_action_dotask, WitContants.salutation_sorry,"");
                //complaint.AddOptionalParam(WitContants.feedback_sentiment, WitContants.entity_location_request);

                var complaint_feedback = complaint.AddRequiredParam("feedback_reason", "Can you tell me about the issue?");
                complaint_feedback.AfterAnswer = WitContants.salutation_reaction_sorry;
                complaint.AddRequiredParam(WitContants.entity_location, WitContants.entity_location_request2);
                complaint.AddRequiredParam("GuardianMobile", "We will investigate this.  Please give us your mobile number so that we can contact you.");
                defs.Add(complaint);
            }

            if (1 == 1)
            {
                var doregister = new IntentDefinition(WitContantsIntent.intent_subject_registration + WitContantAction.intent_action_dotask, "","Do you wish to register?");
                doregister.AddRequiredParam("StudentFullName", "May i know the the fullname of child as shown in their indenty card?");
                doregister.AddRequiredParam("StudentNRIC","How about BC / FIN / Passport?");
                doregister.AddRequiredParam("StudentBirthday", "Birthday (dd/mm/yyyy)?");
                doregister.AddRequiredParam("StudentAllergies", "Does your child have any allergies?");
                doregister.AddRequiredParam(WitContants.entity_grade, "What grade is your child in now?");
                doregister.AddRequiredParam("GuardianAddress", "May i know your full address?");
                doregister.AddRequiredParam("GuardianEmail", "Can i know your email address?");
                doregister.AddRequiredParam("GuardianMobile", "And your mobile number?");
                defs.Add(doregister);
            }

            return defs;
        }
    }

    public partial class IntentDefinition
    {
        string m_action;
        string m_action_salutation;
        string m_action_asktodo;
        public List<IntentParam> IntentParameters = new List<IntentParam>();

        public string Intent { get { return m_action; } }
        public string Intent_Salutation { get { return m_action_salutation; } }
        public string Intent_AskToDo { get { return m_action_asktodo; } }

        public IntentDefinition(string action, string action_salutation, string ask_to_do)
        {
            m_action = action;
            m_action_salutation = action_salutation;
            m_action_asktodo = ask_to_do;
        }

        public IntentParam AddRequiredParam(string paramName, string questionToAskIfMissing)
        {
            var param = new IntentParam() { ParamName = paramName, IsRequired=true, QuestionIfMissing = questionToAskIfMissing };
            IntentParameters.Add(param);
            return param;
        }

        public IntentParam AddOptionalParam(string paramName, string questionToAskIfMissing)
        {
            var param = new IntentParam() { ParamName = paramName, IsRequired = false, QuestionIfMissing = questionToAskIfMissing };
            IntentParameters.Add(param);
            return param;
        }

        public class IntentParam
        {
            public string ParamName;
            public string RequiredParamToTrigger;
            public bool IsRequired;
            public string Value;
            public string QuestionIfMissing;
            public string AfterAnswer;
        }
    }
}
