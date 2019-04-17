using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SerializeDeserializeCustomerData;
using System.IO;

namespace MultipleConstructorsAndNestedClasses
{
    public partial class FormCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDState.Items.Clear();
                DDState.Items.Add(" ");
                foreach (String state in Enum.GetNames(typeof(ClassAddress.EnumStateName)))
                {
                    DDState.Items.Add(state);
                }
                DDPhoneType.Items.Clear();
                DDPhoneType.Items.Add(" ");
                foreach (String pType in Enum.GetNames(typeof(ClassPhone.EnumPhoneType)))
                {
                    DDPhoneType.Items.Add(pType);
                }
            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            ClearLabels();
            Boolean correct = true;
            if (String.IsNullOrEmpty(TxtBoxFName.Text))
            {
                LblFNameError.Visible = true;
                correct = false;
            }
            if (String.IsNullOrEmpty(TxtBoxLName.Text))
            {
                LblLNameError.Visible = true;
                correct = false;
            }
            if (String.IsNullOrEmpty(TxtBoxStreet.Text))
            {
                LblStreetError.Visible = true;
                correct = false;
            }
            if (String.IsNullOrEmpty(TxtBoxCity.Text))
            {
                LblCityError.Visible = true;
                correct = false;
            }
            if (String.IsNullOrEmpty(TxtBoxZipCode.Text))
            {
                LblZipCodeError.Visible = true;
                correct = false;
            }
            if (String.IsNullOrEmpty(TxtBoxPhoneNumber.Text))
            {
                LblPhoneError.Visible = true;
                correct = false;
            }
            if (DDPhoneType.SelectedIndex == 0)
            {
                LblPhoneTypeError.Visible = true;
                correct = false;
            }
            if (DDState.SelectedIndex == 0)
            {
                LblStateError.Visible = true;
                correct = false;
            }
            if (!correct)
                LblGeneralErrors.Visible = true;
            else
            {
                ClassPhone cp = new ClassPhone((ClassPhone.EnumPhoneType)Enum.Parse(typeof(ClassPhone.EnumPhoneType),
                    DDPhoneType.SelectedValue), TxtBoxPhoneNumber.Text);

                ClassAddress ca = new ClassAddress(TxtBoxStreet.Text, TxtBoxCity.Text,
                    (ClassAddress.EnumStateName)Enum.Parse(typeof(ClassAddress.EnumStateName),
                    DDState.SelectedValue), TxtBoxZipCode.Text);

                ClassPerson cPerson1 = new ClassPerson(TxtBoxFName.Text, TxtBoxLName.Text, cp, ca);

                ClassPerson cPerson = new ClassPerson(TxtBoxFName.Text, TxtBoxLName.Text,
                    new ClassPhone((ClassPhone.EnumPhoneType)Enum.Parse(typeof(ClassPhone.EnumPhoneType),
                        DDPhoneType.SelectedValue), TxtBoxPhoneNumber.Text),
                        new ClassAddress(TxtBoxStreet.Text, TxtBoxCity.Text,
                            (ClassAddress.EnumStateName)Enum.Parse(typeof(ClassAddress.EnumStateName),
                            DDState.SelectedValue), TxtBoxZipCode.Text));
                SerializeCustomerList.SerializePeople(cPerson);
                ClearFields();
                ClearLabels();
                LblCustomerAdded.Visible = true;
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
            ClearLabels();
        }

        private void ClearLabels()
        {
            LblCustomerAdded.Visible = false;
            LblFNameError.Visible = false;
            LblLNameError.Visible = false;
            LblStreetError.Visible = false;
            LblCityError.Visible = false;
            LblStateError.Visible = false;
            LblZipCodeError.Visible = false;
            LblPhoneError.Visible = false;
            LblPhoneTypeError.Visible = false;
            LblGeneralErrors.Visible = false;
            LblErrorFile.Visible = false;
        }

        private void ClearFields()
        {
            TxtBoxFName.Text = "";
            TxtBoxLName.Text = "";
            TxtBoxStreet.Text = "";
            TxtBoxCity.Text = "";
            TxtBoxZipCode.Text = "";
            TxtBoxPhoneNumber.Text = "";
            DDState.SelectedIndex = 0;
            DDPhoneType.SelectedIndex = 0;
        }

        protected void BtnSeeList_Click(object sender, EventArgs e)
        {
            ClearFields();
            ClearLabels();
            var path = System.Web.HttpContext.Current.Server.MapPath("\\XML\\");
            if (File.Exists(path + "Customers.XML"))
                Response.Redirect("./FormCustomersListView.aspx");
            else
                LblErrorFile.Visible = true;
        }
    }
}