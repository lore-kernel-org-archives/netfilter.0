From: Arturo Borrero <aborrero@cica.es>
Subject: Re: Conntrackd issue with bonding
Date: Tue, 14 Aug 2012 09:54:12 +0200
Message-ID: <502A0424.5020505@cica.es>
References: <5024B38E.1060200@cica.es> <20120810091927.GB1729@1984> <5024DC4E.1080201@cica.es> <20120812190548.GA512@1984> <5028A96E.7090905@cica.es> <20120813094608.GA22561@1984> <alpine.LNX.2.01.1208131214450.27005@frira.zrqbmnf.qr> <20120813180106.GA23002@1984>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms000104010401000008030506"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120813180106.GA23002@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jan Engelhardt <jengelh@inai.de>, netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms000104010401000008030506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13/08/12 20:01, Pablo Neira Ayuso wrote:
> On Mon, Aug 13, 2012 at 12:35:21PM +0200, Jan Engelhardt wrote:
>> On Monday 2012-08-13 11:46, Pablo Neira Ayuso wrote:
>>> Please, git pull again, run make check, run the test and send me the
>>> results.
>> The problem is that nlif_receive is only called once by nlif_catch,
>> and ignores RTM_F_MULTI, therefore missing most interfaces.
> Thanks Jan. That was indeed the problem.
>
> I have committed the fix for this issue:
>
> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dlibnfnetlink.git;a=3Dco=
mmit;h=3D8b15e485c0d5f4a1e56b2148a34995ed1fa9e95b
>
> @Arturo: Please, install a fresh working copy of libnfnetlink and let
> me know if the problem persists.
>
> Before that, check that ./iftest bond1 displays valid device
> information.

Here is iftest with new git code:

root@debian:~/git/libnfnetlink/utils# ./iftest bond0
index (12) is bond0 (RUNNING) (UP)
root@debian:~/git/libnfnetlink/utils# ./iftest bond1
index (13) is bond1 (RUNNING) (UP)
root@debian:~/git/libnfnetlink/utils# ./iftest eth8
index (10) is eth8 (RUNNING) (UP)
root@debian:~/git/libnfnetlink/utils# ./iftest eth0
index (7) is eth0 (NOT RUNNING) (UP)
root@debian:~/git/libnfnetlink/utils# ip link show bond0
12: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc=20
noqueue state UP mode DEFAULT
     link/ether xx:ff:30 brd ff:ff:ff:ff:ff:ff
root@debian:~/git/libnfnetlink/utils# ip link show bond1
13: bond1: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc=20
noqueue state UP mode DEFAULT
     link/ether xx:f0:20 brd ff:ff:ff:ff:ff:ff
root@debian:~/git/libnfnetlink/utils# ip link show eth8
10: eth8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast=20
state UP mode DEFAULT qlen 1000
     link/ether xx:b8:f8 brd ff:ff:ff:ff:ff:ff
root@debian:~/git/libnfnetlink/utils# ip link show eth0
7: eth0: <NO-CARRIER,BROADCAST,MULTICAST,SLAVE,UP> mtu 1500 qdisc mq=20
master bond0 state DOWN mode DEFAULT qlen 1000
     link/ether xx:ff:30 brd ff:ff:ff:ff:ff:ff

And using the new libnfnetlink:

root@debian:~/git/libnfnetlink# mv /usr/lib/libnfnetlink.so.0=20
/usr/lib/libnfnetlink.so.0.backup
root@debian:~/git/libnfnetlink# ln -s /usr/local/lib/libnfnetlink.so.0=20
/usr/lib/libnfnetlink.so.0
root@debian:~/git/libnfnetlink# tailf /var/log/conntrackd.log &
[1] 13423
root@debian:~/git/libnfnetlink# conntrackd -d
[Tue Aug 14 09:44:55 2012] (pid=3D13425) [notice] using user-space event =

filtering
[Tue Aug 14 09:44:55 2012] (pid=3D13425) [notice] netlink event socket=20
buffer size has been set to 262142 bytes
[Tue Aug 14 09:44:55 2012] (pid=3D13425) [notice] initialization complete=
d
[Tue Aug 14 09:44:55 2012] (pid=3D13428) [notice] -- starting in daemon=20
mode --
root@debian:~/git/libnfnetlink# conntrackd -s
cache internal:
current active connections:               2
connections created:                   2    failed:               0
connections updated:                   0    failed:               0
connections destroyed:                   0    failed:               0

cache external:
current active connections:               0
connections created:                   0    failed:               0
connections updated:                   0    failed:               0
connections destroyed:                   0    failed:               0

traffic processed:
                    0 Bytes                         0 Pckts

multicast traffic (active device=3Deth8):
                 1296 Bytes sent                    0 Bytes recv
                   18 Pckts sent                    0 Pckts recv
                    0 Error send                    0 Error recv

message tracking:
                    0 Malformed msgs                    0 Lost msgs


It seems fine. I will do more tests.

I will contact Debian, so they update the package and it's easy for us=20
to use the new version.

--=20
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica
Centro Inform=E1tico Cient=EDfico de Andaluc=EDa (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa



--------------ms000104010401000008030506
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
MBwGCSqGSIb3DQEJBTEPFw0xMjA4MTQwNzU0MTJaMCMGCSqGSIb3DQEJBDEWBBQu+GwQbtDT
y2kD+Ua3X04Wb93UZjBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQME
AQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAAyIEcDV+ywk1oqJ7SyXpoeMviAq
aGPbyCA+Y6U/5GYBvQ1PfSHSt9PHuwliKPhDCGQusAcLgJfq3oQ2eOYm1xqAxADYbb2Cx926
PwFsvoQrBScQj/YGGLJrVTDMXDCH8bWUnbCWrqD6xkQxq9JHjDmFVRty1nPxeHi80JnoNY3M
VxJSd2eFCNZ7ktgNDKAx4/IKfk5iQqinn3gwHmJMIsg/HL+XF6EThgn9OxGsE+pzm6vBEjB4
YoHo9zbTE+Vu4fWjNxgyP0HhGIYL/SSMswsxR6pmJ3a5ZPhHdGPMaDS5T2W5Qx7BGY5HPeXz
UkOu94LPxISbmcu7BcqN6gQ5eM4AAAAAAAA=
--------------ms000104010401000008030506--
