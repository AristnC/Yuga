#ifndef REMOTEACCESS_H
#define REMOTEACCESS_H

#include <QObject>

class QNetworkAccessManager;

class TRemoteAccess : public QObject
{
    Q_OBJECT
public:
    explicit TRemoteAccess(QObject *parent = nullptr);
    Q_INVOKABLE QString geNamedQML(const QString &);

signals:

private:
    QNetworkAccessManager * m_NetworkAccess;

};

#endif // REMOTEACCESS_H
