<%@Page Language="VB" %>
<%@Import Namespace="System.Web.Security" %>
<script language="VB" runat="server">
Sub ProcessLogin(objSender As Object, objArgs As EventArgs)

  If FormsAuthentication.Authenticate(txtUser.Text, txtPassword.Text) Then
     FormsAuthentication.RedirectFromLoginPage(txtUser.Text, chkPersistLogin.Checked)
  Else
     ErrorMessage.InnerHtml = "<b>Something went wrong...</b> please re-enter your credentials..."
  End If

End Sub
</script>
<html>
<head>
<title>Standard Forms Authentication Login Form</title>
</head>

<body bgcolor="#FFFFFF" text="#000000">
Username: jeff<br />
Password: test 
<hr />
<form runat="server">
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80">Username : </td>
    <td width="10">&nbsp;</td>
    <td><asp:TextBox Id="txtUser" width="150" runat="server"/></td>
  </tr>
  <tr>
    <td>Password : </td>
    <td width="10">&nbsp;</td>
    <td><asp:TextBox Id="txtPassword" width="150" TextMode="Password" runat="server"/></td>
  </tr>
  <tr>
  <tr>
    <td></td>
    <td width="10">&nbsp;</td>
    <td><asp:CheckBox id="chkPersistLogin" runat="server" />Remember my credentials<br>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="10">&nbsp;</td>
    <td><asp:Button Id="cmdLogin" OnClick="ProcessLogin" Text="Login" runat="server" /></td>
  </tr>
</table>
<br>
<br>
<div id="ErrorMessage" runat="server" />
</form>
</body>
</html>