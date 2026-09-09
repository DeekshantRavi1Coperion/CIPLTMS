<%@ Page Title="" Language="C#" MasterPageFile="~/HOME.master" AutoEventWireup="true"
    CodeFile="AddUpdateTicket.aspx.cs" Inherits="HR_TICKET_AddUpdateTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../../Styles/form.css" rel="stylesheet" />
    <link href="../../Styles/filter.css" rel="stylesheet" />
    <link href="../../Styles/grid.css" rel="stylesheet" />
    <link href="../../Styles/pupup.css" rel="stylesheet" />

    <link rel="icon" href="../Images/Icons/Icon04.png" />
    <link href="../../Styles/ClearCrossInTextbox.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        function ValidateTicketType() {
            var TicketType = document.getElementById('<%=ddlTicketType.ClientID %>').selectedIndex;
            if (TicketType == '' || TicketType == '0') {
                document.getElementById('<%=ddlTicketType.ClientID %>').style.borderColor = "#F7627F";
                return true;
            }
            else {
                document.getElementById('<%=ddlTicketType.ClientID %>').style.borderColor = "";
                return false;
            }
        }
        function ValidateTicketSubtype() {
            var TicketSubtype = document.getElementById('<%=ddlTicketSubtype.ClientID %>').selectedIndex;
            if (TicketSubtype == '' || TicketSubtype == '0') {
                document.getElementById('<%=ddlTicketSubtype.ClientID %>').style.borderColor = "#F7627F";
                return true;
            }
            else {
                document.getElementById('<%=ddlTicketSubtype.ClientID %>').style.borderColor = "";
                return false;
            }
        }

        function ValidatefileUploadAttachment1() {
            var allowedFiles = [".jpg", ".jpeg", ".bmp", ".png", ".gif", ".pdf", ".JPG", ".JPEG", ".BMP", ".PNG", ".GIF", ".PDF"];
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(" + allowedFiles.join('|') + ")$");
            var fileUploadAttachment1 = document.getElementById('<%=fileUploadAttachment1.ClientID %>').value;
            var divfileUploadAttachment1 = document.getElementById("divfileUploadAttachment1");
            var lblfileUploadAttachment1 = document.getElementById('<%=lblfileUploadAttachment1.ClientID %>');

            if (fileUploadAttachment1 == '') {
                document.getElementById('<%=fileUploadAttachment1.ClientID %>').style.borderColor = "";
                divfileUploadAttachment1.style.display = "none";
                lblfileUploadAttachment1.innerHTML = "";
                return false;
            }
            else {
                if (!regex.test(fileUploadAttachment1.toLowerCase())) {
                    document.getElementById('<%=fileUploadAttachment1.ClientID %>').style.borderColor = "#F7627F";
                    divfileUploadAttachment1.style.display = "block";
                    lblfileUploadAttachment1.innerHTML = "Please enter only .pdf, .jpg, .jpeg, .bmp, .png, .gif file!";
                    return true;
                }
                else {
                    document.getElementById('<%=fileUploadAttachment1.ClientID %>').style.borderColor = "";
                    divfileUploadAttachment1.style.display = "none";
                    lblfileUploadAttachment1.innerHTML = "";
                    return false;
                }
            }
        }

        function ValidateTicketDescription() {
            var TicketDescription = document.getElementById('<%=txtTicketDescription.ClientID %>').value;
            if (TicketDescription == '') {
                document.getElementById('<%=txtTicketDescription.ClientID %>').style.borderColor = "#F7627F";
                return true;
            }
            else {
                document.getElementById('<%=txtTicketDescription.ClientID %>').style.borderColor = "";
                return false;
            }
        }

        function ValidateAll() {
            if (ValidateTicketType()) { return false; }

            var TicketType = document.getElementById('<%=ddlTicketType.ClientID %>').selectedIndex;
            if (TicketType == 1) {
                if (ValidateTicketSubtype()) { return false; }
            }

            if (ValidatefileUploadAttachment1()) { return false; }
            if (ValidateTicketDescription()) { return false; }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%--<asp:UpdatePanel ID="uppanel" runat="server">
        <ContentTemplate>--%>

    <div class="form-container">
        <fieldset class="form-card">
            <legend>Create Ticket</legend>

            <div class="form-grid form-grid-2">
                <label>Ticket Type</label>
                <asp:DropDownList ID="ddlTicketType"
                    runat="server"
                    OnSelectedIndexChanged="ddlTicketType_SelectedIndexChanged"
                    AutoPostBack="true"
                    CssClass="form-control">
                </asp:DropDownList>

                <label>Ticket Subtype</label>
                <asp:DropDownList ID="ddlTicketSubtype"
                    runat="server"
                    CssClass="form-control">
                </asp:DropDownList>

                <label>Attachment</label>
                <table>
                    <tr>
                        <td>
                            <asp:FileUpload ID="fileUploadAttachment1" runat="server"
                                BorderStyle="Groove"
                                CssClass="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="divfileUploadAttachment1" style="display: none;">
                                <asp:Label ID="lblfileUploadAttachment1" runat="server" ForeColor="Red" />
                            </div>
                        </td>
                    </tr>
                </table>

            </div>

            <div class="form-grid form-grid-2">

                <label>Description</label>
                <div class="full-width">
                    <asp:TextBox ID="txtTicketDescription"
                        Enabled="true"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="2" />
                </div>


                <label>Remarks</label>
                <div class="full-width">
                    <asp:TextBox ID="txtTicketRemarks"
                        Enabled="true"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="2" />
                </div>

            </div>
        </fieldset>

        <div class="full-width button-group">
            <asp:Button ID="btnCreate"
                runat="server"
                Text="Create"
                CssClass="button"
                OnClientClick="return ValidateAll();"
                OnClick="btnCreate_Click" Width="50%" />

            <asp:Button ID="btnTicketList"
                runat="server"
                Text="Ticket List"
                CssClass="button"
                OnClick="btnTicketList_Click" Width="50%" />
        </div>
        <div class="full-width">
            <asp:Panel ID="pnlMsg" Visible="false" runat="server" Height="50px">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Large" />
            </asp:Panel>
        </div>

    </div>

    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
