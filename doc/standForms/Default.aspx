<%@Page Language="VB" %>
<%@Import Namespace="System.Web.Security" %>
<script language="vb" runat="server">
Sub SignOut(objSender As Object, objArgs As EventArgs)
  'delete the users auth cookie and sign out
  FormsAuthentication.SignOut()
  'redirect the user to their referring page
  Response.Redirect(Request.UrlReferrer.ToString())
End Sub
Sub Page_Load()
  'verify authentication
  If User.Identity.IsAuthenticated Then
    'display Credential information
    displayCredentials.InnerHtml = "Current User : <b>" & User.Identity.Name & "</b>" & _
                                                  "<br><br>Authentication Used : <b>" & User.Identity.AuthenticationType & "</b>"
  Else
    'Display Error Message
    displayCredentials.InnerHtml = "Sorry, You have not been authenticated."
  End If
End Sub
</script>
<html>
<head>
	<title>Forms Authentication</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<span class="Header">Forms Based Authentication using standard method</span>
<br>
<br>
<div id="displayCredentials" runat="server" />
<br>
<br>
<form runat="server">
  <asp:Button id="cmdSignOut" text="Sign Out" runat="server" onClick="SignOut" />
</form>
</body>
</html>
