From: James MacLean <macleajb@ednet.ns.ca>
Subject: Re: Private traffic seen on public NATed interface - Linux	2.6.10-11
 tested
Date: Wed, 16 Mar 2005 12:52:48 -0400
Message-ID: <42386460.1010707@ednet.ns.ca>
References: <423737E2.4050201@ednet.ns.ca>	<42374547.7030204@fastwebnet.it><42374B1B.4090901@ednet.ns.ca>	<4237EC2D.4050807@fastwebnet.it>
	<42382B40.1060108@ednet.ns.ca>
	<006a01c52a35$821191f0$4206a8c0@loki>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070406060708060006040804"
In-Reply-To: <006a01c52a35$821191f0$4206a8c0@loki>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Marius Mertens <marius.mertens@gmx.de>
Cc: NetFilter <netfilter@lists.netfilter.org>

This is a cryptographically signed message in MIME format.

--------------ms070406060708060006040804
Content-Type: multipart/mixed; boundary="------------070005050302060700070800"

This is a multi-part message in MIME format.
--------------070005050302060700070800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marius Mertens wrote:

> On Wednesday, March 16, 2005 1:49 PM,
> James MacLean wrote:
>
>> [...]
>> May I suggest someone else even try it at home :), or on a half busy
>> box? We _are_ honestly seeing this at different sites with different
>> rules, but with the common SNAT for private IP space.
>> [...]
>
>
> Sorry I cannot provide anything to solve your problem, but maybe you 
> want to check the following:
> I also had (and already have, I just ignore it at the moment) a quite 
> similar problem: Some packets that should have been modified by NAT 
> were not processed, but in the direction "Internet --> NATted Clients" 
> (exactly the opposite direction that makes problems on your setup) so 
> that missed packets hit the INPUT rules of my router.
> If you want to have more detailed information please see 
> http://lists.netfilter.org/pipermail/netfilter/2005-January/057795.html
> Now to the property you might want to check: All packets being not 
> correctly processed by NAT had the state INVALID. I am not sure 
> when/why the connection became INVALID, but since there has been 
> traffic in both directions before, it it unlikely that it was INVALID 
> in the first place.
> Perhaps your not processed packets are also considered INVALID?
> This is of course far away from a solution (since it is still unclear, 
> why they become INVALID), but if we can find further criteria that 
> applies to all these similar problems, maybe we are able to track it 
> down.
>
> Marius
>
Bingo. And thanks :). Yes, this is looking very similar to our 
situation. A small dump and the matching INVALID rule logging :

12:24:59.083117 IP 10.0.5.221.1672 > 64.202.98.35.http: F 
1992443149:1992443149(0) ack 2731371818 win 63513

Mar 16 12:24:5 the kernel: INVALID IN=eth1 OUT=eth0 SRC=10.0.5.221 
DST=64.202.98.35 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=15881 DF PROTO=TCP 
SPT=1672 DPT=80 WINDOW=63513 RES=0x00 ACK FIN URGP=0

Watching the logs on busy sites we see many of these :).

