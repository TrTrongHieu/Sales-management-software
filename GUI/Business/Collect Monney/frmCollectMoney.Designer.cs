﻿namespace GUI
{
    partial class frmCollectMoney
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmCollectMoney));
            this.dockManager1 = new DevExpress.XtraBars.Docking.DockManager(this.components);
            this.dockPanel1 = new DevExpress.XtraBars.Docking.DockPanel();
            this.dockPanel1_Container = new DevExpress.XtraBars.Docking.ControlContainer();
            this.navBarControl1 = new DevExpress.XtraNavBar.NavBarControl();
            this.navBarGroup1 = new DevExpress.XtraNavBar.NavBarGroup();
            this.navBarItem1 = new DevExpress.XtraNavBar.NavBarItem();
            this.navBarGroup2 = new DevExpress.XtraNavBar.NavBarGroup();
            this.navBarItem2 = new DevExpress.XtraNavBar.NavBarItem();
            this.navBarItem3 = new DevExpress.XtraNavBar.NavBarItem();
            this.navBarItem4 = new DevExpress.XtraNavBar.NavBarItem();
            this.navBarItem5 = new DevExpress.XtraNavBar.NavBarItem();
            this.pcMain = new DevExpress.XtraEditors.PanelControl();
            ((System.ComponentModel.ISupportInitialize)(this.dockManager1)).BeginInit();
            this.dockPanel1.SuspendLayout();
            this.dockPanel1_Container.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.navBarControl1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pcMain)).BeginInit();
            this.SuspendLayout();
            // 
            // dockManager1
            // 
            this.dockManager1.Form = this;
            this.dockManager1.RootPanels.AddRange(new DevExpress.XtraBars.Docking.DockPanel[] {
            this.dockPanel1});
            this.dockManager1.TopZIndexControls.AddRange(new string[] {
            "DevExpress.XtraBars.BarDockControl",
            "DevExpress.XtraBars.StandaloneBarDockControl",
            "System.Windows.Forms.StatusBar",
            "System.Windows.Forms.MenuStrip",
            "System.Windows.Forms.StatusStrip",
            "DevExpress.XtraBars.Ribbon.RibbonStatusBar",
            "DevExpress.XtraBars.Ribbon.RibbonControl",
            "DevExpress.XtraBars.Navigation.OfficeNavigationBar",
            "DevExpress.XtraBars.Navigation.TileNavPane",
            "DevExpress.XtraBars.TabFormControl",
            "DevExpress.XtraBars.FluentDesignSystem.FluentDesignFormControl",
            "DevExpress.XtraBars.ToolbarForm.ToolbarFormControl"});
            // 
            // dockPanel1
            // 
            this.dockPanel1.Controls.Add(this.dockPanel1_Container);
            this.dockPanel1.Dock = DevExpress.XtraBars.Docking.DockingStyle.Left;
            this.dockPanel1.ID = new System.Guid("5e83fd1a-5886-4d33-8ea3-9bcbac76d40d");
            this.dockPanel1.Location = new System.Drawing.Point(0, 0);
            this.dockPanel1.Name = "dockPanel1";
            this.dockPanel1.OriginalSize = new System.Drawing.Size(200, 200);
            this.dockPanel1.Size = new System.Drawing.Size(200, 580);
            this.dockPanel1.Text = "Business";
            // 
            // dockPanel1_Container
            // 
            this.dockPanel1_Container.Controls.Add(this.navBarControl1);
            this.dockPanel1_Container.Location = new System.Drawing.Point(3, 24);
            this.dockPanel1_Container.Name = "dockPanel1_Container";
            this.dockPanel1_Container.Size = new System.Drawing.Size(193, 553);
            this.dockPanel1_Container.TabIndex = 0;
            // 
            // navBarControl1
            // 
            this.navBarControl1.ActiveGroup = this.navBarGroup1;
            this.navBarControl1.Appearance.Background.BackColor = System.Drawing.Color.Aqua;
            this.navBarControl1.Appearance.Background.Options.UseBackColor = true;
            this.navBarControl1.Appearance.GroupHeader.BackColor = System.Drawing.Color.DodgerBlue;
            this.navBarControl1.Appearance.GroupHeader.Options.UseBackColor = true;
            this.navBarControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.navBarControl1.Groups.AddRange(new DevExpress.XtraNavBar.NavBarGroup[] {
            this.navBarGroup1,
            this.navBarGroup2});
            this.navBarControl1.Items.AddRange(new DevExpress.XtraNavBar.NavBarItem[] {
            this.navBarItem1,
            this.navBarItem2,
            this.navBarItem3,
            this.navBarItem4,
            this.navBarItem5});
            this.navBarControl1.Location = new System.Drawing.Point(0, 0);
            this.navBarControl1.Name = "navBarControl1";
            this.navBarControl1.OptionsNavPane.ExpandedWidth = 193;
            this.navBarControl1.Size = new System.Drawing.Size(193, 553);
            this.navBarControl1.TabIndex = 8;
            this.navBarControl1.Text = "navBarControl1";
            this.navBarControl1.View = new DevExpress.XtraNavBar.ViewInfo.StandardSkinExplorerBarViewInfoRegistrator("DevExpress Style");
            // 
            // navBarGroup1
            // 
            this.navBarGroup1.Caption = "Receipts";
            this.navBarGroup1.Expanded = true;
            this.navBarGroup1.GroupStyle = DevExpress.XtraNavBar.NavBarGroupStyle.LargeIconsText;
            this.navBarGroup1.ItemLinks.AddRange(new DevExpress.XtraNavBar.NavBarItemLink[] {
            new DevExpress.XtraNavBar.NavBarItemLink(this.navBarItem1)});
            this.navBarGroup1.Name = "navBarGroup1";
            // 
            // navBarItem1
            // 
            this.navBarItem1.Appearance.Options.UseTextOptions = true;
            this.navBarItem1.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.navBarItem1.Caption = "List of receipts";
            this.navBarItem1.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("navBarItem1.ImageOptions.LargeImage")));
            this.navBarItem1.ImageOptions.SmallImage = ((System.Drawing.Image)(resources.GetObject("navBarItem1.ImageOptions.SmallImage")));
            this.navBarItem1.Name = "navBarItem1";
            this.navBarItem1.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.navBarItem1_LinkClicked);
            // 
            // navBarGroup2
            // 
            this.navBarGroup2.Caption = "Lists";
            this.navBarGroup2.Expanded = true;
            this.navBarGroup2.GroupStyle = DevExpress.XtraNavBar.NavBarGroupStyle.LargeIconsText;
            this.navBarGroup2.ItemLinks.AddRange(new DevExpress.XtraNavBar.NavBarItemLink[] {
            new DevExpress.XtraNavBar.NavBarItemLink(this.navBarItem2),
            new DevExpress.XtraNavBar.NavBarItemLink(this.navBarItem3),
            new DevExpress.XtraNavBar.NavBarItemLink(this.navBarItem4),
            new DevExpress.XtraNavBar.NavBarItemLink(this.navBarItem5)});
            this.navBarGroup2.Name = "navBarGroup2";
            // 
            // navBarItem2
            // 
            this.navBarItem2.Appearance.Options.UseTextOptions = true;
            this.navBarItem2.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.navBarItem2.Caption = "List of debt notes";
            this.navBarItem2.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("navBarItem2.ImageOptions.LargeImage")));
            this.navBarItem2.ImageOptions.SmallImage = ((System.Drawing.Image)(resources.GetObject("navBarItem2.ImageOptions.SmallImage")));
            this.navBarItem2.Name = "navBarItem2";
            this.navBarItem2.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.navBarItem2_LinkClicked);
            // 
            // navBarItem3
            // 
            this.navBarItem3.Appearance.Options.UseTextOptions = true;
            this.navBarItem3.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.navBarItem3.Caption = "List of coupons immediately";
            this.navBarItem3.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("navBarItem3.ImageOptions.LargeImage")));
            this.navBarItem3.ImageOptions.SmallImage = ((System.Drawing.Image)(resources.GetObject("navBarItem3.ImageOptions.SmallImage")));
            this.navBarItem3.Name = "navBarItem3";
            this.navBarItem3.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.navBarItem3_LinkClicked);
            // 
            // navBarItem4
            // 
            this.navBarItem4.Appearance.Options.UseTextOptions = true;
            this.navBarItem4.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.navBarItem4.Caption = "Track cookng debt";
            this.navBarItem4.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("navBarItem4.ImageOptions.LargeImage")));
            this.navBarItem4.ImageOptions.SmallImage = ((System.Drawing.Image)(resources.GetObject("navBarItem4.ImageOptions.SmallImage")));
            this.navBarItem4.Name = "navBarItem4";
            this.navBarItem4.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.navBarItem4_LinkClicked);
            // 
            // navBarItem5
            // 
            this.navBarItem5.Appearance.Options.UseTextOptions = true;
            this.navBarItem5.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.navBarItem5.Caption = "Aggregate debt";
            this.navBarItem5.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("navBarItem5.ImageOptions.LargeImage")));
            this.navBarItem5.ImageOptions.SmallImage = ((System.Drawing.Image)(resources.GetObject("navBarItem5.ImageOptions.SmallImage")));
            this.navBarItem5.Name = "navBarItem5";
            this.navBarItem5.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.navBarItem5_LinkClicked);
            // 
            // pcMain
            // 
            this.pcMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pcMain.Location = new System.Drawing.Point(200, 0);
            this.pcMain.Name = "pcMain";
            this.pcMain.Size = new System.Drawing.Size(703, 580);
            this.pcMain.TabIndex = 1;
            // 
            // frmCollectMoney
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(903, 580);
            this.Controls.Add(this.pcMain);
            this.Controls.Add(this.dockPanel1);
            this.Name = "frmCollectMoney";
            this.Text = "frmCollectMoney";
            this.Load += new System.EventHandler(this.frmCollectMoney_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dockManager1)).EndInit();
            this.dockPanel1.ResumeLayout(false);
            this.dockPanel1_Container.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.navBarControl1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pcMain)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraBars.Docking.DockManager dockManager1;
        private DevExpress.XtraBars.Docking.DockPanel dockPanel1;
        private DevExpress.XtraBars.Docking.ControlContainer dockPanel1_Container;
        private DevExpress.XtraEditors.PanelControl pcMain;
        private DevExpress.XtraNavBar.NavBarControl navBarControl1;
        private DevExpress.XtraNavBar.NavBarGroup navBarGroup1;
        private DevExpress.XtraNavBar.NavBarItem navBarItem1;
        private DevExpress.XtraNavBar.NavBarGroup navBarGroup2;
        private DevExpress.XtraNavBar.NavBarItem navBarItem2;
        private DevExpress.XtraNavBar.NavBarItem navBarItem3;
        private DevExpress.XtraNavBar.NavBarItem navBarItem4;
        private DevExpress.XtraNavBar.NavBarItem navBarItem5;
    }
}