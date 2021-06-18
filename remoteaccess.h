#ifndef REMOTEACCESS_H
#define REMOTEACCESS_H

#include <QObject>

class RemoteAccess : public QObject
{
    Q_OBJECT
public:
    explicit RemoteAccess(QObject *parent = nullptr);
    Q_INVOKABLE QString geNamedQML(const QString &);

signals:

};

#endif // REMOTEACCESS_H
