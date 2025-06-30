#ifndef DATABASE_H
#define DATABASE_H
#include <QCoreApplication>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QVariantList>
#include <QVariantMap>
#include<string>
using namespace std;
class database
{
public:
    QSqlDatabase user_db;
    QSqlDatabase history_db;
    QSqlDatabase book_db;
    database();//初始化三个数据库
    string user_sign_in();//检查密码是否正确
    bool user_sign_up(string id,string email,string password);//用户注册请求
    QVariantList search_by_book_name(string book_name);
    QVariantList search_by_book_author(string author);
    QVariantList search_by_history_user(string user_id);
};

#endif // DATABASE_H
