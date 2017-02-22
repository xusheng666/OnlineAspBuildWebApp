<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventsCalendar.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.EventsCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Content/css/fullcalendar.css")%>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= ResolveUrl("~/Content/js/jquery.min.js")%>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/Content/js/moment.min.js")%>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/Content/js/fullcalendar.js")%>"></script>
    <script>

        $(document).ready(function () {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                },
                defaultDate: '2017-02-12',
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: [
                    {
                        title: 'All Day Event',
                        start: '2017-02-01'
                    },
                    {
                        title: 'Long Event',
                        start: '2017-02-07',
                        end: '2017-02-10'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: '2017-02-09T16:00:00'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: '2017-02-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: '2017-02-11',
                        end: '2017-02-13'
                    },
                    {
                        title: 'Meeting',
                        start: '2017-02-12T10:30:00',
                        end: '2017-02-12T12:30:00'
                    },
                    {
                        title: 'Lunch',
                        start: '2017-02-12T12:00:00'
                    },
                    {
                        title: 'Meeting',
                        start: '2017-02-12T14:30:00'
                    },
                    {
                        title: 'Happy Hour',
                        start: '2017-02-12T17:30:00'
                    },
                    {
                        title: 'Dinner',
                        start: '2017-02-12T20:00:00'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2017-02-13T07:00:00'
                    },
                    {
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: '2017-02-28'
                    }
                ]
            });

        });

    </script>
    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div id='calendar'></div>
</asp:Content>
