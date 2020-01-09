namespace ShopManagementSystem
{
    partial class InHoaDon
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
            this.txtMaHD = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.grdView = new System.Windows.Forms.DataGridView();
            this.cTDonMuaHangBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.btnSearch = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.grdView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cTDonMuaHangBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // txtMaHD
            // 
            this.txtMaHD.Location = new System.Drawing.Point(85, 11);
            this.txtMaHD.Multiline = true;
            this.txtMaHD.Name = "txtMaHD";
            this.txtMaHD.Size = new System.Drawing.Size(220, 30);
            this.txtMaHD.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 13);
            this.label1.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 28);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Mã Hóa đơn";
            // 
            // grdView
            // 
            this.grdView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdView.Location = new System.Drawing.Point(15, 57);
            this.grdView.Name = "grdView";
            this.grdView.Size = new System.Drawing.Size(740, 258);
            this.grdView.TabIndex = 3;
            // 
            // cTDonMuaHangBindingSource
            // 
            this.cTDonMuaHangBindingSource.DataSource = typeof(ShopManagementSystem.CTDonMuaHang);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(312, 17);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(75, 23);
            this.btnSearch.TabIndex = 4;
            this.btnSearch.Text = "Tra Cứu";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // InHoaDon
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(767, 397);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.grdView);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtMaHD);
            this.Name = "InHoaDon";
            this.Text = "InHoaDon";
            ((System.ComponentModel.ISupportInitialize)(this.grdView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cTDonMuaHangBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtMaHD;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView grdView;
        private System.Windows.Forms.BindingSource cTDonMuaHangBindingSource;
        private System.Windows.Forms.Button btnSearch;
    }
}