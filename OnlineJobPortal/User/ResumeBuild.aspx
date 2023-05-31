<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="ResumeBuild.aspx.cs" Inherits="OnlineJobPortal.User.ResumeBuild" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container pt-50 pb-40">
                <div class="row">
                    <div class="col-12 pb-20">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                    </div>
                    <div class="col-12">
                        <h2 class="contact-title text-center">Resume Build</h2>
                    </div>
                    <div class="col-lg-12 ">
                        <div class="form-content contact_form">
                            <div class="row">
                                <div class="col-12">
                                    <h6>Personal Information</h6>

                                     <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter Full Name" ></asp:TextBox>    
                                </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Username</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter Username" required></asp:TextBox>
                                </div>
                                </div>

                                 <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>Adress</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Adress" TextMode="MultiLine" ></asp:TextBox>
                                    </div>
                                </div>

                                    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Mobile Number</label>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobile"
                                            ErrorMessage="Mobile number must have the prefix +383 and exactly 8 digits."
                                            ValidationExpression="^(\+383)?\d{8}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
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

                                <div class="col-12 pt-4">
                                    <h6>Education/Resume Information</h6>
                                </div>

                                     <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>10th Percentage/Grade</label>
                                    <asp:TextBox ID="txtTenth" runat="server" CssClass="form-control" placeholder="Ex: 90%" >
                                    </asp:TextBox>
                                    </div>
                                </div>

                                    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>12th Percentage/Grade</label>
                                    <asp:TextBox ID="txtTwelfth" runat="server" CssClass="form-control" placeholder="Ex: 90%">
                                    </asp:TextBox>
                                    </div>
                                </div>

                                    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>Graduation with Pointer/Grade</label>
                                    <asp:TextBox ID="txtGraduation" runat="server" CssClass="form-control"
                                        placeholder="Ex: BTech with 9.2 ponter" >
                                    </asp:TextBox>
                                    </div>
                                </div>
                                
                                    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>PHD with  Percentage/Grade</label>
                                    <asp:TextBox ID="txtPhd" runat="server" CssClass="form-control" placeholder="PHD with Grade" >
                                    </asp:TextBox>
                                    </div>
                                </div>

                                    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>Job Profile/Works On</label>
                                    <asp:TextBox ID="txtWork" runat="server" CssClass="form-control" placeholder="Job Profile" >
                                    </asp:TextBox>
                                    </div>
                                </div>

                                    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>Work Experience</label>
                                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="Work Experience" >
                                    </asp:TextBox>
                                    </div>
                                </div>

                                    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                    <label>Resume</label>
                                        <asp:FileUpload ID="fuResume" runat="server"  CssClass="form-control pt-2" 
                                            ToolTip=".doc, .docx, .pdf extension only"/>
                                    </div>
                                </div>
                               
                            </div>

                            <div class="form-group mt-3">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button button-contactForm boxed-btn mr-4"
                                    OnClick="btnUpdate_Click"/>
                               
                            </div>
                        </div>
                    </div>
        </div>
       </div>
    </section>
</asp:Content>
