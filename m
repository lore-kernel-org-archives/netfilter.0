From: Arturo Borrero <aborrero@cica.es>
Subject: Conntrackd issue with bonding
Date: Fri, 10 Aug 2012 09:09:02 +0200
Message-ID: <5024B38E.1060200@cica.es>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms010300070001060104080909"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: pablo@netfilter.org

This is a cryptographically signed message in MIME format.

--------------ms010300070001060104080909
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi there!

It's seem that there is a issue with Conntrackd using a bonding as=20
dedicated interface.


The log:

[Thu Aug  9 14:14:23 2012] (pid=3D3819) [notice] -- starting in daemon mo=
de --
[Thu Aug  9 14:14:23 2012] (pid=3D3819) [ERROR] no dedicated links availa=
ble!
[Thu Aug  9 14:14:23 2012] (pid=3D3819) [ERROR] no dedicated links availa=
ble!
[Thu Aug  9 14:14:23 2012] (pid=3D3819) [ERROR] no dedicated links availa=
ble!
[Thu Aug  9 14:19:54 2012] (pid=3D3819) [notice] ---- shutdown received -=
---


Or maybe i'm missing something important in the configuration:

/etc/conntrackd/conntrackd.conf

Sync {
         Mode ALARM {
                 RefreshTime 15
                 CacheTimeout 180
         }
         Multicast {
                 IPv4_address 225.0.0.50
                 Group 3780
                 IPv4_interface 172.16.0.1
                 Interface bond2
                 SndSocketBuffer 1249280
                 RcvSocketBuffer 1249280
                 Checksum on
         }
}
General {
     HashSize 8192
     HashLimit 65535
     LogFile on
     Syslog on
     LockFile /var/lock/conntrackd.lock
     UNIX {
         Path /var/run/conntrackd.sock
         Backlog 20
     }
     SocketBufferSize 262142
     SocketBufferSizeMaxGrown 655355
     Filter {
         Protocol Accept {
             TCP
         }
         Address Ignore
         {
             IPv4_address 127.0.0.1 # loopback
             IPv4_address 172.16.0.1 # cluster link
             IPv4_address 172.16.0.2 # cluster link
             IPv4_address xx.40
             IPv4_address xx.41
             IPv6_address xx::40
             IPv6_address xx::41
             IPv6_address xx::41
         }
     }
}

Bond2 is up and running:

bond2     Link encap:Ethernet  HWaddr 00:xx:xx:57:b8:xx
           inet addr:172.16.0.1  Bcast:172.16.255.255  Mask:255.255.0.0
           inet6 addr: fe80::215:xx::/64 Scope:Link
           UP BROADCAST RUNNING MASTER MULTICAST  MTU:1500  Metric:1
           RX packets:7405527 errors:0 dropped:0 overruns:0 frame:0
           TX packets:3935915 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:7812500663 (7.2 GiB)  TX bytes:651422232 (621.2 MiB)


Any idea?

I'm using this version (Debian amd64)

:~$ conntrackd -v
Connection tracking userspace daemon v1.2.1. Licensed under GPLv2.
(C) 2006-2009 Pablo Neira Ayuso <pablo@netfilter.org>

