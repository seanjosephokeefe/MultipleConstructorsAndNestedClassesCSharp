<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCustomerEntry.aspx.cs" Inherits="MultipleConstructorsAndNestedClasses.FormCustomer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Entry Form</title>
    <link href="./Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<br />
    <form id="form1" runat="server">
    <center>
        <table class="TableContainer">
            <tr>
                <td colspan="3">
                    <h1>
                        Enter Customer Information:</h1>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" CssClass="Label"  runat="server" Text="First Name" />&nbsp;
                    <asp:Label ID="LblFNameError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)" Visible="false" />
                    <br />
                    <asp:TextBox ID="TxtBoxFName" runat="server" Width="190px" />
                </td>
                <td colspan="2">
                    <asp:Label ID="Label2" CssClass="Label"  runat="server" Text="Last Name" />&nbsp;
                    <asp:Label ID="LblLNameError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)" Visible="false" /><br />
                    <asp:TextBox ID="TxtBoxLName" runat="server" Width="230px" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label3" CssClass="Label"  runat="server" Text="Street Address" />&nbsp;
                    <asp:Label ID="LblStreetError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)" Visible="false" /><br />
                    <asp:TextBox ID="TxtBoxStreet" runat="server" Width="480px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" CssClass="Label"  runat="server" Text="City" />&nbsp;
                    <asp:Label ID="LblCityError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)" Visible="false" /><br />
                    <asp:TextBox ID="TxtBoxCity" runat="server" Width="200px" />
                </td>
                <td>
                    <asp:Label ID="Label5" CssClass="Label"  runat="server" Text="State" />&nbsp;
                    <asp:Label ID="LblStateError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)" Visible="false" /><br />
                    <asp:DropDownList ID="DDState" runat="server" Width="80" >
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label6" CssClass="Label"  runat="server" Text="Zip Code" />&nbsp;
                    <asp:Label ID="LblZipCodeError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)" Visible="false" /><br />
                    <asp:TextBox ID="TxtBoxZipCode" runat="server" Width="100px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" CssClass="Label"  runat="server" Text="Phone Number" />&nbsp;
                    <asp:Label ID="LblPhoneError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)" Visible="false" /><br />
                    <asp:TextBox ID="TxtBoxPhoneNumber" runat="server" Width="150px" />
                </td>
                <td colspan="2">
                    <asp:Label ID="Label8" CssClass="Label"  runat="server" Text="Phone Type" />&nbsp;
                    <asp:Label ID="LblPhoneTypeError" ForeColor="Red" Font-Bold="true" runat="server" Text="(*)"
                        Visible="false" /><br />
                    <asp:DropDownList ID="DDPhoneType" runat="server" Width="100">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" class="center">
                    <asp:Button ID="BtnAdd" runat="server" Text="Add Customer" OnClick="BtnAdd_Click" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnClear" runat="server" Text="Clear Form" OnClick="BtnClear_Click" />
                &nbsp;&nbsp;
                    <asp:Button ID="BtnSeeList" runat="server" Text="View Customers" onclick="BtnSeeList_Click" 
                         />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br /><br />
        <asp:Label ID="LblGeneralErrors" ForeColor="Red" Font-Bold="true" runat="server" Text="These fields need to be filled in."
            Visible="false" />
                    <asp:Label ID="LblCustomerAdded" Font-Bold="true" runat="server" Text="Customer Added."
            Visible="false" />
            <asp:Label ID="LblErrorFile" Font-Bold="true" ForeColor="Yellow" runat="server" Text="There are no customers to view yet."
            Visible="false" />
    </center>
    </form>
</body>
</html>
