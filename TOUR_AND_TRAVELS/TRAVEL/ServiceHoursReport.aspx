<%@ Page Title="" Language="C#" MasterPageFile="~/HOME.master" AutoEventWireup="true"
    CodeFile="ServiceHoursReport.aspx.cs" Inherits="TOUR_AND_TRAVELS_TRAVEL_ServiceHoursReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/HomeNew.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../Images/Icons/Icon04.png" />
    <link href="../../Styles/ClearCrossInTextbox.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 1000;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <ajax:ToolkitScriptManager ID="ScriptManager2" runat="server">
    </ajax:ToolkitScriptManager>

    <div align="center" style="margin-top: 20px;">
        <fieldset style="width: 90%">
            <legend style="text-align: center;">Service Working Report</legend>
            <table width="100%">
                <tr>
                    <td align="center" style="padding: 20px 0;">
                        <span style="font-weight: bold; margin-right: 5px;">Employee:</span>
                        <asp:DropDownList ID="ddlEmployee" runat="server" style="margin-right: 30px; padding: 4px;">
                        </asp:DropDownList>

                        <span style="font-weight: bold; margin-right: 5px;">Year:</span>
                        <asp:DropDownList ID="ddlYear" runat="server" style="margin-right: 30px; padding: 4px;">
                        </asp:DropDownList>

                        <span style="font-weight: bold; margin-right: 5px;">Month:</span>
                        <asp:DropDownList ID="ddlMonth" runat="server" style="margin-right: 30px; padding: 4px;">
                        </asp:DropDownList>

                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" style="padding: 4px 20px; cursor: pointer;" />
                   
                    <asp:Button ID="btnExport" runat="server" Text="Export" OnClick="btnExport_Click" style="padding: 4px 20px; cursor: pointer; margin-left: 10px;" />    
                    
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <br />

    <div align="center">
        <asp:Panel ID="pnlMsg" Visible="false" runat="server">
            <asp:Label ID="lblMsg" runat="server" Font-Bold="true" Font-Size="Large" />
        </asp:Panel>
    </div>
    <br />
    
    <div align="center">
        <fieldset style="width: 95%;">
            <legend style="text-align: center;">
                <asp:Label ID="lblRecords" runat="server" Text="Records[0]"></asp:Label>
            </legend>
            <div style='overflow: auto; width: 100%; height: auto; border: 1px solid lightgray;'>
                
                <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False"
                    CellPadding="8" ForeColor="#333333" GridLines="Both" PageSize="15" Width="100%"
                    HorizontalAlign="Center" OnRowDataBound="gvReport_RowDataBound" AllowPaging="True"
                     ShowFooter="True">
                    
                    <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" Height="35px" />
                    
                    <Columns>
                        <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                        <asp:BoundField DataField="Year" HeaderText="Year" />
                        <asp:BoundField DataField="Month" HeaderText="Month" />
                        <asp:BoundField DataField="WorkingHours" HeaderText="Working Hours" DataFormatString="{0:0.##}" />
                        <asp:BoundField DataField="TrainingHours" HeaderText="Training Hours" DataFormatString="{0:0.##}" />
                        <asp:BoundField DataField="TravellingHours" HeaderText="Travelling Hours" DataFormatString="{0:0.##}" />
                    </Columns>
                    
                    <FooterStyle BackColor="#bfbfbf" ForeColor="Black" Font-Bold="True" HorizontalAlign="Center" Height="35px" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#bfbfbf" Font-Bold="True" ForeColor="Black" Height="40px" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" Height="35px" />
                </asp:GridView>

            </div>
        </fieldset>
    </div>
</asp:Content>