--=20
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica
Centro Inform=E1tico Cient=EDfico de Andaluc=EDa (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa



--------------ms010300070001060104080909
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIOCzCC
BIowggNyoAMCAQICECf06hH0eobEbp27bqkXBwcwDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UE
BhMCU0UxFDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5h
bCBUVFAgTmV0d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0w
NTA2MDcwODA5MTBaFw0yMDA1MzAxMDQ4MzhaMIGuMQswCQYDVQQGEwJVUzELMAkGA1UECBMC
VVQxFzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVRO
LVVTRVJGaXJzdC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsjmFpPJ9q0E7YkY3rs3BYHW8OWX5ShpHornMSMxqmNVN
NRm5pELlzkniii8efNIxB8dOtINknS4p1aJkxIW9hVE1eaROaJB7HHqkkqgX8pgV8pPMyaQy
lbsMTzC9mKALi+VuG6JG+ni8om+rWV6lL8/K2m2qL+usobNqqrcuZzWLeeEeaYji5kbNoKXq
vgvOdjp6Dpvq/NonWz1zHyLmSGHGTPNpsaguG7bUMSAsvIKKjqQOpdeJQ/wWWq8dcdcRWdq6
hw2v+vPhwvCkxWeM1tZUOt4KpLoDd7NlyP0e03RiqhjKaJMeoYV+9Udly/hNVyh00jT/MLbu
9mIwFIws6wIDAQABo4HhMIHeMB8GA1UdIwQYMBaAFK29mHo0tCb3+sQmVO8DveAky1QaMB0G
A1UdDgQWBBSJgmd9xJ0mcABLtFBIfN49rgRufTAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/
BAUwAwEB/zB7BgNVHR8EdDByMDigNqA0hjJodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9BZGRU
cnVzdEV4dGVybmFsQ0FSb290LmNybDA2oDSgMoYwaHR0cDovL2NybC5jb21vZG8ubmV0L0Fk
ZFRydXN0RXh0ZXJuYWxDQVJvb3QuY3JsMA0GCSqGSIb3DQEBBQUAA4IBAQAZ2IkRbyispgCi
54fBm5AD236hEv0e8+LwAamUVEJrmgnEoG3XkJIEA2Z5Q3H8+G+v23ZF4jcaPd3kWQR4rBz0
g0bzes9bhHIt5UbBuhgRKfPLSXmHPLptBZ2kbWhPrXIUNqi5sf2/z3/wpGqUNVCPz4FtVbHd
WTBK322gnGQfSXzvNrv042n0+DmPWq1LhTq3Du3Tzw1EovsEv+QvcI4l+1pUBrPQxLxtjftz
Mizpm4QkLdZ/kXpoAlAfDj9N6cz1u2fo3BwuO/xOzf4CjuOoEwqlJkRl6RDyTVKnrtw+ymsy
XEFs/vVdoOr/0fqbhlhtPZZH5f4ulQTCAMyOofK7MIIEsjCCA5qgAwIBAgIRAPLoFYEmhueT
Zaxq5fdLfD8wDQYJKoZIhvcNAQEFBQAwOzELMAkGA1UEBhMCTkwxDzANBgNVBAoTBlRFUkVO
QTEbMBkGA1UEAxMSVEVSRU5BIFBlcnNvbmFsIENBMB4XDTExMDUyMzAwMDAwMFoXDTE0MDUy
MjIzNTk1OVowfTE5MDcGCSqGSIb3DQEJAhYqaHR0cDovL3lvLnJlZGlyaXMuZXMvc295L2Fi
b3JyZXJvQGNpY2EuZXMvMSEwHwYDVQQDDBhBcnR1cm8gQm9ycmVybyBHb256w6FsZXoxEDAO
BgNVBAoTB2NpY2EuZXMxCzAJBgNVBAYTAkVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAsyLdpT7KM5cyiDGvce2AaNDMOcM8kqQeNRR5fAD4Gh8kuO/0v3vVDLL5rqKXtCJX
A6ZiF6FSwXrwRLqxuyA/D6OgEZ8Z9I3V5vFJU8oaDZu6sr+bjEiWDks2OFCD5/z/DXuZiRJ5
2kKAxAPKDxQznM3GYvnUjH+qJEjo3ubTBkBCEkDcD1w51xlXmsbzc4Gi1Y5S7j/Yj9W4RLI3
l9de0U64wexcDEY2+M9+EJTqs5HB6uW2K8TMHkGiRJOZJYygtyB8i8Y0Goy9oLhYFmVuI6FE
8zx/mLwA27l5h67jvBYl9UOKAPTPRERPMWpApaUt3LEUx5Un8/bXXA9+QPclkwIDAQABo4IB
bTCCAWkwHwYDVR0jBBgwFoAUY01DWhlIP8RGwQK6v+4O5YK3ZqYwHQYDVR0OBBYEFIRXOwcy
n16Zdo6kyGBp6fVwYusDMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQW
MBQGCCsGAQUFBwMEBggrBgEFBQcDAjAYBgNVHSAEETAPMA0GCysGAQQBsjEBAgIdMD8GA1Ud
HwQ4MDYwNKAyoDCGLmh0dHA6Ly9jcmwudGNzLnRlcmVuYS5vcmcvVEVSRU5BUGVyc29uYWxD
QS5jcmwwcgYIKwYBBQUHAQEEZjBkMDoGCCsGAQUFBzAChi5odHRwOi8vY3J0LnRjcy50ZXJl
bmEub3JnL1RFUkVOQVBlcnNvbmFsQ0EuY3J0MCYGCCsGAQUFBzABhhpodHRwOi8vb2NzcC50
Y3MudGVyZW5hLm9yZzAbBgNVHREEFDASgRBhYm9ycmVyb0BjaWNhLmVzMA0GCSqGSIb3DQEB
BQUAA4IBAQCZZZ4LO4IcwO/Pb802BB1bkqkyJVhjAM9t/d8ytgKh1GRnuY7nHny01A+WMyIk
ukZ/Qsbg39O+dZLmXsu5dyEFREBd4iRnSfsz9byqOwC9JFApDd+125p3qM8O9bG7tk9lpx+1
GD+TTJ0OcL9Mwfw51GD6+76stVZf3S+vEEeoe7ENYiis0BQjE8xzWvJJBUI7ChnCLmbrDSwA
xVp7VjUDSTpmE/ksk64FecvFUMIdbsezhxEYLy8G9xi/mFyEwuCUIQwGW09BnmY0wXHZVTxu
9efZ8gpKv4CdQmDEwbUWfIOF35OPGhnNF4JtLf1iKvIQmR/5SOdKOwbVUBxGq5gvMIIEwzCC
A6ugAwIBAgIQc/5X+t+4xQiBe2a5a/At7zANBgkqhkiG9w0BAQUFADCBrjELMAkGA1UEBhMC
VVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwGA1UEChMVVGhl
IFVTRVJUUlVTVCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVzdC5jb20x
NjA0BgNVBAMTLVVUTi1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBFbWFp
bDAeFw0wOTA1MTgwMDAwMDBaFw0yODEyMzEyMzU5NTlaMDsxCzAJBgNVBAYTAk5MMQ8wDQYD
VQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25hbCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMgV2fUzaiOhkA3PuwVEw6sfSjWFGiGFoE/48EDiSkOb/lux
sL+0V9x1gEFLZBr2209vj9AlRTX56stK+vva0+1FiBGUNuTMqA3vxT037RZ748KVnlgzfyL7
+P/s5r7brgplJSKH2m+Ei0boQIYoP79WCOJK6YOi6SL7Lfq2KB+RwcNx+1PAK06kDKFunVXt
7OEkhzoI4g0c5MRN0Msn+oRk5tGXnVYkW5O7KS5D4kFqPeJKZfyaX1qGh7yHx3mAlplRxpAP
ZJGZfRDdrCwDKuF4ZP7OPU70K1ARS9FY1JsD8H/1O1OwU0P7xS/EBCkaOqzXVenRDpXROzF/
eE+uKS0CAwEAAaOCAU0wggFJMB8GA1UdIwQYMBaAFImCZ33EnSZwAEu0UEh83j2uBG59MB0G
A1UdDgQWBBRjTUNaGUg/xEbBArq/7g7lgrdmpjAOBgNVHQ8BAf8EBAMCAQYwEgYDVR0TAQH/
BAgwBgEB/wIBADAYBgNVHSAEETAPMA0GCysGAQQBsjEBAgIdMFgGA1UdHwRRME8wTaBLoEmG
R2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VVE4tVVNFUkZpcnN0LUNsaWVudEF1dGhlbnRp
Y2F0aW9uYW5kRW1haWwuY3JsMG8GCCsGAQUFBwEBBGMwYTA4BggrBgEFBQcwAoYsaHR0cDov
L2NydC51c2VydHJ1c3QuY29tL1VUTkFBQUNsaWVudF9DQS5jcnQwJQYIKwYBBQUHMAGGGWh0
dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wDQYJKoZIhvcNAQEFBQADggEBAAYrqVMvE9xcORbM
hp9eTHty++yNVYpemgr/U0x29AY9UM9X8KLPr5mMqv6gGXY+mQMy+nWDOIq7a5qlDBOy1Bt2
5pQuZ5hZ45FsApCanMhgS1WryohajSvlaZUDB9HUDvwkIi5ZsWOkX+3ZI3LknM46XGwfT6kA
yR3++n9FLbYuhN0PJ6BZGE7VdiVF9JkmedtvnyP3Q7srDwSjgSYst3s1+T13X0Ah5n8dpZZa
vdDLFjpsu2GLiv0EOUQKyyzhy84uEJga2+CT7UlkZAggn7ejUPCi3cq0xnwMPedeFdwnhuQ6
O1JaF6upBlMrnQlzZBwBw/0w0ocDb+QVA3o5X2gxggJFMIICQQIBATBQMDsxCzAJBgNVBAYT
Ak5MMQ8wDQYDVQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25hbCBDQQIRAPLo
FYEmhueTZaxq5fdLfD8wCQYFKw4DAhoFAKCByzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0xMjA4MTAwNzA5MDJaMCMGCSqGSIb3DQEJBDEWBBSeUTxKoQnL
10aBvlLyLjDJqXFjOjBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQME
AQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBADUqbrFdiY0gxu4YYLSe0VLDxCoq
ooyy17segi7CskwBrAE1nE9eNO3IlvUAP+2ZbnPztiDtyDUGxERHw8iS8oXKcVirQajRWEKq
dfrRmdQEwW6mosOIZ5MTVoCzQlClZkgR9Ab9Pp1OVoQnKxN5jtLcTRXHTAXNBNal4q5y2NYr
qEfgBVb+rE7D5J2X8B3AkRXS/8eqZWtS7bl3Tfq9U5MYBbVkPEzbYHu4gfFC6BPcubfT2tNH
ioPeE0Sr3ssmx9pY0SP72aNyoHBfLnd/LtorTJKWm+To1VSGsT2A7bmYQjGrv3NNVJ4NBJnZ
hs6xVjW89wqNvRbWsXjeXjQad94AAAAAAAA=
--------------ms010300070001060104080909--
