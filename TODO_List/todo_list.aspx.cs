using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TODO_List
{
    public partial class todo_list : System.Web.UI.Page
    {
        string maincon = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            bindTodoItem();
        }

        protected void btnAddTodo_Click(object sender, EventArgs e)
        {

        }
        private void bindTodoItem()
        {
            using (SqlConnection sqlCon = new SqlConnection(maincon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select content, backgroundcolor from todoitems";
                    cmd.Connection = sqlCon;
                    sqlCon.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    todoRptr.DataSource = dt;
                    todoRptr.DataBind();
                    sqlCon.Close();

                    SqlConnection.ClearPool(sqlCon);
                }
            }
        }
    }
}