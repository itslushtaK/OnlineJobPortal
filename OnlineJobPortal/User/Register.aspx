﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineJobPortal.User.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container pr-50 pb-40">
                <div class="row">
                    <div class="col-12 pb-20">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                    </div>
                    <div class="col-12">
                        <h2 class="contact-title text-center">Sign Up</h2>
                    </div>
                    <div class="col-lg-8 mx-auto">
                        <div class="form-content contact_form">
                            <div class="row">
                                <div class="col-12">
                                    <h6>Login Information</h6>
                                </div>
                                <div class="col-12">
                                <div class="form-group">
                                    <label>Username</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter Username" required></asp:TextBox>
                                </div>
                                </div>
                                <div class="col-sm-6">
                                   <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" 
                                       TextMode="Password" required></asp:TextBox>
<%--                                        <input class="form-control valid" name="name" id="name" runat="server" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name" required>--%>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                         <label>Confirm Password</label>
                                           <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" required></asp:TextBox>
                                           <asp:CompareValidator ID="compareValidatori" runat="server" ErrorMessage="Password & Confirm Password should be same!"
                                               ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                               Font-Size="Small"></asp:CompareValidator>
<%--                                        <input class="form-control valid" name="email" id="email" runat="server" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email" required>--%>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <h6>Personal Information</h6>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter Full Name" required></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Name must be in characters" ForeColor="Red" 
                                            Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationException="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
                                   </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Adress</label>
                                    <asp:TextBox ID="txtAdress" runat="server" CssClass="form-control" placeholder="Enter Adress" TextMode="MultiLine" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Mobile Number</label>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" required></asp:TextBox>
                                          <asp:RequiredFieldValidator runat="server" ErrorMessage="Mobile No. must have 10 digits" ForeColor="Red" 
                                            Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationException="^[0-9]{10}+$" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" required
                                        TextMode="Email">
                                    </asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">
                                   <div class="form-group">
                                    <label>Country</label>
                                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100"
                                        AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                                       </asp:DropDownList>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Country is required"
                                           ForeColor="Red"  Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry"></asp:RequiredFieldValidator>
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                           ConnectionString="<%$ ConnectionStrings:cs %>" 
                                           SelectCommand="SELECT [CountryName] FROM [Country]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                                   </div>
                                </div>
                            </div>

                            <div class="form-group mt-3">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="button button-contactForm boxed-btn mr-4"
                                    OnClick="btnRegister_Click"
                                    />
                                <span class="clickLink"><a href="../Users/Login.aspx">Already Register? Click Here</a></span>
                            </div>
                        </div>
                    </div>
        </div>
       </div>
    </section>

</asp:Content>
