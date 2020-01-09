using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class LoginModel
    {
        public int errorCode { get; set; }
        public String message { get; set; }
        public NhanVienModel user { get; set; }
        public String status { get; set; }

        public LoginModel()
        {

        }

        public LoginModel(int errrorCode, String message, NhanVienModel user, String status)
        {
            this.errorCode = errrorCode;
            this.message = message;
            this.user = user;
            this.status = status;
        }

        public LoginModel(Dictionary<String, Object> dict)
        {
            this.errorCode = (int)dict["errorCode"];
            this.message = (String)dict["message"];
            this.user = (NhanVienModel)dict["user"];
            this.status = (String)dict["status"];
        }

        public int getErrorCode()
        {
            return this.errorCode;
        }
        public String getMessage()
        {
            return this.message;
        }
    }
    }

