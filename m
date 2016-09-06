From: "Walter H." <Walter.H@mathemainzel.info>
Subject: Re: Rule for PROTO=139?
Date: Tue, 06 Sep 2016 19:41:51 +0200
Message-ID: <57CEFFDF.1070303@mathemainzel.info>
References: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>    <3e24e1f4a88741f0979847f78ef0ecc1@CCDEX021.corp.corpcommon.com> <36ec0fca76fb7517d5d82dc5f09fb3ae.1473163407@squirrel.mail> <d563e5c593e3405c8eca5c001b4b25e1@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms060909020802080805010909"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=EyzUWRRPLO+lECdPZw0yKlXf4U5c348lba+LQjtX2IU=;
        b=iDbWI2aJSnBrKO2Lp2aCZOlBrgsq7y62ixD9RgCtXOjjAddQMHyJnQpDCQE77FWy3E8dqIZ/HiWUMIgaV32/+8Dk2QwIjdUuRHGo0wtRdZvlYTZfwsI9NbXtBKDv5lDf07pn9gwAf0HFQXGD04LR0ZujxYw4QibgMU0Tq/jXc+o=;
In-Reply-To: <d563e5c593e3405c8eca5c001b4b25e1@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?UTF-8?B?IkFuZHLDqSBQYXVsc2JlcmctQ3NpYmkgKElCTSBDb25zdWx0YW50KSI=?= <Andre.Paulsberg-Csibi@evry.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a cryptographically signed message in MIME format.

--------------ms060909020802080805010909
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.09.2016 14:18, Andr=C3=A9 Paulsberg-Csibi (IBM Consultant) wrote:
> It is long time since I used WinXP , and Win7 - Win8 has passed and now=
 WinX is the only thing
> and most of their "garbage" packages was removed using the parameter in=
 DHCP :
> option netbios-node-type 0x2;
> option wpad code 252 =3D text;
> option wpad "\n\000";
>
> ( I cannot stop all their garbage , because they need it for their "sha=
ring" tools )
> But DHCP INFORM and HIP and other excessive BC I have not seen in my ho=
me for quite some time so I am pretty sure most is gone ...
>
> IF that does not stop it - try to google it , if it is not possible you=
 may just have to live with blocking it ...
>
>
ok due to this at the beginning of iptables

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]


and this  at the end of iptables

-A INPUT -j LOG --log-prefix "IP[IN]: " --log-level 7
-A FORWARD -j LOG  --log-prefix "IP[FWD]: " --log-level 7
-A OUTPUT -j LOG  --log-prefix "IP[OUT]: " --log-level 7

COMMIT

these pakets are already dropped but they are also logged and fill the=20
log not neccessarily;

so somewhere between this rule

# Block HIP (Host Identity Protocol): prevent from logging
-A INPUT -i br0 -p hip -j REJECT

keeps from logging

Thanks,
Walter




