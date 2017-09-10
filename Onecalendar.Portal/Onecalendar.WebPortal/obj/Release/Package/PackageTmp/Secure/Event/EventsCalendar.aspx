<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModern.Master" AutoEventWireup="true" CodeBehind="EventsCalendar.aspx.cs" Inherits="Onecalendar.WebPortal.Secure.EventsCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>

        $(document).ready(function () {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                },
                //defaultDate: '2017-02-10',
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                timeFormat: 'H(:mm)', // uppercase H for 24-hour clock
                events: {
                    url: '/Tuition/Handler/JsonCalendarHandler.ashx',
                    type: 'POST',
                    error: function () {
                        alert('there was an error while fetching events!');
                    },
                    //color: 'yellow',   // a non-ajax option
                    //textColor: 'black' // a non-ajax option
                }
            });
            $.ajax({
                //url: "/Tuition/Handler/JsonCalendarHandler.ashx",
                success: function (data) {
                    //alert(data);
                    var source = {
                        events: [
                              {
                                  title: data.title,
                                  start: data.start,
                                  end: data.end,
                                  url: data.url
                              }
                        ]
                    };
                    //alert(source);
                    $('#calendar').fullCalendar('addEventSource', source);
                }
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mbr-section mbr-after-navbar" style="background-color: rgb(255, 255, 255); padding-top: 120px; padding-bottom: 120px;">
        <div style="border: dotted; border-color: goldenrod; margin: 0 10%; padding: 20px;">
            <div id='calendar'></div>
        </div>
    </div>
</asp:Content>
