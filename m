From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: NFQUEUE target + queue-bypass option, expected behavior
Date: Thu, 13 Feb 2014 17:20:29 +0100
Message-ID: <52FCF0CD.9030202@univ-nantes.fr>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms040004030104080808030302"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms040004030104080808030302
Content-Type: multipart/mixed;
 boundary="------------030208010005060209010306"

This is a multi-part message in MIME format.
--------------030208010005060209010306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

I have two questions about NFQUEUE target and queue-bypass option. To=20
begin with, what is the expected behavior with iptables v1.4.14 ?

(*) extract from the manual page of iptables v1.4.14:
        --queue-bypass
	[...] When this option is used, the NFQUEUE rule is silently
	bypassed instead. The packet will move on to the next rule.

(*) extract from the manual page of iptables-extensions v1.4.20+:
        --queue-bypass
	[...] When this option is used, the NFQUEUE rule behaves like
	ACCEPT instead, and the packet will move on to the next table.

On a standard debian/stable machine (wheezy, iptables v1.4.14), all=20
packets are accepted if no userspace program is listening on an NFQUEUE. =

Next iptables rules are never matched. A man-page mistake ?

Assuming that this is the expected behavior (ACCEPT), a second question=20
arises. I'd like to merge on a single machine firewall=20
(netfilter/iptables) and IPS (suricata) services. In case of suricata=20
failure, the firewall should run into a degraded state where packets=20
move on to the next rule (i.e. to L3/L4 firewall rules). Is it=20
technically possible with iptables v1.4.14 or higher versions ? In my=20
point of view, omitting queue-bypass option could be too disruptive for=20
a L7 firewall whereas inserting it is far too permissive.

---
Just to refine my setup, the following rule is added at the first=20
position of the table FORWARD:

iptables -I FORWARD  -m mark ! --mark 1/1 -j NFQUEUE --queue-num 0=20
[--queue-bypass]

All next rules are L3/L4 traditional firewall rules.

Regards,
--=20
Universit=E9 de Nantes - Direction des Syst=E8mes d'Information
IM jabber: yoann.juet@univ-nantes.fr

--------------030208010005060209010306
Content-Type: text/x-vcard; charset=utf-8;
 name="yoann_juet.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="yoann_juet.vcf"

begin:vcard
fn:Yoann Juet
n:Juet;Yoann
org;quoted-printable:Direction des Syst=3DC3=3DA8mes d'Information
adr;quoted-printable:BP 92208;;2 Rue de la Houssini=3DC3=3DA8re;Nantes Ce=
dex 3;;44322;France
email;internet:yoann.juet@univ-nantes.fr
tel;work:02.53.48.49.26
tel;fax:02.53.48.49.09
tel;cell:06.73.15.42.19
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------030208010005060209010306--

--------------ms040004030104080808030302
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
CSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTQwMjEzMTYyMDI5WjAjBgkqhkiG9w0BCQQx
FgQU6yK3KTeVoHNeDrNEdMxn2jEVGpswXwYJKwYBBAGCNxAEMVIwUDA7MQswCQYDVQQGEwJO
TDEPMA0GA1UEChMGVEVSRU5BMRswGQYDVQQDExJURVJFTkEgUGVyc29uYWwgQ0ECEQCaw9r4
AWwhPTK3X2MyL6H8MGEGCyqGSIb3DQEJEAILMVKgUDA7MQswCQYDVQQGEwJOTDEPMA0GA1UE
ChMGVEVSRU5BMRswGQYDVQQDExJURVJFTkEgUGVyc29uYWwgQ0ECEQCaw9r4AWwhPTK3X2My
L6H8MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcN
AwICASgwDQYJKoZIhvcNAQEBBQAEggEAUZEOd766/4b6E4NVgl21NtCkUSD/nuMjCXJSVvsP
OBz1EQHPRE5Hp184gMyVpJ7a5OZ/Nrg3JMwwKdEIBZW2hP9/5clUUsynGMRHbDDwnJ2Mfdcf
d2HWAhkyss17dIaclSQqp3ziPgIdAmz/ynJ2KC8TgUORMESeIq8gGw6mJEXfR/7C3ET05EMF
bJq7HfLf9kwh3JJHSN8T5KNpKELk/rFEI//u+d8sU/grBPtwirxBijM7ApweqHARnLJYNa6N
zDmFLGZuRWhQqASAe9WJh6Prk2jOeRYdbEnOdcWvfRvYYklFBfyPBFa/Xu7V4g+cA1c5whnk
JoQpRs7f6GgogAAAAAAAAA==
--------------ms040004030104080808030302--
