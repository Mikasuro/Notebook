using Notebook1;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Notebook1
{
    public partial class Notebook : System.Web.UI.Page
    {
        private static readonly string connectionString = "data source=(LocalDb)\\NotebookDB;initial catalog=Notebook;integrated security=True;";
        private static readonly SqlConnection connection = new SqlConnection(connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand("INSERT INTO [Friends] (name, lastName, email, phone)" +
                " VALUES (@name, @lastName, @email, @phone)", connection);
            command.Parameters.Add("name", tbName.Text);
            command.Parameters.Add("lastName", tbLastName.Text);
            command.Parameters.Add("email", tbEmail.Text);
            command.Parameters.Add("phone", tbPhone.Text);
            command.Connection.Open();
            command.ExecuteNonQuery();
            command.Connection.Close();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            int index = int.Parse(GridView1.SelectedRow.Cells[0].Text);
            SqlCommand command = new SqlCommand("DELETE FROM [FRIENDS] WHERE id=@id", connection);
            SqlTransaction transaction = connection.BeginTransaction();
            command.Transaction = transaction;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.DeleteCommand = command;
            SqlParameter param = new SqlParameter("id", SqlDbType.Int);
            param.Value = index;
            adapter.DeleteCommand.Parameters.Add(param);
            adapter.DeleteCommand.ExecuteNonQuery();
            transaction.Commit();
            connection.Close();
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}
