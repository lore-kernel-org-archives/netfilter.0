From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: ipset - bitmap:ip,mac kernel crashes, errors
Date: Mon, 15 Apr 2013 08:13:47 +0200
Message-ID: <516B9A9B.8040907@univ-nantes.fr>
References: <7a05d31eedfbe24e7ebf47c00df77176.squirrel@webmail.univ-nantes.fr>    <alpine.DEB.2.00.1304111652180.32023@blackhole.kfki.hu>    <b4b9d9095cc35c0d3c167d09d9ac269b.squirrel@webmail.univ-nantes.fr>    <alpine.DEB.2.00.1304111810520.32023@blackhole.kfki.hu>    <b108bc79c3422cb7b587039ff4232f50.squirrel@webmail.univ-nantes.fr>    <alpine.DEB.2.00.1304112008540.32023@blackhole.kfki.hu> <340e58227e1c00fc6ff088d3a64ee928.squirrel@webmail.univ-nantes.fr> <alpine.DEB.2.00.1304131447350.4871@blackhole.kfki.hu>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms000503030907040100040804"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1304131447350.4871@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms000503030907040100040804
Content-Type: multipart/mixed;
 boundary="------------020008070603030700000201"

This is a multi-part message in MIME format.
--------------020008070603030700000201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable


> Thanks indeed, it helped, I could reproduce the bug easily. The fix wil=
l
> be sent for kernel inclusion in a few minutes and there'll be a new ips=
et
> release at the weekend.
>

Hi Jozsef,

Great, your patch solves the problem. Thanks a lot for your help and the =

bug fixing !

Regards,
--=20
Universit=E9 de Nantes - Direction des Syst=E8mes d'Information
IM jabber: yoann.juet@univ-nantes.fr


--------------020008070603030700000201
Content-Type: text/x-vcard; charset=utf-8;
 name="yoann_juet.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="yoann_juet.vcf"

begin:vcard
fn:Yoann Juet
n:Juet;Yoann
org;quoted-printable;quoted-printable:Direction des Syst=3DC3=3DA8mes d'I=
nformation;P=3DC3=3DB4le R=3DC3=3DA9seau
adr;quoted-printable:BP 92208;;2 rue de la Houssini=3DC3=3DA8re;Nantes Ce=
dex 3;;44322;France
email;internet:yoann.juet@univ-nantes.fr
tel;work:02.53.48.49.26
tel;fax:02.53.48.49.09
tel;cell:06.73.15.42.19
version:2.1
end:vcard


--------------020008070603030700000201--

