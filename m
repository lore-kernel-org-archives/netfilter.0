From: Arturo Borrero <aborrero@cica.es>
Subject: Re: Conntrackd issue with bonding
Date: Fri, 10 Aug 2012 12:02:54 +0200
Message-ID: <5024DC4E.1080201@cica.es>
References: <5024B38E.1060200@cica.es> <20120810091927.GB1729@1984>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms020905020200040307010806"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120810091927.GB1729@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms020905020200040307010806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/08/12 11:19, Pablo Neira Ayuso wrote:
> On Fri, Aug 10, 2012 at 09:09:02AM +0200, Arturo Borrero wrote:
>> Hi there!
>>
>> It's seem that there is a issue with Conntrackd using a bonding as
>> dedicated interface.
>>
>> The log:
>>
>> [Thu Aug  9 14:14:23 2012] (pid=3D3819) [notice] -- starting in daemon=
 mode --
>> [Thu Aug  9 14:14:23 2012] (pid=3D3819) [ERROR] no dedicated links ava=
ilable!
>> [Thu Aug  9 14:14:23 2012] (pid=3D3819) [ERROR] no dedicated links ava=
ilable!
>> [Thu Aug  9 14:14:23 2012] (pid=3D3819) [ERROR] no dedicated links ava=
ilable!
>> [Thu Aug  9 14:19:54 2012] (pid=3D3819) [notice] ---- shutdown receive=
d ----
>>
>>
>> Or maybe i'm missing something important in the configuration:
>>
>> /etc/conntrackd/conntrackd.conf
>>
>> Sync {
>>          Mode ALARM {
>>                  RefreshTime 15
>>                  CacheTimeout 180
>>          }
>>          Multicast {
>>                  IPv4_address 225.0.0.50
>>                  Group 3780
>>                  IPv4_interface 172.16.0.1
>>                  Interface bond2
>>                  SndSocketBuffer 1249280
>>                  RcvSocketBuffer 1249280
>>                  Checksum on
>>          }
>> }
>> General {
>>      HashSize 8192
>>      HashLimit 65535
>>      LogFile on
>>      Syslog on
>>      LockFile /var/lock/conntrackd.lock
>>      UNIX {
>>          Path /var/run/conntrackd.sock
>>          Backlog 20
>>      }
>>      SocketBufferSize 262142
>>      SocketBufferSizeMaxGrown 655355
>>      Filter {
>>          Protocol Accept {
>>              TCP
>>          }
>>          Address Ignore
>>          {
>>              IPv4_address 127.0.0.1 # loopback
>>              IPv4_address 172.16.0.1 # cluster link
>>              IPv4_address 172.16.0.2 # cluster link
>>              IPv4_address xx.40
>>              IPv4_address xx.41
>>              IPv6_address xx::40
>>              IPv6_address xx::41
>>              IPv6_address xx::41
>>          }
>>      }
>> }
>>
>> Bond2 is up and running:
>>
>> bond2     Link encap:Ethernet  HWaddr 00:xx:xx:57:b8:xx
>>            inet addr:172.16.0.1  Bcast:172.16.255.255  Mask:255.255.0.=
0
>>            inet6 addr: fe80::215:xx::/64 Scope:Link
>>            UP BROADCAST RUNNING MASTER MULTICAST  MTU:1500  Metric:1
>>            RX packets:7405527 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:3935915 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:0
>>            RX bytes:7812500663 (7.2 GiB)  TX bytes:651422232 (621.2 Mi=
B)
>>
>>
>> Any idea?
> Somoething is wrong with the link state checking.
>
> Please, get a working copy of libnfnetlink:
>
> git clone git://git.netfilter.org/libnfnetlink
> autoreconf -fi
> ./configure --prefix=3D/usr
> make
> make check
>
> [no need to make install]
>
> Then go to utils/ directory, run ./iftest and get back to the list to
> report what it says.
>
>> I'm using this version (Debian amd64)
> You didn't mention kernel version, I guess it is standalone Linux
> kernel in Debian? (2.6.32). Using a recent Linux kernel version of the
> 3.x branch is really recommended to run conntrackd.
>
>> :~$ conntrackd -v
>> Connection tracking userspace daemon v1.2.1. Licensed under GPLv2.
> BTW, it's a good idea if you upgrade to 1.2.2. There was a bug in the
> commit operation that is resolved in lastest version.

This is the result of iftest:

root@debian:~/git/libnfnetlink/utils# ./iftest
index (1) is lo (RUNNING) (UP)
index (2) is eth5 (NOT RUNNING) (DOWN)
index (3) is eth2 (RUNNING) (UP)

This is the list of interfaces:
root@debian:~/git/libnfnetlink/utils# ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN mode =

DEFAULT
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth5: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode=20
DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
3: eth2: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq=20
master bond0 state UP mode DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
4: eth4: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode=20
DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
5: eth3: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq=20
master bond0 state UP mode DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
6: eth6: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode=20
DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
7: eth0: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq=20
master bond0 state UP mode DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
8: eth7: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode=20
DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
9: eth1: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq=20
master bond0 state UP mode DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
10: eth8: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc=20
pfifo_fast master bond2 state UP mode DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
11: eth9: <NO-CARRIER,BROADCAST,MULTICAST,SLAVE,UP> mtu 1500 qdisc=20
pfifo_fast master bond2 state DOWN mode DEFAULT qlen 1000
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
12: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc=20
noqueue state UP mode DEFAULT
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff
13: bond1: <NO-CARRIER,BROADCAST,MULTICAST,MASTER,UP> mtu 1500 qdisc=20
noqueue state DOWN mode DEFAULT
     link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
14: bond2: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc=20
noqueue state UP mode DEFAULT
     link/ether 00:asdasd brd ff:ff:ff:ff:ff:ff

The kernel version is:
# uname -r
3.2.0-3-amd64

Regards

--=20
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica
Centro Inform=E1tico Cient=EDfico de Andaluc=EDa (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa



--------------ms020905020200040307010806
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
MBwGCSqGSIb3DQEJBTEPFw0xMjA4MTAxMDAyNTRaMCMGCSqGSIb3DQEJBDEWBBTOshiC2vmC
UGXZJERB3SRvrvUPlDBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQME
AQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAEt2B55gO3xs2kyKoTLIjEHy6fzy
6uRQdc7AzOFExxPX825LXZrMbdLJsHHHw3/X4sbHAlcSkaysj3ruDZljbb/yKsrC0F1g/JXD
sAb/woC890679WzP63KldgA7mtcU5OSSSid17fnj7iQxU6hVhcCuMp+XNlTof1OeQUEZaCc+
bzjnTvQP05D+kFpiiAuk/cxfETYxvCz7r33/2k0Q0soA5yEIoDpY5/BiDDXQYCTv6Pgi2Oh2
bOzLtVsLRD4XHHK64BOUpM7VrXKrQ1FhiYY+dl2h4ER1ZrhK5ijJMf8wlOmgRGBZNGjBsxqM
ia5G83OhTaOiOZ/tVIHFYN33RV0AAAAAAAA=
--------------ms020905020200040307010806--
