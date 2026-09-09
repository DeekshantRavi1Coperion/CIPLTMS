<%@ Page Title="" Language="C#" MasterPageFile="~/HOME.master" AutoEventWireup="true"
    CodeFile="SiteReportEngineerWise.aspx.cs" Inherits="TOUR_AND_TRAVELS_TRAVEL_SiteReportEngineerWise" %>

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
            <legend style="text-align: center;">Site Report - Engineer Wise</legend>
            <table width="100%">
                <tr>
                    <td align="center" style="padding: 20px 0;">
                        
                        <span style="font-weight: bold; margin-right: 5px;">Year:</span>
                        <asp:DropDownList ID="ddlYear" runat="server" style="margin-right: 30px; padding: 4px;">
                            <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                            <asp:ListItem Text="2025" Value="2025"></asp:ListItem>
                            <asp:ListItem Text="2026" Value="2026"></asp:ListItem>
                            <asp:ListItem Text="2027" Value="2027"></asp:ListItem>
                            <asp:ListItem Text="2028" Value="2028"></asp:ListItem>
                            <asp:ListItem Text="2029" Value="2029"></asp:ListItem>
                            <asp:ListItem Text="2030" Value="2030"></asp:ListItem>
                            <asp:ListItem Text="2031" Value="2031"></asp:ListItem>
                        </asp:DropDownList>

                        <span style="font-weight: bold; margin-right: 5px;">Engineer:</span>
                        <asp:DropDownList ID="ddlEmployee" runat="server" style="margin-right: 30px; padding: 4px;">
                        </asp:DropDownList>

                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" style="padding: 4px 20px; cursor: pointer;" />
                        <asp:Button ID="btnExport" runat="server" Text="Export to Excel" OnClick="btnExport_Click" style="padding: 4px 20px; cursor: pointer; margin-left: 10px;" />
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
                
                <asp:GridView ID="gvLessonLearntList" runat="server" AutoGenerateColumns="False"
                    CellPadding="8" ForeColor="#333333" GridLines="Both" PageSize="15" Width="100%" 
                    HorizontalAlign="Center" OnRowDataBound="gvLessonLearntList_RowDataBound" AllowPaging="True"
                    OnPageIndexChanging="gvLessonLearntList_PageIndexChanging" ShowFooter="True">
                    
                    <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" Height="35px" />
                    
                    <Columns>
                        <asp:BoundField DataField="EngineerName" HeaderText="Engineer Name" />
                        <asp:BoundField DataField="WorkHours" HeaderText="Work Hours" />
                        <asp:BoundField DataField="TrainingHours" HeaderText="Training Hours" />
                        <asp:BoundField DataField="TotalHours" HeaderText="Total Hours" />
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