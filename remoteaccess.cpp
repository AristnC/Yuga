#include "remoteaccess.h"

#include <QNetworkAccessManager>

TRemoteAccess::TRemoteAccess(QObject *parent) :
    QObject(parent),
    m_NetworkAccess(new QNetworkAccessManager(this))
{

}

QString TRemoteAccess::geNamedQML(const QString &)
{
    return "";
}
