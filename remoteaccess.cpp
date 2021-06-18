#include "remoteaccess.h"

RemoteAccess::RemoteAccess(QObject *parent) : QObject(parent)
{

}

QString RemoteAccess::geNamedQML(const QString &)
{
    return "";
}
