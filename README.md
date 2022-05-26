# 2022-05 Project-X - REST in pease

REST endpoint for manipulating Hazelcast`IMap` data with client security support.

## Simple HTTP scenario (port 8080)

```xml
<security enabled="true">
    <realms>
        <realm name="cr">
            <authentication>
                <simple>
                    <user username="jdoe" password="1234">
                        <role>admin</role>
                    </user>
                    <user username="jduke" password="theduke">
                        <role>dev</role>
                    </user>
                </simple>
            </authentication>
        </realm>
    </realms>
    <client-authentication realm="cr" />
    <client-permissions>
        <all-permissions principal="admin" />
        <map-permission principal="dev" name="test">
            <actions>
                <action>all</action>
            </actions>
        </map-permission>
    </client-permissions>
</security>
```

```bash
./start-simple.sh

# try without authentication and with wrong password (401 Unauthorized)
curl --data myvalue -v http://127.0.0.1:8080/map/mymap/mykey
curl --data myvalue --user test:1234 -v http://127.0.0.1:8080/map/mymap/mykey

# try with correct password, but without proper permissions (403 Forbidden)
curl --data myvalue --user jduke:theduke -v http://127.0.0.1:8080/map/mymap/mykey

# proper credentials and permissions granted (200 OK)
curl --data myvalue --user jduke:theduke -v http://127.0.0.1:8080/map/test/mykey
```
