<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="todo_list.aspx.cs" Inherits="TODO_List.todo_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Todo List</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }

        .container {
            width: 550px;
            margin-top: 20px;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .todo-item {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            display: flex;
            flex-direction: column;
        }

        .todo-content {
            margin-bottom: 10px;
            font-weight: bold;
        }

        .todo-color {
            height: 20px;
            margin-bottom: 10px;
        }

        .add-todo {
            display: flex;
            margin-top: 10px;
        }

            .add-todo input[type="text"] {
                flex-grow: 1;
                margin-right: 10px;
            }

            .add-todo button {
                padding: 5px 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

        .tag-container {
            display: flex;
            flex-wrap: wrap;
            margin-top: 5px;
        }

        .tag {
            padding: 4px 8px;
            background-color: #eaeaea;
            color: #333;
            border-radius: 4px;
            margin-right: 5px;
            margin-bottom: 5px;
            cursor: pointer;
        }

            .tag.active {
                background-color: #007bff;
                color: #fff;
            }

        .filter-container {
            margin-top: 10px;
        }

            .filter-container label {
                margin-right: 10px;
            }

        .color-box {
            width: 20px;
            height: 20px;
        }

        .edit-icon {
            color: blue; /* Change the color value to your desired color */
        }

        .delete-icon {
            color: red; /* Change the color value to your desired color */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h3>Todo List</h3>
            <div id="todoContainer"></div>
            <div class="add-todo input-group">
                <input type="text" id="txtTodo" placeholder="Enter a todo item" class="form-control" />
                <div class="input-group-append">
                    <asp:Button ID="btnAddTodo" runat="server" Text="Add" CssClass="btn btn-primary btn-flat" OnClick="btnAddTodo_Click"/>
                </div>
            </div>
            <hr />
            <div class="card-body" style="font-size: 13px">
                <div class="table-responsive">
                    <table id="tbl_TODO" class="table table-bordered table-striped" style="font-size: 13px">
                        <thead>
                            <tr>
                                <%--<th>Transaction ID</th>--%>
                                <th>Content</th>
                                <th>Background Color</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="todoRptr">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("content")%></td>
                                        <td>
                                            <div class="color-box" style="background-color: <%# Eval("backgroundcolor")%>;"></div>
                                        </td>
                                        <td>
                                            <a href="#" class="action-icon edit-icon" title="Edit"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="action-icon delete-icon" title="Delete"><i class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#tbl_TODO").DataTable();
        });
    </script>
</body>
</html>
