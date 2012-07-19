From: Arturo Borrero <aborrero@cica.es>
Subject: Re: Gathering netfilter-related usage information
Date: Thu, 19 Jul 2012 13:24:57 +0200
Message-ID: <5007EE89.7070505@cica.es>
References: <CAPfcJat8-b2sYOCzPjAAbZgLPM4Edz6MuusS1EXUVnn7KghvYA@mail.gmail.com> <alpine.DEB.2.00.1207182208230.13646@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms040906040907000503010809"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1207182208230.13646@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms040906040907000503010809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18/07/12 22:11, Jozsef Kadlecsik wrote:
> On Wed, 18 Jul 2012, Arturo Borrero wrote:
>
>> I don't know how to collect:
>>
>> ? Data about ipset memory usage (kernel pages, bytes or whatever)
> "ipset list -terse" lists just the headers of the sets, including the
> amount of allocated bytes for every set.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Scie=
nces
>            H-1525 Budapest 114, POB. 49, Hungary

Hi there,

Now I have this output:

root@rasca:~# ./nfstats
# nfstats: some data about netfilter usage.
# jue jul 19 13:19:20 CEST 2012
###########################################

Number of iptables rules: 25550
Number of ip6tables rules: 415
Total number of rules: 25965
Rules memory usage: 40 MB
Average memory usage per rule: 1637 Bytes

Number of created ipsets: 34
Ipset memory usage: 249 KB

Netfilter modules memory usage: 333 KB

Conntrack max connections to track: 64620
Number of tracked connections: 19
Conntrack memory usage: 152 KB

Total netfilter memory usage: 41 MB
System physical memory porcentage [%]: 4.08656


What would be nice to add to get a more complete report? Any other=20
advice or hint?

I will finish the script and then mail the list again for sharing the cod=
e.

Best regards.

--=20
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica
Centro Inform=E1tico Cient=EDfico de Andaluc=EDa (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa



--------------ms040906040907000503010809
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
MBwGCSqGSIb3DQEJBTEPFw0xMjA3MTkxMTI0NTdaMCMGCSqGSIb3DQEJBDEWBBT6j/LSfPMr
Y5pssm7fFZlUUOnYVzBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQME
AQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAItE/XCicppWnGfleb2CvzW9YUF9
+h0x92Pvk11x8hWvM0ypNuZRKMBKVBUFEuwYF7Ls286D3DNuhoC9hXHeFrey6hQG0eWaeCu/
6Pc083j3w6End7eJWFpG4vVPO10i0amTGMleSfN32nACCpWSBl1XnxJPOwc8Esl8iHC4nFJJ
DHLF6XhHBjkIYdT1Iu2T66bbFjrK9P/A1FrlEqS8dXJTZ74zyqevy/21kAVJHrVjxlYbATtx
lAEPHHLXd04ljDyL1QP2tnOzfl1AgFYfPUvrzYltj8NkzjMgyJDCMDTK6T2wzB89MCewky9z
brEoe1QbkBMWys2Fy0yRA46JqFAAAAAAAAA=
--------------ms040906040907000503010809--
