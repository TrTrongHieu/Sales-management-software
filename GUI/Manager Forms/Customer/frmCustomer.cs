﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DTO;
using BUS;
using GUI.Manager_Forms.Customer;
//using Syncfusion.XlsIO;

namespace GUI.Manager_Forms.Customer
{
    public partial class frmCustomer : DevExpress.XtraEditors.XtraForm
    {
        public delegate void SendData(Customers customer);
        public delegate void SendTxtID(String str);
        public static CustomerBUS customerBUS = new CustomerBUS();
        public static DataTable dtbl = new DataTable();
        public static Customers customer = new Customers();
        public static int FormID = 6;
        public static RoleForm roleForm = GlobalVar.dicmyRoleForm[FormID];

        public string FindNextID(DataTable dtbl)
        {
            string txtID = null;
            try
            {
                if (dtbl.Rows.Count > 0)
                {
                    string ma = dtbl.Rows[dtbl.Rows.Count - 1]["CustomerID"].ToString();
                    int lastIndex = int.Parse(ma.Substring(2)) + 1;
                    txtID = "KH" + lastIndex.ToString("00000");
                }
                else
                {
                    txtID = "KH00001";
                }
            }
            catch (Exception ex)
            {

            }
            return txtID;
        }
        public void SendTextID2Form()
        {
            string txtID = null;
            txtID = FindNextID(dtbl);
            frmInserCustomer frm = new frmInserCustomer();
            SendTxtID send = new SendTxtID(frm.ReceiveTxtID);
            send(txtID);
        }

        public frmCustomer()
        {
            InitializeComponent();
            int FormID = int.Parse(this.Tag.ToString());
            RoleForm roleForm = GlobalVar.dicmyRoleForm[FormID];
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnRefesh_Click(object sender, EventArgs e)
        {
            dtbl = customerBUS.ShowCustomer();
            gcCustomers.DataSource = dtbl;

            //send data to insert form
            SendTextID2Form();
        }

        private void frmCustomer_Load(object sender, EventArgs e)
        {

            btnInsert.Enabled = roleForm.f_Insert;
            btnExport.Enabled = roleForm.Export;
            btnImport.Enabled = roleForm.Import;

            dtbl = customerBUS.ShowCustomer();
            gcCustomers.DataSource = dtbl;

            //send data to insert form
            SendTextID2Form();
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            frmInserCustomer frm = new frmInserCustomer();
            frm.Show();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            frmUpdateCustomer frm = new frmUpdateCustomer();
            frm.Show();
        }

        private void gcCustomers_Click(object sender, EventArgs e)
        {
            
            btnUpdate.Enabled = roleForm.f_Update;
            btnDelete.Enabled = roleForm.f_Delete;
            
            var rowHandle = gridView1.FocusedRowHandle;
            customer.CustomerID = gridView1.GetRowCellValue(rowHandle, "CustomerID").ToString();
            customer.CustomerName = gridView1.GetRowCellValue(rowHandle, "CustomerName").ToString();
            customer.Area = gridView1.GetRowCellValue(rowHandle, "Area").ToString();
            customer.Address = gridView1.GetRowCellValue(rowHandle, "Address").ToString();
            customer.Phone = gridView1.GetRowCellValue(rowHandle, "Phone").ToString();
            customer.Email = gridView1.GetRowCellValue(rowHandle, "Email").ToString();
            customer.Bank = gridView1.GetRowCellValue(rowHandle, "Bank").ToString();
            customer.Discount = float.Parse(gridView1.GetRowCellValue(rowHandle, "Discount").ToString());
            customer.AccountBank = gridView1.GetRowCellValue(rowHandle, "AccountBank").ToString();

            //send data to update form
            frmUpdateCustomer frm = new frmUpdateCustomer();
            SendData send = new SendData(frm.ReceiveData);
            send(customer);
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            //Create an instance of ExcelEngine
            //using (ExcelEngine excelEngine = new ExcelEngine())
            //{
            //    //Initialize Application
            //    IApplication application = excelEngine.Excel;

            //    //Set the default application version as Excel 2016
            //    application.DefaultVersion = ExcelVersion.Excel2016;

            //    //Create a new workbook
            //    IWorkbook workbook = application.Workbooks.Create(1);

            //    //Access first worksheet from the workbook instance
            //    IWorksheet worksheet = workbook.Worksheets[0];

            //    //Exporting DataTable to worksheet
            //    CategoryBUS categoryBUS = new CategoryBUS();
            //    DataTable dataTable = new DataTable();
            //    dataTable = categoryBUS.ShowCatergories();
            //    worksheet.ImportDataTable(dataTable, true, 1, 1);
            //    worksheet.UsedRange.AutofitColumns();

            //    //Save the workbook to disk in xlsx format
            //    workbook.SaveAs("Output.xlsx");

            //    MessageBox.Show("Export successfull!!\n" + @"Path: ..\QuanLyBanHang\GUI\bin\Debug");
            //}
        }

        private void btnImport_Click(object sender, EventArgs e)
        {
            OpenFileDialog fDialog = new OpenFileDialog();
            fDialog.Filter = "Excel Files|*.xls;*.xlsx;*.xlsm";

            AreasBUS categoryBUS = new AreasBUS();
            if (fDialog.ShowDialog() == DialogResult.OK)
            {
                System.IO.FileInfo fInfo = new System.IO.FileInfo(fDialog.FileName);
                string path = fInfo.DirectoryName + "\\" + fInfo.Name;
                //DataTable data = new DataTable();
                gcCustomers.DataSource = categoryBUS.ImportFormExcel("Sheet1", path);

            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (customerBUS.DeleteCustomer(customer) != 0)
                {
                    MessageBox.Show("Delete successfull!!!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Delete Fail!!!");
            }
        }
    }
}