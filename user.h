#ifndef USER_H
#define USER_H
#include<string>
using namespace std;
#include <QObject>

class User
{
    Q_OBJECT
    string user_email="";
    string user_password="";
public:
    bool is_manager;
    string user_id;
    User(){
        is_manager = false;
        user_id = " ";
    };
    bool sign_in_request(string id,string password);
    bool sign_up_request(string id,string email,string password);

};

#endif // USER_H