--------------ms060909020802080805010909
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIK+TCC
BQ8wggP3oAMCAQICEBXryTDf12BZsBQGOUivCvYwDQYJKoZIhvcNAQELBQAwdTELMAkGA1UE
BhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKTAnBgNVBAsTIFN0YXJ0Q29tIENlcnRp
ZmljYXRpb24gQXV0aG9yaXR5MSMwIQYDVQQDExpTdGFydENvbSBDbGFzcyAxIENsaWVudCBD
QTAeFw0xNjA2MjAxOTQxMDRaFw0xOTA5MjAxOTQxMDRaMFAxIzAhBgNVBAMMGndhbHRlci5o
QG1hdGhlbWFpbnplbC5pbmZvMSkwJwYJKoZIhvcNAQkBFhp3YWx0ZXIuaEBtYXRoZW1haW56
ZWwuaW5mbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMaHJGVEsn1u+HtE+pKg
6GemsHDYatLr4hQORdOZGwYnOSqPqcZcRX5iDu7XvsSz5dUfAi1xYA8dG8NOkvO074ir4qXv
l/APA8J8hidpyoKsZz83Siz61yuxGFL0MMG36ZIJc3O1dSgVTWa2EV5A0W6a1Y73aofliZhk
s+aW0RXfa3LMEf8p3xOISoypNRTja1yoZbsN2a0/kJROyyxBvtA7xUpyZnZwukhjY7+o6sTE
nl6jR57PoNYJAZ1WUYotgfBXclvBaaQYJYN+v7hFEOoDe4SNFtv3cEw2JGovs66opMxxQNe3
2jfwza15UCBy5ImcVkzzwd//UU/ttXiCIP8CAwEAAaOCAb4wggG6MA4GA1UdDwEB/wQEAwIE
sDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwCQYDVR0TBAIwADAdBgNVHQ4EFgQU
TJ0JCQN543gbIOXxNuNB31XEKRwwHwYDVR0jBBgwFoAUJIFsOWG+SQ+PtxtGK8kotSdIbWgw
bwYIKwYBBQUHAQEEYzBhMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5zdGFydHNzbC5jb20w
OQYIKwYBBQUHMAKGLWh0dHA6Ly9haWEuc3RhcnRzc2wuY29tL2NlcnRzL3NjYS5jbGllbnQx
LmNydDA4BgNVHR8EMTAvMC2gK6AphidodHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9zY2EtY2xp
ZW50MS5jcmwwJQYDVR0RBB4wHIEad2FsdGVyLmhAbWF0aGVtYWluemVsLmluZm8wIwYDVR0S
BBwwGoYYaHR0cDovL3d3dy5zdGFydHNzbC5jb20vMEcGA1UdIARAMD4wPAYLKwYBBAGBtTcB
AgUwLTArBggrBgEFBQcCARYfaHR0cHM6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeTANBgkq
hkiG9w0BAQsFAAOCAQEAlOZiPlJ0w/LPHF3krJCkr+wTeW/9Zx1/tiEJhQ1oA6+Gp6JAG4Vm
hD0z5PLH7lef9X5i5buRxZpaHu7/SZSGsY4Xk7Ou81Sthzj1RzV9gbHLEz/bcvhfz4i/OUvA
3lm9dVP+vxduRFu7fmHz+HGgdehqTqT7gZx+5unCUWnUrOo6E+BNK4Vjp5sqyJmhxrmj4po4
dNJAUqTkzIB/YqC6Cne8XFr3aZJVu97ErZp0fm/RKqRikCS4RlT6XxTU+9656EA3j2+iNZ8e
RZ9YvdqRmYLvQcJ3PmGauAehOOc//O+cgfxy7SGAUKBAQEfBRWjCe+LaydG1ZBUSWxbwLk1F
pzCCBeIwggPKoAMCAQICEGunin0K14jWUQr5WeTntOEwDQYJKoZIhvcNAQELBQAwfTELMAkG
A1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdp
dGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAnBgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTE1MTIxNjAxMDAwNVoXDTMwMTIxNjAxMDAwNVowdTELMAkGA1UE
BhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKTAnBgNVBAsTIFN0YXJ0Q29tIENlcnRp
ZmljYXRpb24gQXV0aG9yaXR5MSMwIQYDVQQDExpTdGFydENvbSBDbGFzcyAxIENsaWVudCBD
QTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL192vfDon2D9luC/dtbX64eG3XA
tRmvmCSsu1d52DXsCR58zJQbCtB2/A5uFqNxWacpXGGtTCRk9dEDBlmixEd8QiLkUfvHpJX/
xKnmVkS6Iye8wUbYzMsDzgnpazlPg19dnSqfhM+Cevdfa89VLnUztRr2cgmCfyO9Otrh7LJD
PG+4D8ZnAqDtVB8MKYJL6QgKyVhhaBc4y3bGWxKyXEtx7QIZZGxPwSkzK3WIN+VKNdkiwTub
W5PIdopmykwvIjLPqbJK7yPwFZYekKE015OsW6FV+s4DIM8UlVS8pkIsoGGJtMuWjLL4tq2h
YQuuN0jhrxK1ljz50hH23gA9cbMCAwEAAaOCAWQwggFgMA4GA1UdDwEB/wQEAwIBBjAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwEgYDVR0TAQH/BAgwBgEB/wIBADAyBgNVHR8E
KzApMCegJaAjhiFodHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9zZnNjYS5jcmwwZgYIKwYBBQUH
AQEEWjBYMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5zdGFydHNzbC5jb20wMAYIKwYBBQUH
MAKGJGh0dHA6Ly9haWEuc3RhcnRzc2wuY29tL2NlcnRzL2NhLmNydDAdBgNVHQ4EFgQUJIFs
OWG+SQ+PtxtGK8kotSdIbWgwHwYDVR0jBBgwFoAUTgvvGqRAW6UXaYcwyjRoQ9BBrvIwPwYD
VR0gBDgwNjA0BgRVHSAAMCwwKgYIKwYBBQUHAgEWHmh0dHA6Ly93d3cuc3RhcnRzc2wuY29t
L3BvbGljeTANBgkqhkiG9w0BAQsFAAOCAgEAi+P3h+wBi4StDwECW5zhIycjBL008HACblIf
26HY0JdOruKbrWDsXUsiI0j/7Crft9S5oxvPiDtVqspBOB/y5uzSns1lZwh7sG96bYBZpcGz
GxpFNjDmQbcM3yl3WFIRS4WhNrsOY14V7y2IrUGsvetsD+bjyOngCIVeC/GmsmtbuLOzJ606
tEc9uRbhjTu/b0x2Fo+/e7UkQvKzNeo7OMhijixaULyINBfCBJb+e29bLafgu6JqjOUJ9eXX
j20p6q/CW+uVrZiSW57+q5an2P2i7hP85jQJcy5j4HzA0rSiF3YPhKGAWUxKPMAVGgcYoXzW
ydOvZ3UDsTDTagXpRDIKQLZo02wrlxY6iMFqvlzsemVf1odhQJmi7Eh5TbxI40kDGcBOBHhw
naOumZhLP+SWJQnjpLpSlUOj95uf1zo9oz9e0NgIJoz/tdfrBzez76xtDsK0KfUDHt1/q59B
vDI7RX6gVr0fQoCyMczNzCTcRXYHY0tq2J0oT+bsb6sH2b4WVWAiJKnSYaWDjdA70qHX4mq9
MIjO/ZskmSY8wtAk24orAc0vwXgYanqNsBX5Yv4sN4Z9VyrwMdLcusP7HJgRdAGKpkR2I9U4
zEsNJQJewM7S4Jalo1DyPrLpL2nTET8ZrSl5Utp1UeGp/2deoprGevfnxWB+vHNQiu85o6Mx
ggO8MIIDuAIBATCBiTB1MQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjEp
MCcGA1UECxMgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxIzAhBgNVBAMTGlN0
YXJ0Q29tIENsYXNzIDEgQ2xpZW50IENBAhAV68kw39dgWbAUBjlIrwr2MAkGBSsOAwIaBQCg
ggIHMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE2MDkwNjE3
NDE1MVowIwYJKoZIhvcNAQkEMRYEFPRXI06IW9UHPVPHYRBQ79GCQfykMGwGCSqGSIb3DQEJ
DzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0D
AgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgZoGCSsGAQQB
gjcQBDGBjDCBiTB1MQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjEpMCcG
A1UECxMgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxIzAhBgNVBAMTGlN0YXJ0
Q29tIENsYXNzIDEgQ2xpZW50IENBAhAV68kw39dgWbAUBjlIrwr2MIGcBgsqhkiG9w0BCRAC
CzGBjKCBiTB1MQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjEpMCcGA1UE
CxMgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxIzAhBgNVBAMTGlN0YXJ0Q29t
IENsYXNzIDEgQ2xpZW50IENBAhAV68kw39dgWbAUBjlIrwr2MA0GCSqGSIb3DQEBAQUABIIB
AHOZPij9ZZ5tDZlPUx+2PqHysYhdEC5PXzJwCvvlXHUFjFjzR2FG+lPyvXLhHJPqPP3e+1/L
oKDNpNf6gvp9420Pbf4gecgAWgFgjp9+L56euTgNoca/F4pmFW7RXi2ntTkVhXnLQJbdnpKP
cvSYtMpiLnFDQKPo3LvZ9tsYlsVJl4qEtela/tENESr1yR7rlrF6IUUCO+X7vkvrPwuY1UTe
JY1vdpiriMtOht3n/ckI0QUQR3X8/CMkzRke6K8o9qdDz4F74savUomPIEUSvRP70vXtpTYz
7y27g3cHIBR/6P0/CYGRKanWQTztq3585VYznXFm2/BVX0PpYAloo1YAAAAAAAA=
--------------ms060909020802080805010909--
