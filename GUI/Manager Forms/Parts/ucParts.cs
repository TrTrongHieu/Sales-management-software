﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using BUS;
using DTO;
using GUI.Manager_Forms.Parts;
using Syncfusion.XlsIO;

namespace GUI.Manager_Forms
{
    public partial class ucParts : DevExpress.XtraEditors.XtraUserControl
    {
        public delegate void SendData(Partss p);
        public delegate void SendTxtID(String str);
        public ucParts()
        {
            InitializeComponent();
            // This line of code is generated by Data Source Configuration Wizard
            // Fill a SqlDataSource
            sqlDataSource1.Fill();
        }

        public string FindNextID(DataTable dtbl)
        {
            string txtID = null;
            if (dtbl.Rows.Count > 0)
            {
                string ma = dtbl.Rows[dtbl.Rows.Count - 1]["ID"].ToString();
                int lastIndex = int.Parse(ma.Substring(2)) + 1;
                txtID = "BP" + lastIndex.ToString("00000");
            }
            else
            {
                txtID = "BP00001";
            }
            return txtID;
        }

        private void btnRefesh_Click(object sender, EventArgs e)
        {
            PartsBUS partsBUS = new PartsBUS();
            DataTable dtbl = new DataTable();
            dtbl = partsBUS.ShowParts();

            //send data to Insert form
            string txtID = null;
            txtID = FindNextID(dtbl);
            MessageBox.Show(txtID);
            frmInsertParts frm = new frmInsertParts();
            SendTxtID send = new SendTxtID(frm.ReceiveTxtID);
            send(txtID);
        }

        private void ucParts_Load(object sender, EventArgs e)
        {
            PartsBUS partsBUS = new PartsBUS();
            DataTable dtbl = new DataTable();
            dtbl = partsBUS.ShowParts();
            //gcCatergories.DataSource = dtbl;
            //int FormID = int.Parse(this.Tag.ToString());
            //RoleForm roleForm = GlobalVar.dicmyRoleForm[FormID];
            btnInsert.Enabled = Enabled;


            //send data to Insert form
            string txtID = null;
            txtID = FindNextID(dtbl);
            MessageBox.Show(txtID);
            frmInsertParts frm = new frmInsertParts();
            SendTxtID send = new SendTxtID(frm.ReceiveTxtID);
            send(txtID);
        }

        private void gridView1_Click(object sender, EventArgs e)
        {
            btnUpdate.Enabled = Enabled;
            btnDelete.Enabled = Enabled;
            Partss p = new Partss();
            var rowHandle = gridView1.FocusedRowHandle;
            p.ID = gridView1.GetRowCellValue(rowHandle, "ID").ToString();
            p.Name = gridView1.GetRowCellValue(rowHandle, "Name").ToString();
            p.Note = gridView1.GetRowCellValue(rowHandle, "Note").ToString();


            //send data to update form
            frmUpdateParts frm = new frmUpdateParts();
            SendData send = new SendData(frm.ReceiveData);
            send(p);
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            frmInsertParts frm = new frmInsertParts();
            frm.Show();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            frmUpdateParts frm = new frmUpdateParts();
            frm.Show();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Controls.Clear();
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            using (ExcelEngine excelEngine = new ExcelEngine())
            {
                //Initialize Application
                IApplication application = excelEngine.Excel;

                //Set the default application version as Excel 2016
                application.DefaultVersion = ExcelVersion.Excel2016;

                //Create a new workbook
                IWorkbook workbook = application.Workbooks.Create(1);

                //Access first worksheet from the workbook instance
                IWorksheet worksheet = workbook.Worksheets[0];

                //Exporting DataTable to worksheet
                PartsBUS bus = new PartsBUS();
                DataTable dataTable = new DataTable();
                dataTable = bus.ShowParts();
                worksheet.ImportDataTable(dataTable, true, 1, 1);
                worksheet.UsedRange.AutofitColumns();

                //Save the workbook to disk in xlsx format
                workbook.SaveAs("Output.xlsx");

                MessageBox.Show("Export successfull!!\n" + @"Path: ..\QuanLyBanHang\GUI\bin\Debug");
            }
        }
    }
}
