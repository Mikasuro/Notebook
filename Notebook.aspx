<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notebook.aspx.cs" Inherits="Notebook1.Notebook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Записная книжка</title>
    <link rel="stylesheet" href="Styles.css" />
</head>
<body>
    <form id="form" runat="server">
        <div>
            <h1>Записная книжка</h1>
        </div>
        <div>
            <label>Имя:</label><asp:Textbox runat ="server" type="text" id="tbName" /></div>
        <div>
            <label>Фамилия:</label><asp:Textbox runat ="server" type="text" id="tbLastName" /></div>
        <div>
            <label>Электронная почта:</label><asp:Textbox runat ="server" type="text" id="tbEmail" /></div>
        <div>
            <label>Телефон:</label><asp:Textbox runat ="server" type="text" id="tbPhone" /></div>
        <div>
            <asp:Button runat="server" id="btnSave" Text="Сохранить" OnClick="btnSave_Click" />
        </div>
        <br />
        <div class="div">
            <asp:SqlDataSource ID="dataSourse" runat="server"
                ConnectionString="data source=(LocalDb)\NotebookDB;initial catalog=Notebook;integrated security=True;"
                SelectCommand="SELECT * FROM [Friends]" />
            <asp:GridView  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ID="GridView1" runat="server"
                DataSourceID="dataSourse" DataKeyNames="id" AutoGenerateColumns="False"
                Font-Names="Trebuchet MS" Font-Size="Small" ForeColor="#333333" GridLines="None"
                RowStyle-CssClass="Row">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#28a4fb" Font-Bold="True" ForeColor="White" CssClass="Header" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField ="id" HeaderText ="Номер" />
                    <asp:BoundField DataField="name" HeaderText="Имя">
                        <ItemStyle  Width="100" />
                    </asp:BoundField>
                    <asp:BoundField DataField="lastName" HeaderText="Фамилия">
                        <ItemStyle Width="100" />
                    </asp:BoundField>
                    <asp:BoundField DataField="email" HeaderText="Электронная почта">
                        <ItemStyle Width="200" />
                    </asp:BoundField>
                    <asp:BoundField DataField="phone" HeaderText="Телефон">
                        <ItemStyle Width="200" />
                    </asp:BoundField>
                    <asp:ButtonField CommandName ="Select" ButtonType="Button" Text ="Удалить" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
