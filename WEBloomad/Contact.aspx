<%@ Page Title="Loomade lisamine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WEBloomad.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>Looma lisamine</h2>
    <p>
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="loomID" DataSourceID="SqlDataSource1_loomad" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="loomID" HeaderText="loomID" InsertVisible="False" ReadOnly="True" SortExpression="loomID" />
                <asp:BoundField DataField="loomaNimi" HeaderText="loomaNimi" SortExpression="loomaNimi" />
                <asp:TemplateField HeaderText="synniaeg" SortExpression="synniaeg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("synniaeg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate='<%# Bind("synniaeg") %>' Width="152px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("synniaeg") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="omanikID" SortExpression="omanikID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("omanikID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1_omanik" DataTextField="nimi" DataValueField="omanikID" SelectedValue='<%# Bind("omanikID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_omanik" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudSaikoConnectionString1 %>" DeleteCommand="DELETE FROM [omanik] WHERE [omanikID] = @omanikID" InsertCommand="INSERT INTO [omanik] ([nimi]) VALUES (@nimi)" SelectCommand="SELECT [nimi], [omanikID] FROM [omanik]" UpdateCommand="UPDATE [omanik] SET [nimi] = @nimi WHERE [omanikID] = @omanikID">
                            <DeleteParameters>
                                <asp:Parameter Name="omanikID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="nimi" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="nimi" Type="String" />
                                <asp:Parameter Name="omanikID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("omanikID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CancelText="Loobu" InsertText="Lisa" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1_loomad" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudSaikoConnectionString1 %>" DeleteCommand="DELETE FROM [loomad] WHERE [loomID] = @loomID" InsertCommand="INSERT INTO [loomad] ([loomaNimi], [synniaeg], [omanikID]) VALUES (@loomaNimi, @synniaeg, @omanikID)" SelectCommand="SELECT * FROM [loomad]" UpdateCommand="UPDATE [loomad] SET [loomaNimi] = @loomaNimi, [synniaeg] = @synniaeg, [omanikID] = @omanikID WHERE [loomID] = @loomID">
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
    </p>
</asp:Content>
