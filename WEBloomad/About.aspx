<%@ Page Title="Sisestatud loomade andmed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WEBloomad.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Loomade tabel</h2>
    <h2><%: Title %>.<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="loomID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." AllowSorting="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="loomID" HeaderText="loomID" InsertVisible="False" ReadOnly="True" SortExpression="loomID" />
            <asp:BoundField DataField="loomaNimi" HeaderText="loomaNimi" SortExpression="loomaNimi" />
            <asp:BoundField DataField="synniaeg" HeaderText="synniaeg" SortExpression="synniaeg" />
            <asp:BoundField DataField="omanikID" HeaderText="omanikID" SortExpression="omanikID" />
            <asp:BoundField DataField="nimi" HeaderText="nimi" SortExpression="nimi" />
            <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudSaikoConnectionString1 %>" DeleteCommand="DELETE FROM [loomad] WHERE [loomID] = @loomID" InsertCommand="INSERT INTO [loomad] ([loomaNimi], [synniaeg], [omanikID]) VALUES (@loomaNimi, @synniaeg, @omanikID)" SelectCommand="SELECT loomad.loomID, loomad.loomaNimi, loomad.synniaeg, loomad.omanikID, omanik.nimi, omanik.telefon FROM loomad INNER JOIN omanik ON loomad.omanikID = omanik.omanikID" UpdateCommand="UPDATE [loomad] SET [loomaNimi] = @loomaNimi, [synniaeg] = @synniaeg, [omanikID] = @omanikID WHERE [loomID] = @loomID">
            <DeleteParameters>
                <asp:Parameter Name="loomID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="loomaNimi" Type="String" />
                <asp:Parameter DbType="Date" Name="synniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="loomaNimi" Type="String" />
                <asp:Parameter DbType="Date" Name="synniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
                <asp:Parameter Name="loomID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</h2>
    <h3>&nbsp;</h3>
    <p>&nbsp;</p>
</asp:Content>