--------------ms000503030907040100040804
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJcDCC
BKUwggONoAMCAQICEQCaw9r4AWwhPTK3X2MyL6H8MA0GCSqGSIb3DQEBBQUAMDsxCzAJBgNV
BAYTAk5MMQ8wDQYDVQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25hbCBDQTAe
Fw0xMTA4MTcwMDAwMDBaFw0xNDA4MTYyMzU5NTlaMGcxCzAJBgNVBAYTAkZSMR0wGwYDVQQK
ExRVTklWRVJTSVRFIERFIE5BTlRFUzETMBEGA1UEAxMKWW9hbm4gSlVFVDEkMCIGCSqGSIb3
DQEJAhYVanVldC15QHVuaXYtbmFudGVzLmZyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAzT4cyMjT4IaRAql635iNoxjb9ticpoS8Qauq9qGkV2HzDOqjI5SIc0nlU1EOWnbO
05cewhUbOcM1YunHBSahw5cltsC3Uu4D2XAVQ5vD9VmS9kV2eBn3T9vSB1Yz7r7xSPOhHN50
8qspRwgRExu1tFANqG7TMJbFtN5iG22fiQkNzlVLDV3vgB6B9eJaAayfVlZSq+QUMv2dp6AI
8g7Z1tInb7EWVMbB17d7rSfGXJnQHN9wlRduAg2r+PfHcH2Z6Bxmxl66GABxH9keZxdnfo6G
ph0/l0FFj7VwitXEU7V1kTuq7+vZc5qAT/mcSPO471+KzfU14AgEc8qvALV6iQIDAQABo4IB
djCCAXIwHwYDVR0jBBgwFoAUY01DWhlIP8RGwQK6v+4O5YK3ZqYwHQYDVR0OBBYEFKPfL4a9
soFXobME5dHUc30NI4iCMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQW
MBQGCCsGAQUFBwMEBggrBgEFBQcDAjAYBgNVHSAEETAPMA0GCysGAQQBsjEBAgIdMD8GA1Ud
HwQ4MDYwNKAyoDCGLmh0dHA6Ly9jcmwudGNzLnRlcmVuYS5vcmcvVEVSRU5BUGVyc29uYWxD
QS5jcmwwcgYIKwYBBQUHAQEEZjBkMDoGCCsGAQUFBzAChi5odHRwOi8vY3J0LnRjcy50ZXJl
bmEub3JnL1RFUkVOQVBlcnNvbmFsQ0EuY3J0MCYGCCsGAQUFBzABhhpodHRwOi8vb2NzcC50
Y3MudGVyZW5hLm9yZzAkBgNVHREEHTAbgRlZb2Fubi5KdWV0QHVuaXYtbmFudGVzLmZyMA0G
CSqGSIb3DQEBBQUAA4IBAQCsH20G5ntaV5rBAKu+TjhdseCOkRFhExE6W+ImhXJb1aKFLtnt
epvS6pTenXbBp+8OTjOXDJ9JpmA6sbGpy8FYIThiDiRLVMf1kVgU4ECDo2RE6AHtnRJ645Dw
+fvXbFef9u+0aGehKREb6OVdl/6x9DFQvVm/bj9hQtXPusCXYUe1b/ZCbUKFQSfmXwFMLmFb
U64YhP3YRczYaznadT8Cm0INpaYZJatUan74iufwiC71toLGOEnupbQGOLSHalBdAy+u9WGl
5Nm+oE+R+m8tqbRFUn9GSiswSi7RQXxk4O/qOev3/aF+cG4W4D5DCVBsKqTpFcu1fgzdzWQE
IxRTMIIEwzCCA6ugAwIBAgIQc/5X+t+4xQiBe2a5a/At7zANBgkqhkiG9w0BAQUFADCBrjEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwG
A1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0
cnVzdC5jb20xNjA0BgNVBAMTLVVUTi1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IGFuZCBFbWFpbDAeFw0wOTA1MTgwMDAwMDBaFw0yODEyMzEyMzU5NTlaMDsxCzAJBgNVBAYT
Ak5MMQ8wDQYDVQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25hbCBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMgV2fUzaiOhkA3PuwVEw6sfSjWFGiGFoE/4
8EDiSkOb/luxsL+0V9x1gEFLZBr2209vj9AlRTX56stK+vva0+1FiBGUNuTMqA3vxT037RZ7
48KVnlgzfyL7+P/s5r7brgplJSKH2m+Ei0boQIYoP79WCOJK6YOi6SL7Lfq2KB+RwcNx+1PA
K06kDKFunVXt7OEkhzoI4g0c5MRN0Msn+oRk5tGXnVYkW5O7KS5D4kFqPeJKZfyaX1qGh7yH
x3mAlplRxpAPZJGZfRDdrCwDKuF4ZP7OPU70K1ARS9FY1JsD8H/1O1OwU0P7xS/EBCkaOqzX
VenRDpXROzF/eE+uKS0CAwEAAaOCAU0wggFJMB8GA1UdIwQYMBaAFImCZ33EnSZwAEu0UEh8
3j2uBG59MB0GA1UdDgQWBBRjTUNaGUg/xEbBArq/7g7lgrdmpjAOBgNVHQ8BAf8EBAMCAQYw
EgYDVR0TAQH/BAgwBgEB/wIBADAYBgNVHSAEETAPMA0GCysGAQQBsjEBAgIdMFgGA1UdHwRR
ME8wTaBLoEmGR2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VVE4tVVNFUkZpcnN0LUNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kRW1haWwuY3JsMG8GCCsGAQUFBwEBBGMwYTA4BggrBgEFBQcw
AoYsaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VUTkFBQUNsaWVudF9DQS5jcnQwJQYIKwYB
BQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wDQYJKoZIhvcNAQEFBQADggEBAAYr
qVMvE9xcORbMhp9eTHty++yNVYpemgr/U0x29AY9UM9X8KLPr5mMqv6gGXY+mQMy+nWDOIq7
a5qlDBOy1Bt25pQuZ5hZ45FsApCanMhgS1WryohajSvlaZUDB9HUDvwkIi5ZsWOkX+3ZI3Lk
nM46XGwfT6kAyR3++n9FLbYuhN0PJ6BZGE7VdiVF9JkmedtvnyP3Q7srDwSjgSYst3s1+T13
X0Ah5n8dpZZavdDLFjpsu2GLiv0EOUQKyyzhy84uEJga2+CT7UlkZAggn7ejUPCi3cq0xnwM
PedeFdwnhuQ6O1JaF6upBlMrnQlzZBwBw/0w0ocDb+QVA3o5X2gxggMKMIIDBgIBATBQMDsx
CzAJBgNVBAYTAk5MMQ8wDQYDVQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25h
bCBDQQIRAJrD2vgBbCE9MrdfYzIvofwwCQYFKw4DAhoFAKCCAY8wGAYJKoZIhvcNAQkDMQsG
CSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTMwNDE1MDYxMzQ3WjAjBgkqhkiG9w0BCQQx
FgQUn3f+oNRH78ybAokTUSGGZEw8BjAwXwYJKwYBBAGCNxAEMVIwUDA7MQswCQYDVQQGEwJO
TDEPMA0GA1UEChMGVEVSRU5BMRswGQYDVQQDExJURVJFTkEgUGVyc29uYWwgQ0ECEQCaw9r4
AWwhPTK3X2MyL6H8MGEGCyqGSIb3DQEJEAILMVKgUDA7MQswCQYDVQQGEwJOTDEPMA0GA1UE
ChMGVEVSRU5BMRswGQYDVQQDExJURVJFTkEgUGVyc29uYWwgQ0ECEQCaw9r4AWwhPTK3X2My
L6H8MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcN
AwICASgwDQYJKoZIhvcNAQEBBQAEggEAOCE+VBX69+eA6M3Fb2SvRm+m5V2bciPstnxzk8AX
8vs6mWoUMYrQSzR+T7NzRfyKFpSUm19rFqWyXO7YK+MlTSVj/x78iekNFj9dMBsNdowodIQj
MJzjRB6ynnPE4bkpOFIkMHvVIIcSmzYRDt5RxrzG3SHMQeWlWM5Cx85ryn3oL0pOXHN2HZYs
2iZG1Y3bUCCWx+cqdNdbErophM8bYg7nQtaMIZKuxiuNn3ms7VeoQz/E17Z1BUnI43Ekwbyb
QNnfVuXhc67VMCN74DtvQRPcwHiHxm2K/tRYY1trSuCuOJeGBxQmA19GSEkyV0iX7dXIgT3O
JSdwRvT+7U65rAAAAAAAAA==
--------------ms000503030907040100040804--
