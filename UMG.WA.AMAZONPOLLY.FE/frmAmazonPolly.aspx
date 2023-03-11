<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAmazonPolly.aspx.cs" Inherits="UMG.WA.AMAZONPOLLY.FE.frmAmazonPolly" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>AWS</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="fontawesome-free-6.2.1-web/css/fontawesome.min.css" rel="stylesheet" />
    <script src="fontawesome-free-6.2.1-web/js/fontawesome.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <%--GIF CARGANDO CUANDO SE REALIZA UN PROCESO--%>
        <asp:UpdateProgress ID="UpdateProgress3" runat="server">
            <ProgressTemplate>
                <div class="modalcargando">
                    <div class="center">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/loader.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <%--SCRIPT MANAGER--%>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <%--//Formatos PRINCIPAL*************************--%>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <br />
                <div class="container" style="margin-top: 15px">
                    <div class="card">
                        <%--HEADER PRINCIPAL DEL PROYECTO--%>
                        <h4 class="card-header">Amazon Polly</h4>

                        <%-- <<%--BODDY PRINCIPAL DEL PROYECTO--%>
                        <div class="card-body">
                            <section class="vh-50">
                                <div class="container py-1 h-50">
                                    <div class="row d-flex align-items-center justify-content-center h-50">
                                        <div class="col-md-8 col-lg-7 col-xl-4">
                                            <asp:Image ID="ImLoginAdmin711" runat="server" ImageUrl="~/img/amazonPolly.png"
                                                class="img-fluid" alt="Sistema de Pedidos" />
                                        </div>
                                        <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                                            <div class="divider d-flex align-items-center my-3">
                                                <p class="text-left fw-bold mx-10 mb-0 text-muted">Texto a voz</p>
                                            </div>
                                            <asp:Panel ID="PinicioSesion" runat="server" DefaultButton="btnEscuchar">
                                                <!-- Usuario-->
                                                <div class="form-outline mb-4">
                                                    <asp:Label ID="lblVoz" CssClass="form-label" Font-Bold="true" runat="server" Text="Voz"></asp:Label>
                                                    <asp:DropDownList ID="ddlVoz" runat="server" CssClass="form-select" AutoPostBack="True">
                                                        <asp:ListItem Value="Lucia, Mujer"></asp:ListItem>
                                                        <asp:ListItem Value="Conchita, Mujer"></asp:ListItem>
                                                        <asp:ListItem Value="Enrique, hombre"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                                <!-- Contraseña input -->
                                                <div class="form-outline mb-4">
                                                    <asp:Label ID="lblTextoEntrada" CssClass="form-label" Font-Bold="true" runat="server" Text="Texto de entrada"></asp:Label>
                                                    <asp:TextBox ID="txtTextoEntrada" CssClass="form-control" Rows="3" placeholder="¡Hola! Me llamo Lucía. Puedo leer cualquier texto que escribas." TextMode="MultiLine" runat="server"></asp:TextBox>
                                                </div>

                                                <!-- Submit button -->
                                                <asp:LinkButton ID="btnEscuchar" runat="server" OnClick="btnEscuchar_Click" Font-Bold="true" type="submit" class="btn btn-warning btn-lg btn-block">Escuchar</asp:LinkButton>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <%-- PARTE DEL FOOTER PRINCIPAL DEL PROYECTO --%>
                        <div class="card-footer text-muted">
                            <div class="row">
                                <h5>Web service - texto a voz</h5>
                            </div>
                        </div>
                    </div>
                </div>
                </div>           
            </ContentTemplate>
        </asp:UpdatePanel>

        <%--JAVA SCRIPT FUNCIONES PRINCIPALES--%>
        <script src="Scripts/jquery-3.6.3.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <script src="Scripts/alertaMensaje.js"></script>
        <script type="text/javascript">    

</script>
    </form>
</body>
</html>
