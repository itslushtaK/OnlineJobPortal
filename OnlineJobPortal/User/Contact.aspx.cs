using System;
using System.Configuration;
using System.Web.UI;
using MongoDB.Driver;

namespace OnlineJobPortal.User
{
    public partial class Contact : Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnection"].ConnectionString;
        private string databaseName = "Contact";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSend_Click(object sender, EventArgs e)
        {
            try
            {
                var formData = new FormData
                {
                    Name = name.Value.Trim(),
                    Email = email.Value.Trim(),
                    Subject = subject.Value.Trim(),
                    Message = message.Value.Trim()
                };

                SaveFormData(formData);

                lblMsg.Visible = true;
                lblMsg.Text = "Thanks for Contacting US";
                lblMsg.CssClass = "alert alert-success";
                ClearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                //lblMsg.Text = ("ex.Message" + "error"+ex.Message);
            }
        }

        private void SaveFormData(FormData formData)
        {
            var client = new MongoClient(connectionString);
            var database = client.GetDatabase(databaseName);
            var collection = database.GetCollection<FormData>("formdata");
            collection.InsertOne(formData);
        }

        private void ClearForm()
        {
            name.Value = string.Empty;
            email.Value = string.Empty;
            subject.Value = string.Empty;
            message.Value = string.Empty;
        }
    }

    public class FormData
    {
        public string Message { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Subject { get; set; }
    }
}
