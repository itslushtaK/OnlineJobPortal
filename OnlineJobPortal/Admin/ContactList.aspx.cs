using System;
using System.Configuration;
using System.Web.UI.WebControls;
using MongoDB.Bson;
using MongoDB.Driver;

namespace OnlineJobPortal.Admin
{
    public partial class ContactList : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnection"].ConnectionString;
        private string databaseName = "Contact";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindContactData();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindContactData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string contactId = row.Cells[0].Text; // Assuming the ContactId is in the first column

            DeleteContact(contactId);
            BindContactData();
        }

        public class FormData
        {
            public ObjectId Id { get; set; } // MongoDB ObjectId field
            public string ContactId { get; set; } // Add this property
            public string Message { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string Subject { get; set; }
        }

        private void BindContactData()
        {
            var client = new MongoClient(connectionString);
            var database = client.GetDatabase(databaseName);
            var collection = database.GetCollection<FormData>("formdata");

            var documents = collection.Find(FilterDefinition<FormData>.Empty).ToList();

            GridView1.DataSource = documents;
            GridView1.DataBind();
        }

        private void DeleteContact(string contactId)
        {
            var client = new MongoClient(connectionString);
            var database = client.GetDatabase(databaseName);
            var collection = database.GetCollection<FormData>("formdata");

            collection.DeleteOne(f => f.ContactId == contactId);
        }
    }
}
