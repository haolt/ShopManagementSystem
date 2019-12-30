using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class LoginModel
    {
        int errorCode;
        String message;
        UserInfoModel user;
        String status;

        public LoginModel()
        {

        }

        public LoginModel(int errrorCode,  String message,  UserInfoModel user,  String status) {
            this.errorCode = errrorCode;
            this.message = message;
            this.user = user;
            this.status = status;
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

