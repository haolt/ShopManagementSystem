namespace ShopManagementSystem
{
    partial class fLogin
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
            this.tabControl = new System.Windows.Forms.TabControl();
            this.NhanVien = new System.Windows.Forms.TabPage();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnLoginNV = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.txtPassNV = new System.Windows.Forms.TextBox();
            this.lblPhoneNumber = new System.Windows.Forms.Label();
            this.lblTitleLoginForm = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txtUserNameNV = new System.Windows.Forms.TextBox();
            this.lblName = new System.Windows.Forms.Label();
            this.QuanLy = new System.Windows.Forms.TabPage();
            this.tab2 = new System.Windows.Forms.Panel();
            this.LoginBtnQL = new System.Windows.Forms.Button();
            this.quitBtn = new System.Windows.Forms.Button();
            this.panel5 = new System.Windows.Forms.Panel();
            this.txtPassQL = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.panel6 = new System.Windows.Forms.Panel();
            this.txtUserNameQL = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tabControl.SuspendLayout();
            this.NhanVien.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel2.SuspendLayout();
            this.QuanLy.SuspendLayout();
            this.tab2.SuspendLayout();
            this.panel5.SuspendLayout();
            this.panel6.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl
            // 
            this.tabControl.Controls.Add(this.NhanVien);
            this.tabControl.Controls.Add(this.QuanLy);
            this.tabControl.Location = new System.Drawing.Point(4, -1);
            this.tabControl.Name = "tabControl";
            this.tabControl.SelectedIndex = 0;
            this.tabControl.Size = new System.Drawing.Size(344, 279);
            this.tabControl.TabIndex = 1;
            // 
            // NhanVien
            // 
            this.NhanVien.Controls.Add(this.panel1);
            this.NhanVien.Location = new System.Drawing.Point(4, 22);
            this.NhanVien.Name = "NhanVien";
            this.NhanVien.Padding = new System.Windows.Forms.Padding(3);
            this.NhanVien.Size = new System.Drawing.Size(336, 253);
            this.NhanVien.TabIndex = 0;
            this.NhanVien.Text = "Nhân VIên";
            this.NhanVien.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnLoginNV);
            this.panel1.Controls.Add(this.btnExit);
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.lblTitleLoginForm);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(328, 248);
            this.panel1.TabIndex = 1;
            // 
            // btnLoginNV
            // 
            this.btnLoginNV.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.btnLoginNV.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnLoginNV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLoginNV.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnLoginNV.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLoginNV.Location = new System.Drawing.Point(161, 183);
            this.btnLoginNV.Name = "btnLoginNV";
            this.btnLoginNV.Padding = new System.Windows.Forms.Padding(2);
            this.btnLoginNV.Size = new System.Drawing.Size(137, 35);
            this.btnLoginNV.TabIndex = 4;
            this.btnLoginNV.Text = "Đăng nhập";
            this.btnLoginNV.UseVisualStyleBackColor = false;
            this.btnLoginNV.Click += new System.EventHandler(this.btnLoginNV_Click);
            // 
            // btnExit
            // 
            this.btnExit.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.btnExit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnExit.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnExit.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnExit.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnExit.Location = new System.Drawing.Point(21, 183);
            this.btnExit.Name = "btnExit";
            this.btnExit.Padding = new System.Windows.Forms.Padding(2);
            this.btnExit.Size = new System.Drawing.Size(137, 35);
            this.btnExit.TabIndex = 3;
            this.btnExit.Text = "Thoát";
            this.btnExit.UseVisualStyleBackColor = true;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.txtPassNV);
            this.panel3.Controls.Add(this.lblPhoneNumber);
            this.panel3.Location = new System.Drawing.Point(21, 113);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(282, 49);
            this.panel3.TabIndex = 2;
            // 
            // txtPassNV
            // 
            this.txtPassNV.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassNV.Location = new System.Drawing.Point(107, 13);
            this.txtPassNV.Name = "txtPassNV";
            this.txtPassNV.Size = new System.Drawing.Size(175, 26);
            this.txtPassNV.TabIndex = 1;
            // 
            // lblPhoneNumber
            // 
            this.lblPhoneNumber.AutoSize = true;
            this.lblPhoneNumber.Font = new System.Drawing.Font("Cambria", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhoneNumber.Location = new System.Drawing.Point(3, 16);
            this.lblPhoneNumber.Name = "lblPhoneNumber";
            this.lblPhoneNumber.Size = new System.Drawing.Size(72, 17);
            this.lblPhoneNumber.TabIndex = 0;
            this.lblPhoneNumber.Text = "Mật khẩu";
            // 
            // lblTitleLoginForm
            // 
            this.lblTitleLoginForm.AutoSize = true;
            this.lblTitleLoginForm.Font = new System.Drawing.Font("Cambria", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitleLoginForm.Location = new System.Drawing.Point(58, 18);
            this.lblTitleLoginForm.Name = "lblTitleLoginForm";
            this.lblTitleLoginForm.Size = new System.Drawing.Size(217, 22);
            this.lblTitleLoginForm.TabIndex = 2;
            this.lblTitleLoginForm.Text = "ĐĂNG NHẬP NHÂN VIÊN";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.txtUserNameNV);
            this.panel2.Controls.Add(this.lblName);
            this.panel2.Location = new System.Drawing.Point(21, 58);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(282, 49);
            this.panel2.TabIndex = 1;
            // 
            // txtUserNameNV
            // 
            this.txtUserNameNV.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUserNameNV.Location = new System.Drawing.Point(107, 13);
            this.txtUserNameNV.Name = "txtUserNameNV";
            this.txtUserNameNV.Size = new System.Drawing.Size(175, 26);
            this.txtUserNameNV.TabIndex = 1;
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Font = new System.Drawing.Font("Cambria", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblName.Location = new System.Drawing.Point(3, 16);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(109, 17);
            this.lblName.TabIndex = 0;
            this.lblName.Text = "Tên đăng nhập";
            // 
            // QuanLy
            // 
            this.QuanLy.Controls.Add(this.tab2);
            this.QuanLy.Location = new System.Drawing.Point(4, 22);
            this.QuanLy.Name = "QuanLy";
            this.QuanLy.Padding = new System.Windows.Forms.Padding(3);
            this.QuanLy.Size = new System.Drawing.Size(336, 253);
            this.QuanLy.TabIndex = 1;
            this.QuanLy.Text = "Quản Lý";
            this.QuanLy.UseVisualStyleBackColor = true;
            // 
            // tab2
            // 
            this.tab2.Controls.Add(this.LoginBtnQL);
            this.tab2.Controls.Add(this.quitBtn);
            this.tab2.Controls.Add(this.panel5);
            this.tab2.Controls.Add(this.label2);
            this.tab2.Controls.Add(this.panel6);
            this.tab2.Location = new System.Drawing.Point(0, 0);
            this.tab2.Name = "tab2";
            this.tab2.Size = new System.Drawing.Size(327, 248);
            this.tab2.TabIndex = 2;
            this.tab2.Tag = "tab2";
            // 
            // LoginBtnQL
            // 
            this.LoginBtnQL.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.LoginBtnQL.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.LoginBtnQL.Cursor = System.Windows.Forms.Cursors.Hand;
            this.LoginBtnQL.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.LoginBtnQL.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.LoginBtnQL.Location = new System.Drawing.Point(161, 183);
            this.LoginBtnQL.Name = "LoginBtnQL";
            this.LoginBtnQL.Padding = new System.Windows.Forms.Padding(2);
            this.LoginBtnQL.Size = new System.Drawing.Size(137, 35);
            this.LoginBtnQL.TabIndex = 4;
            this.LoginBtnQL.Text = "Đăng nhập";
            this.LoginBtnQL.UseVisualStyleBackColor = false;
            this.LoginBtnQL.Click += new System.EventHandler(this.LoginBtnQL_Click);
            // 
            // quitBtn
            // 
            this.quitBtn.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.quitBtn.Cursor = System.Windows.Forms.Cursors.Hand;
            this.quitBtn.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.quitBtn.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.quitBtn.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.quitBtn.Location = new System.Drawing.Point(21, 183);
            this.quitBtn.Name = "quitBtn";
            this.quitBtn.Padding = new System.Windows.Forms.Padding(2);
            this.quitBtn.Size = new System.Drawing.Size(137, 35);
            this.quitBtn.TabIndex = 3;
            this.quitBtn.Text = "Thoát";
            this.quitBtn.UseVisualStyleBackColor = true;
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.txtPassQL);
            this.panel5.Controls.Add(this.label1);
            this.panel5.Location = new System.Drawing.Point(21, 113);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(282, 49);
            this.panel5.TabIndex = 2;
            // 
            // txtPassQL
            // 
            this.txtPassQL.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassQL.Location = new System.Drawing.Point(107, 13);
            this.txtPassQL.Name = "txtPassQL";
            this.txtPassQL.Size = new System.Drawing.Size(175, 26);
            this.txtPassQL.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Cambria", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(3, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mật khẩu";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Cambria", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(58, 18);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(191, 22);
            this.label2.TabIndex = 2;
            this.label2.Text = "ĐĂNG NHẬP QUẢN LÝ";
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.txtUserNameQL);
            this.panel6.Controls.Add(this.label3);
            this.panel6.Location = new System.Drawing.Point(21, 58);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(282, 49);
            this.panel6.TabIndex = 1;
            // 
            // txtUserNameQL
            // 
            this.txtUserNameQL.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUserNameQL.Location = new System.Drawing.Point(107, 13);
            this.txtUserNameQL.Name = "txtUserNameQL";
            this.txtUserNameQL.Size = new System.Drawing.Size(175, 26);
            this.txtUserNameQL.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Cambria", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(3, 16);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(109, 17);
            this.label3.TabIndex = 0;
            this.label3.Text = "Tên đăng nhập";
            // 
            // fLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(348, 276);
            this.Controls.Add(this.tabControl);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "fLogin";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đăng nhập";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FLogin_FormClosing);
            this.Load += new System.EventHandler(this.fLogin_Load);
            this.tabControl.ResumeLayout(false);
            this.NhanVien.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.QuanLy.ResumeLayout(false);
            this.tab2.ResumeLayout(false);
            this.tab2.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.panel6.ResumeLayout(false);
            this.panel6.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl;
        private System.Windows.Forms.TabPage NhanVien;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnLoginNV;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox txtPassNV;
        private System.Windows.Forms.Label lblPhoneNumber;
        private System.Windows.Forms.Label lblTitleLoginForm;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox txtUserNameNV;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.TabPage QuanLy;
        private System.Windows.Forms.Panel tab2;
        private System.Windows.Forms.Button LoginBtnQL;
        private System.Windows.Forms.Button quitBtn;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.TextBox txtPassQL;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.TextBox txtUserNameQL;
        private System.Windows.Forms.Label label3;

    }
}

