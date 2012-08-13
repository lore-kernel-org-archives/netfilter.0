From: Arturo Borrero <aborrero@cica.es>
Subject: Re: Conntrackd issue with bonding
Date: Mon, 13 Aug 2012 09:14:54 +0200
Message-ID: <5028A96E.7090905@cica.es>
References: <5024B38E.1060200@cica.es> <20120810091927.GB1729@1984> <5024DC4E.1080201@cica.es> <20120812190548.GA512@1984>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms050407080200050704050606"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120812190548.GA512@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms050407080200050704050606
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/08/12 21:05, Pablo Neira Ayuso wrote:
> On Fri, Aug 10, 2012 at 12:02:54PM +0200, Arturo Borrero wrote:
> [...]
>>> Somoething is wrong with the link state checking.
>>>
>>> Please, get a working copy of libnfnetlink:
>>>
>>> git clone git://git.netfilter.org/libnfnetlink
>>> autoreconf -fi
>>> ./configure --prefix=3D/usr
>>> make
>>> make check
>>>
>>> [no need to make install]
>>>
>>> Then go to utils/ directory, run ./iftest and get back to the list to=

>>> report what it says.
>>>
> [...]
>> This is the result of iftest:
>>
>> root@debian:~/git/libnfnetlink/utils# ./iftest
>> index (1) is lo (RUNNING) (UP)
>> index (2) is eth5 (NOT RUNNING) (DOWN)
>> index (3) is eth2 (RUNNING) (UP)
> Hm, not very useful sorry :-(
>
> Please, git pull and run make check again. Then, run:
>
> ./iftest bond2
>
> to obtain the device flags. Compare that output to that of `ip link'.
>
> I want to make sure there's no problem with obtaining the device
> flags.
Hi there,

results here (i'm no longer using bond2, but others):

root@debian:~/git/libnfnetlink/utils# ./iftest bond1
Cannot translate device idx=3D13
root@debian:~/git/libnfnetlink/utils# ./iftest bond0
Cannot translate device idx=3D12
root@debian:~/git/libnfnetlink/utils# ./iftest eth8
Cannot translate device idx=3D10
root@debian:~/git/libnfnetlink/utils# ./iftest eth1
Cannot translate device idx=3D9
root@debian:~/git/libnfnetlink/utils# ip link show bond1
13: bond1: <NO-CARRIER,BROADCAST,MULTICAST,MASTER,UP> mtu 1500 qdisc=20
noqueue state DOWN mode DEFAULT
     link/ether xx:f0:20 brd ff:ff:ff:ff:ff:ff
root@debian:~/git/libnfnetlink/utils# ip link show bond0
12: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc=20
noqueue state UP mode DEFAULT
     link/ether xx:ff:30 brd ff:ff:ff:ff:ff:ff
root@debian:~/git/libnfnetlink/utils# ip link show eth8
10: eth8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast=20
state UP mode DEFAULT qlen 1000
     link/ether xx:b8:f8 brd ff:ff:ff:ff:ff:ff
root@debian:~/git/libnfnetlink/utils# ip link show eth1
9: eth1: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq=20
master bond0 state UP mode DEFAULT qlen 1000
     link/ether xx:ff:30 brd ff:ff:ff:ff:ff:ff

note eth1 being slave of bond0 and eth8 being a standar interface.

--=20
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica
Centro Inform=E1tico Cient=EDfico de Andaluc=EDa (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa



--------------ms050407080200050704050606
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
MBwGCSqGSIb3DQEJBTEPFw0xMjA4MTMwNzE0NTRaMCMGCSqGSIb3DQEJBDEWBBSgv7OsUJFx
0r4a5cOlZrAHA9uRmTBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQME
AQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAKVWl42hhdLe0wgdhh3nW2md+NXt
fkbwA5W4GPbZ6vUciHDgNqx/2pLkNFnVu+8hB/FiVG4lCM/bFDqn30eL8m2TrTNQrvMWuPan
OwsxHIYx8rQp4/WqTfiM5yN0s6EooF/XGSizU2q82gKeZ628oeaLXU9v4u2eaQOajVd82G/b
khAA106HML5aAvu1E2z5k4opBLhkDyW+oBLbeQa7f/tcN3gn+nHRWkeU5XekEKZkGX/A5V3i
Z0KDw6eYWCxddNZ1xWO0YJmvOPeKqprQOEwQgcnmu0oVzgyYfYMDtXp9yrpjnDnqEf30BUzz
IpAF3SoX9clObC1qLkrBJ6XVJbIAAAAAAAA=
--------------ms050407080200050704050606--
