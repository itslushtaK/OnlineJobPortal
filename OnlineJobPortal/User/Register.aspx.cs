using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.User
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into [User] (Username,Password,Name,Adress,Mobile,Email,Country) values(@Username,@Password,@Name,@Adress,@Mobile,@Email,@Country)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtConfirmPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Adress",txtAdress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);

                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Registered Succsesfuly";
                    lblMsg.CssClass = "alert alert-success";
                    clear();
                }
                else
                {

                    lblMsg.Visible = true;
                    lblMsg.Text = "Cannot save record right now, please try after sometime...";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (SqlException ex)
            {
                //Check for same username
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>"+txtUserName.Text.Trim()+"</b>"+"Username already exist ,try new one";
                    lblMsg.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            finally
            {
                con.Close();
            }
        }

        private void clear()
        {
            txtUserName.Text = string.Empty;
            txtAdress.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            ddlCountry.ClearSelection();




        }

        //protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        //protected void Unnamed3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        //{

        //}

        protected void btnRegister_Click(object sender, EventArgs e)
        {

        }
    }
}