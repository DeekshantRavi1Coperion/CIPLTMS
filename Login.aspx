<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CIPLTMS</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Home.css" rel="stylesheet" type="text/css" />
    <link href="Styles/ClearCrossInTextbox.css" rel="stylesheet" type="text/css" />
    
    
    <link rel="icon" href="Images/Icon04.png" />

    <script type="text/javascript">

        function EnableUserName() {
            document.getElementById('<%=txtUserNameNew.ClientID %>').value = '';
            document.getElementById('<%=txtUserNameNew.ClientID %>').disabled = false;

            document.getElementById('<%=txtEmployeeID.ClientID %>').value = '';
            document.getElementById('<%=txtEmployeeID.ClientID %>').disabled = true;

            document.getElementById('<%=txtEmployeeID.ClientID %>').style.borderColor = "";
        }

        function EnableEmployeeID() {
            document.getElementById('<%=txtUserNameNew.ClientID %>').value = '';
            document.getElementById('<%=txtUserNameNew.ClientID %>').disabled = true;

            document.getElementById('<%=txtEmployeeID.ClientID %>').value = '';
            document.getElementById('<%=txtEmployeeID.ClientID %>').disabled = false;

            document.getElementById('<%=txtUserNameNew.ClientID %>').style.borderColor = "";
        }

        function ValidateUserName() {
            var UserName = document.getElementById('<%=txtUserName.ClientID %>').value;
            if (UserName == '') {
                document.getElementById('<%=txtUserName.ClientID %>').style.borderColor = "#F7627F";
                return true;
            }
            else {
                document.getElementById('<%=txtUserName.ClientID %>').style.borderColor = "";
                return false;
            }
        }

        function ValidatePassword() {
            var Password = document.getElementById('<%=txtPassword.ClientID %>').value;
            if (Password == '') {
                document.getElementById('<%=txtPassword.ClientID %>').style.borderColor = "#F7627F";
                return true;
            }
            else {
                document.getElementById('<%=txtPassword.ClientID %>').style.borderColor = "";
                return false;
            }
        }

        function ValidateUserNameNew() {
            var UserNameNew = document.getElementById('<%=txtUserNameNew.ClientID %>').value;
            if (UserNameNew == '') {
                document.getElementById('<%=txtUserNameNew.ClientID %>').style.borderColor = "#F7627F";
                return true;
            }
            else {
                document.getElementById('<%=txtUserNameNew.ClientID %>').style.borderColor = "";
                return false;
            }
        }


        function ValidateEmployeeID() {
            var EmployeeID = document.getElementById('<%=txtEmployeeID.ClientID %>').value;
            if (EmployeeID == '') {
                document.getElementById('<%=txtEmployeeID.ClientID %>').style.borderColor = "#F7627F";
                return true;
            }
            else {
                document.getElementById('<%=txtEmployeeID.ClientID %>').style.borderColor = "";
                return false;
            }
        }


        function ValidateAll() {
            var UserName = document.getElementById('<%=txtUserName.ClientID %>').value;
            if (UserName == '') {
                document.getElementById('<%=txtUserName.ClientID %>').style.borderColor = "#F7627F";
                return false;
            }

            var Password = document.getElementById('<%=txtPassword.ClientID %>').value;
            if (Password == '') {
                document.getElementById('<%=txtPassword.ClientID %>').style.borderColor = "#F7627F";
                return false;
            }

            return (true);
        }

        function ValidateAllNew() {

            if (document.getElementById('<%=rdUserName.ClientID %>').checked == true) {
                var UserNameNew = document.getElementById('<%=txtUserNameNew.ClientID %>').value;
                if (UserNameNew == '') {
                    document.getElementById('<%=txtUserNameNew.ClientID %>').style.borderColor = "#F7627F";
                    return false;
                }
            }

            if (document.getElementById('<%=rdEmployeeID.ClientID %>').checked == true) {
                var EmployeeID = document.getElementById('<%=txtEmployeeID.ClientID %>').value;
                if (EmployeeID == '') {
                    document.getElementById('<%=txtEmployeeID.ClientID %>').style.borderColor = "#F7627F";
                    return false;
                }
            }

            return (true);
        }

        function ValidateForgetPassword() {
            if (document.getElementById('<%=chkForgetPassword.ClientID %>').checked == true) {
                alert("hello");
            }
        }
    </script>

    <style type="text/css">
        body
        {
            background: url(Images/COPERION/coperion_logo02.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<video id="bgvid" playsinline autoplay muted loop>
            <source src="VIDEOS/SetangiBeach1.mp4" type="video/mp4"/>
            <source src="VIDEOS/SetangiBeach1.mov" type="video/mov"/>            
        </video>--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <%--<asp:UpdatePanel ID="uppanel" runat="server">
            <ContentTemplate>--%>
        <div align="center" style="margin-top: 130px;">
            <fieldset style="width: 25%;">
                <legend style="text-align: center; color: White;">Login Here</legend>
                <table width="100%">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="color: White; width: 30%;">
                            User Name:
                        </td>
                        <td>
                            <%--<asp:TextBox ID="txtUserName" runat="server" Width="100%" onblur="return ValidateUserName();" />--%>
                            <input id="txtUserName" type="text" style="width: 100%;" onblur="return ValidateUserName();"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="color: White;">
                            Password:
                        </td>
                        <td>
                            <%--<asp:TextBox ID="txtPassword" runat="server" Width="100%" onblur="return ValidatePassword();" />--%>
                            <input id="txtPassword" type="password" style="width: 100%;" onblur="return ValidatePassword();"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnLogin" CssClass="button" Width="100%" runat="server" Text="Login"
                                OnClientClick="return ValidateAll();" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:CheckBox ID="chkForgetPassword" Text="Forget Password?" runat="server" OnCheckedChanged="chkForgetPassword_CheckedChanged"
                                AutoPostBack="true" />
                            <%--OnChange="ValidateForgetPassword();" --%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <asp:Panel ID="pnlForgetPassword" Visible="false" runat="server">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RadioButton ID="rdUserName" Text="By User Name" runat="server" Checked="true"
                                    GroupName="ForgetPassword" Onchange="EnableUserName();" />
                                <asp:RadioButton ID="rdEmployeeID" Text="By Employee ID" runat="server" ValidationGroup="ForgetPassword"
                                    Onchange="EnableEmployeeID();" GroupName="ForgetPassword" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="color: White;">
                                User Name:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserNameNew" runat="server" Width="100%" onblur="return ValidateUserNameNew();" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="color: White;">
                                Employee ID:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmployeeID" runat="server" Width="100%" Enabled="false" onblur="return ValidateEmployeeID();" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnSendPassword" CssClass="button" Width="100%" runat="server" Text="Send Password"
                                    OnClientClick="return ValidateAllNew();" OnClick="btnSendPassword_Click" />
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td align="center">
                            <asp:Panel ID="pnlMsg" Visible="false" runat="server" Height="50px">
                                <asp:Label ID="lblMsg" runat="server" Visible="true" Font-Bold="true" />
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    </form>
</body>
</html>
