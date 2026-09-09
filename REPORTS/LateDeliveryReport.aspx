<%@ Page Title="Project - Late Delivery Report" Language="C#" AutoEventWireup="true" MasterPageFile="~/HOME.master" CodeFile="LateDeliveryReport.aspx.cs" Inherits="REPORTS_Project___Late_Order_Delivery_Date" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="icon" href="../Images/Icon04.png" />
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/HomeNew.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/ClearCrossInTextbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function preventInput(event) {
            if (event.which != 9) {
                event.preventDefault();
            }
        }

    </script>

    
    <script type="text/javascript" language="javascript">
        function onCalendarShown() {
            var cal = $find("calendarPostingMonth");
            cal._switchMode("months", true);
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);
                    }
                }
            }
        }

        function onCalendarHidden() {
            var cal = $find("calendarPostingMonth");
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call);
                    }
                }
            }
        }

        function call(eventElement) {
            var target = eventElement.target;
            switch (target.mode) {
                case "month":
                    var cal = $find("calendarPostingMonth");
                    cal.set_selectedDate(target.date);
                    cal._blur.post(true);
                    cal.raiseDateSelectionChanged(); break;
                    break;
            }
        }

        function preventInput(event) {
            if (event.which != 9) {
                event.preventDefault();
            }
        }
    </script>

    <script type="text/javascript">
        window.onload = function () {
            var div = document.getElementById("dvScroll");
            var div_position = document.getElementById("div_position");
            var position = parseInt('<%=Request.Form["div_position"] %>');
            if (isNaN(position)) {
                position = 0;
            }
            div.scrollTop = position;
            div.onscroll = function () {
                div_position.value = div.scrollTop;
            };
        };
    </script>

     <script type="text/javascript">

         function pageLoad() {
             document.getElementById('<%=txtPostingMonth.ClientID %>').value = document.getElementById('<%=hdPostingMonth.ClientID %>').value;
        }

        function clientChangedPostingMonth(sender, args) {
             document.getElementById('<%=hdPostingMonth.ClientID %>').value = document.getElementById('<%=txtPostingMonth.ClientID %>').value;
         }

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ToolkitScriptManager ID="ScriptManager2" runat="server">
    </asp:ToolkitScriptManager>
    <%-- <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajax:ToolkitScriptManager>--%>

    <div align="center" style="margin-top: 20px;">
        <fieldset style="width: 50%">
            <legend style="text-align: center;">OTD Report</legend>
            <table width="70%">
                <tr>

                    <td>Month:</td>
                    <td>&nbsp;</td>
                    <td>
                        <table width="80%">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtPostingMonth" runat="server" onkeyDown="javascript:preventInput(event);" Width="100%"></asp:TextBox>
                                    <asp:HiddenField ID="hdPostingMonth" runat="server" />
                                    <asp:CalendarExtender ID="calendarPostingMonth" runat="server" OnClientHidden="onCalendarHidden"
                                        PopupButtonID="imgbtnPostingMonth" OnClientShown="onCalendarShown" Format="MM/yyyy"
                                        BehaviorID="calendarPostingMonth" TargetControlID="txtPostingMonth" OnClientDateSelectionChanged="clientChangedPostingMonth">
                                    </asp:CalendarExtender>
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPostingMonth"
                                        FilterType="Custom, Numbers" ValidChars="/" Enabled="True" />
                                </td>
                                <td align="right">
                                    <asp:ImageButton ID="imgbtnPostingMonth" runat="server" ImageUrl="~/Images/Calendar2.png"
                                        ToolTip="Posting Month Calendar" Width="20px" />
                                </td>
                            </tr>
                        </table>
                    </td>

                    <%--<td>&nbsp;</td>--%>

                    <td >
                        <asp:Button ID="btnSearch" width="80%" CssClass="button" runat="server" Text="Search" OnClick="btnSearch_Click"/>
                    </td>
                     <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnExport" CssClass="button" Width="100%" runat="server" Text="Export"
                            OnClick="btnExport_Click" />
                    </td>

                </tr>
            </table>
        </fieldset>
        <br />
        <div align="center">
            <asp:Panel ID="pnlMsg" Visible="false" runat="server">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="true" Font-Size="Large" />
            </asp:Panel>
        </div>

        <div align="center">
            <fieldset style="width: 95%;">
                <legend style="text-align: center;">
                    <asp:Label ID="lblRecords" runat="server" Text="Records[0]" /></legend>
                <div style='overflow: auto; width: 100%; height: 500px; border: 1px solid lightgray;'>
                    <asp:GridView ID="gvOTDDetailReport" runat="server" AutoGenerateColumns="true" CellPadding="4"
                        ForeColor="#333333" GridLines="Vertical" PageSize="20" Width="100%" HorizontalAlign="Center"
                        AllowPaging="false">
                        <RowStyle BackColor="#E3EAEB" HorizontalAlign="Left" />

                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </div>
            </fieldset>
        </div>

    </div>

</asp:Content>










