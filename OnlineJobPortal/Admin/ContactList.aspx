<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="OnlineJobPortal.Admin.ContactList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>

    <style>
        .active {
            background-color: green;
            color: white;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url('../Images/bg.jpg'); width: 100%; min-height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container-fluid pt-4 pb-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Job List/Details</h3>

            <div class="row mb-3 pt-sm-3">
                <div class="col-md-12">
                    <div style="overflow-x: auto;">
<<<<<<< HEAD
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                            OnRowDeleting="GridView1_RowDeleting"
=======
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" OnRowDeleting="GridView1_RowDeleting"
>>>>>>> 12cae699593f3142d8f343ac21088c3600f01aae
                            EmptyDataText="No record to display..!" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"
                            OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ContactId">

                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ContactId">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="Name" HeaderText="Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Subject" HeaderText="Subject">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Message" HeaderText="Message">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                               
                              
                            </Columns>
                            <HeaderStyle BackColor="#7200cf" ForeColor="white" />
                            <RowStyle CssClass="grid-row" />
                            <EmptyDataRowStyle CssClass="empty-grid-row" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

</asp:Content>