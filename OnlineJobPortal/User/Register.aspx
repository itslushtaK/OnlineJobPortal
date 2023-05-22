<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineJobPortal.User.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
   
    <section>
        <div class="container pt-50 pb-40">
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
                                       TextMode="Password" ></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="txtPassword" 
                                        ErrorMessage="Password must contain at least one uppercase letter, one number, and one special character."
                                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                         <label>Confirm Password</label>
                                           <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" ></asp:TextBox>
                                           <asp:CompareValidator ID="compareValidatori" runat="server" ErrorMessage="Password & Confirm Password should be same!"
                                               ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                               Font-Size="Small"></asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <h6>Personal Information</h6>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter Full Name" ></asp:TextBox>    
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Adress</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Adress" TextMode="MultiLine" ></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="col-12">
                                    <div class="form-group">
                                        <label>Mobile Number</label>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobile"
                                            ErrorMessage="Mobile number must have the prefix +383 and exactly 8 digits."
                                            ValidationExpression="^(\+383)?\d{8}$">
                                        </asp:RegularExpressionValidator>
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
                                       <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100"
                                           AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                                           <asp:ListItem Value="0">Select Country</asp:ListItem>
                                       </asp:DropDownList>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Country Is Required!"
                                           ForeColor="Red" 
                                            Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry"></asp:RequiredFieldValidator>
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>
                                   </div>
                                </div>
                            </div>

                            <div class="form-group mt-3">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="button button-contactForm boxed-btn mr-4"
                                    OnClick="btnRegister_Click1"
                                    />
                                <span class="clickLink"><a href="../User/Login.aspx">Already Register? Click Here</a></span>
                            </div>
                        </div>
                    </div>
        </div>
       </div>
    </section>
   

</asp:Content>
