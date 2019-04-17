<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customers List</title>
    <link href="./Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <center>
    <br />
        <form id="form1" runat="server">
        <asp:ListView ID="CustomersListView" DataSourceID="CustomersXMLDataSource" runat="server">
            <LayoutTemplate>
                <table cellpadding="2" runat="server" id="TblCustomers" class="TableContainer">
                    <tr id="Tr0" runat="server">
                        <td colspan="8">
                            <h2>
                                Customers List</h2>
                        </td>
                    </tr>
                    <tr id="Tr1" runat="server">
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            Last Name
                        </th>
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            First Name
                        </th>
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            Street Address
                        </th>
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            City
                        </th>
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            State
                        </th>
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            Zip Code
                        </th>
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            Phone Type
                        </th>
                        <th runat="server" style="padding:5px 20px 5px 20px; color:Yellow;">
                            Phone Number
                        </th>
                    </tr>
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr runat="server">
                    <td>
                        <%# XPath("LastName")%>
                    </td>
                    <td>
                        <%# XPath("FirstName")%>
                    </td>
                    <td>
                        <%# XPath("Address/StreetAddress")%>
                    </td>
                    <td>
                        <%# XPath("Address/City")%>
                    </td>
                    <td>
                        <%# XPath("Address/State")%>
                    </td>
                    <td>
                        <%# XPath("Address/ZipCode")%>
                    </td>
                    <td>
                        <%# XPath("Phone/PhoneType")%>
                    </td>
                    <td>
                        <%# XPath("Phone/PhoneNumber")%>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <asp:XmlDataSource ID="CustomersXMLDataSource" runat="server" DataFile="XML//Customers.XML"
            XPath="//ArrayOfClassPerson/ClassPerson"></asp:XmlDataSource>
        </form>
        <br />
        <br />
        <a href="FormCustomerEntry.aspx">Back to the Customer Entry Page</a>
    </center>
</body>
</html>