So now we know what it is, and we can simply apply INVALID rules if we 
need to. I wonder how long this has been going on :(.

thanks again,
JES


--------------070005050302060700070800--

--------------ms070406060708060006040804
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKtDCC
BVYwggQ+oAMCAQICAWAwDQYJKoZIhvcNAQEEBQAwgZ4xITAfBgkqhkiG9w0BCQEWEmNhY2Vy
dEBlZG5ldC5ucy5jYTEeMBwGA1UEAxMVQ2VydGlmaWNhdGUgQXV0aG9yaXR5MQwwCgYDVQQL
EwNJVFMxLDAqBgNVBAoTI05vdmEgU2NvdGlhIERlcGFydG1lbnQgb2YgRWR1Y2F0aW9uMQsw
CQYDVQQGEwJDQTEQMA4GA1UEBxMHSGFsaWZheDAeFw0wNDA1MTcxNzQxNThaFw0wNTA1MTcx
NzQxNThaMIGJMQswCQYDVQQGEwJDQTEsMCoGA1UEChMjTm92YSBTY290aWEgRGVwYXJ0bWVu
dCBvZiBFZHVjYXRpb24xDDAKBgNVBAsTA0lUUzEZMBcGA1UEAxMQSmFtZXMgQi4gTWFjTGVh
bjEjMCEGCSqGSIb3DQEJARYUbWFjbGVhamJAZWRuZXQubnMuY2EwgZ8wDQYJKoZIhvcNAQEB
BQADgY0AMIGJAoGBAJ48YPIFGWG5WDLVvpCCchFe4/hnwMNCm413AKLkzSj0MntJzP6qFkt+
0ZwxKlbv+mKFp87dEb05PJcs5wMrlGQ8cbRjFzH2Sk4XoowpjRkvVlb1eCY28feTLstJKJ7m
EBXgReMhMH2SzQENHi+8zSTBfXOKH0tN7lFRJVfz0Jx9AgMBAAGjggI0MIICMDAJBgNVHRME
AjAAMBEGCWCGSAGG+EIBAQQEAwIFoDALBgNVHQ8EBAMCBeAwQwYJYIZIAYb4QgENBDYWNE5v
dmEgU2NvdGlhIERlcGFydG1lbnQgb2YgRWR1Y2F0aW9uIFVzZXIgQ2VydGlmaWNhdGUwHQYD
VR0OBBYEFKnIpPsWtaeSZUgTtQhdGclcQK2eMIHLBgNVHSMEgcMwgcCAFFJrFDIZpPal+WoN
hK6MxZUyDajcoYGkpIGhMIGeMSEwHwYJKoZIhvcNAQkBFhJjYWNlcnRAZWRuZXQubnMuY2Ex
HjAcBgNVBAMTFUNlcnRpZmljYXRlIEF1dGhvcml0eTEMMAoGA1UECxMDSVRTMSwwKgYDVQQK
EyNOb3ZhIFNjb3RpYSBEZXBhcnRtZW50IG9mIEVkdWNhdGlvbjELMAkGA1UEBhMCQ0ExEDAO
BgNVBAcTB0hhbGlmYXiCAQAwHwYDVR0RBBgwFoEUbWFjbGVhamJAZWRuZXQubnMuY2EwCQYD
VR0SBAIwADA4BglghkgBhvhCAQQEKxYpaHR0cHM6Ly9zZWN1cmUuZWRuZXQubnMuY2EvY2dp
LWJpbi9nZXRjcmwwOAYJYIZIAYb4QgEDBCsWKWh0dHBzOi8vc2VjdXJlLmVkbmV0Lm5zLmNh
L2NnaS1iaW4vZ2V0Y3JsMDEGCWCGSAGG+EIBBwQkFiJodHRwczovL3NlY3VyZS5lZG5ldC5u
cy5jYS9yZW5ld2FsMA0GCSqGSIb3DQEBBAUAA4IBAQCUb2tuMuhbC0T78oZLpjKd3OcaePSN
j1Z5L1qdSOKflW4IomUREG483FxXP8F1ZofMiOa4XkfKN4PkdNO1sPnlZtKxwM1EdiRulpkG
o2Da6EwVflgiP4hGDYdlCki+nKvs+8qY/L7xHUdxts2Kkmg10wa4IeZXetqp60h5exjkKkL2
Ag5/jFf8A13NheYD926vvY1wkTaLBu/3+1F7pAqNBjIDVEPCQpVUMx6cwwGq6rPo3hYSx/Oz
mf+s8t9+zRoYG2blRPbAW6OAPRBAaldBTzPGWUI0frQrp55K/DvQc9hEScMF0yEIrZ8cov7q
pfW57MJSQo0jeemB+Nb3HRmmMIIFVjCCBD6gAwIBAgIBYDANBgkqhkiG9w0BAQQFADCBnjEh
MB8GCSqGSIb3DQEJARYSY2FjZXJ0QGVkbmV0Lm5zLmNhMR4wHAYDVQQDExVDZXJ0aWZpY2F0
ZSBBdXRob3JpdHkxDDAKBgNVBAsTA0lUUzEsMCoGA1UEChMjTm92YSBTY290aWEgRGVwYXJ0
bWVudCBvZiBFZHVjYXRpb24xCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdIYWxpZmF4MB4XDTA0
MDUxNzE3NDE1OFoXDTA1MDUxNzE3NDE1OFowgYkxCzAJBgNVBAYTAkNBMSwwKgYDVQQKEyNO
b3ZhIFNjb3RpYSBEZXBhcnRtZW50IG9mIEVkdWNhdGlvbjEMMAoGA1UECxMDSVRTMRkwFwYD
VQQDExBKYW1lcyBCLiBNYWNMZWFuMSMwIQYJKoZIhvcNAQkBFhRtYWNsZWFqYkBlZG5ldC5u
cy5jYTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAnjxg8gUZYblYMtW+kIJyEV7j+GfA
w0KbjXcAouTNKPQye0nM/qoWS37RnDEqVu/6YoWnzt0RvTk8lyznAyuUZDxxtGMXMfZKThei
jCmNGS9WVvV4Jjbx95Muy0konuYQFeBF4yEwfZLNAQ0eL7zNJMF9c4ofS03uUVElV/PQnH0C
AwEAAaOCAjQwggIwMAkGA1UdEwQCMAAwEQYJYIZIAYb4QgEBBAQDAgWgMAsGA1UdDwQEAwIF
4DBDBglghkgBhvhCAQ0ENhY0Tm92YSBTY290aWEgRGVwYXJ0bWVudCBvZiBFZHVjYXRpb24g
VXNlciBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQUqcik+xa1p5JlSBO1CF0ZyVxArZ4wgcsGA1Ud
IwSBwzCBwIAUUmsUMhmk9qX5ag2ErozFlTINqNyhgaSkgaEwgZ4xITAfBgkqhkiG9w0BCQEW
EmNhY2VydEBlZG5ldC5ucy5jYTEeMBwGA1UEAxMVQ2VydGlmaWNhdGUgQXV0aG9yaXR5MQww
CgYDVQQLEwNJVFMxLDAqBgNVBAoTI05vdmEgU2NvdGlhIERlcGFydG1lbnQgb2YgRWR1Y2F0
aW9uMQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHSGFsaWZheIIBADAfBgNVHREEGDAWgRRtYWNs
ZWFqYkBlZG5ldC5ucy5jYTAJBgNVHRIEAjAAMDgGCWCGSAGG+EIBBAQrFilodHRwczovL3Nl
Y3VyZS5lZG5ldC5ucy5jYS9jZ2ktYmluL2dldGNybDA4BglghkgBhvhCAQMEKxYpaHR0cHM6
Ly9zZWN1cmUuZWRuZXQubnMuY2EvY2dpLWJpbi9nZXRjcmwwMQYJYIZIAYb4QgEHBCQWImh0
dHBzOi8vc2VjdXJlLmVkbmV0Lm5zLmNhL3JlbmV3YWwwDQYJKoZIhvcNAQEEBQADggEBAJRv
a24y6FsLRPvyhkumMp3c5xp49I2PVnkvWp1I4p+VbgiiZREQbjzcXFc/wXVmh8yI5rheR8o3
g+R007Ww+eVm0rHAzUR2JG6WmQajYNroTBV+WCI/iEYNh2UKSL6cq+z7ypj8vvEdR3G2zYqS
aDXTBrgh5ld62qnrSHl7GOQqQvYCDn+MV/wDXc2F5gP3bq+9jXCRNosG7/f7UXukCo0GMgNU
Q8JClVQzHpzDAarqs+jeFhLH87OZ/6zy337NGhgbZuVE9sBbo4A9EEBqV0FPM8ZZQjR+tCun
nkr8O9Bz2ERJwwXTIQitnxyi/uql9bnswlJCjSN56YH41vcdGaYxggNyMIIDbgIBATCBpDCB
njEhMB8GCSqGSIb3DQEJARYSY2FjZXJ0QGVkbmV0Lm5zLmNhMR4wHAYDVQQDExVDZXJ0aWZp
Y2F0ZSBBdXRob3JpdHkxDDAKBgNVBAsTA0lUUzEsMCoGA1UEChMjTm92YSBTY290aWEgRGVw
YXJ0bWVudCBvZiBFZHVjYXRpb24xCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdIYWxpZmF4AgFg
MAkGBSsOAwIaBQCgggIjMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTA1MDMxNjE2NTI0OFowIwYJKoZIhvcNAQkEMRYEFB19K4tb331viWJfsXr3RvubB6Jc
MFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3
DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIG1BgkrBgEEAYI3EAQxgacwgaQwgZ4x
ITAfBgkqhkiG9w0BCQEWEmNhY2VydEBlZG5ldC5ucy5jYTEeMBwGA1UEAxMVQ2VydGlmaWNh
dGUgQXV0aG9yaXR5MQwwCgYDVQQLEwNJVFMxLDAqBgNVBAoTI05vdmEgU2NvdGlhIERlcGFy
dG1lbnQgb2YgRWR1Y2F0aW9uMQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHSGFsaWZheAIBYDCB
twYLKoZIhvcNAQkQAgsxgaeggaQwgZ4xITAfBgkqhkiG9w0BCQEWEmNhY2VydEBlZG5ldC5u
cy5jYTEeMBwGA1UEAxMVQ2VydGlmaWNhdGUgQXV0aG9yaXR5MQwwCgYDVQQLEwNJVFMxLDAq
BgNVBAoTI05vdmEgU2NvdGlhIERlcGFydG1lbnQgb2YgRWR1Y2F0aW9uMQswCQYDVQQGEwJD
QTEQMA4GA1UEBxMHSGFsaWZheAIBYDANBgkqhkiG9w0BAQEFAASBgH3hQvfSTfGNZNl42e1w
3FFTUFPaHdr/gQVw0U9U329f8aAiQBSDnOJZBcc0938rmPrM/zAwYujcuHY7jJS8iClBJtil
E1sRKv6emNVYKzkdFvH8Nt+H4e2U0CCoK7rz/Xup+iM93lq+GO3LtzTjmDjZNfIhBDx9jK+t
2joj6Z7aAAAAAAAA
--------------ms070406060708060006040804--

