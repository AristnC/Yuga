#ifndef REMOTEACCESS_H
#define REMOTEACCESS_H

#include <QObject>

class RemoteAccess : public QObject
{
    Q_OBJECT
public:
    explicit RemoteAccess(QObject *parent = nullptr);

signals:

};

#endif // REMOTEACCESS_H