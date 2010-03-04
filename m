From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: How does netfilter decide which in/out-interface a packet has
Date: Thu, 04 Mar 2010 11:28:50 +0100
Message-ID: <1267698530.22478.27.camel@etppc09.garching.physik.uni-muenchen.de>
References: <20100303165422.18973x8p8ccy6s84@webmail.physik.uni-muenchen.de>
	 <4B8E97BA.9070103@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1; protocol="application/x-pkcs7-signature"; boundary="=-QucaXlcD91aQWDyG1vIe"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8E97BA.9070103@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-QucaXlcD91aQWDyG1vIe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello...


On Wed, 2010-03-03 at 18:09 +0100, Pascal Hambourg wrote:=20
> > How does netfilter decide which in/out-interface a packet has?
> It doesn't. The packet decides which input interface is arrives on, and
> the routing decision decides which output interface it leaves.
ok...


> > I mean the following:
> > Image I have a host with the following interfaces and addresses:
> > lo: 127.x.x.x and :1/128
> > eth0: 88.88.88.88
> > 99.99.99.99 is a remote address (packets come in via eth0)
> >=20
> > Now consider the following cases (source --> destination):
> > "internal traffic":
> > 127.x.x.x   --> 127.x.x.x     =3D> quite clear, in=3Dlo out=3Dlo
> > 127.x.x.x   --> 88.88.88.88   =3D> in=3D??? out=3D???
> > 88.88.88.88 --> 88.88.88.88   =3D> in=3D??? out=3D???
> > 88.88.88.88 --> 127.x.x.x     =3D> in=3D??? out=3D???
> lo in all cases.
Even though 88.88.88.88 is the address of the eth0 interface and from
what you told me just above I'd have guessed, that the (in or out)
interface is eth0 respectively...

So the kernel basically sees when packets do not leave the box but are
just "internal traffic" and uses lo for this?

I assume this also applies for byte counters like RX/TX packets and
they're accounted on lo?


> > "incoming traffic (from remote):
> > 99.99.99.99 --> 127.x.x.x     =3D> is that possible at all? how would =20
> > the in=3D/out=3D be?
> eth0, but the packet is discarded after PREROUTING by the input routing
> decision which prohibits receiving a packet with a loopback address from
> outside (a non loopback interface).
Ah great,... so I don't have to manually drop such stuff... right?

Are such packets dropped (like DROP) or are the rejected with error
codes?


> > "outgoing traffic (to remote):
> > 127.x.x.x --> 99.99.99.99     =3D> is that possible at all?
> Not possible, the output routing decision prohibits sending a packet
> with a loopback address outside the host (on a non loopback interface).
So the same as above,... this is handled automatically and I don't need
to setup specific rules to block such evil.



Well,.. great :)

Just out of curiosity,... would it be possible to tell the kernel not to
drop such bogus packets at the respective routing decision points?
Could be interesting for programs like sniffers or so...


Cheers,
Chris.

--=-QucaXlcD91aQWDyG1vIe
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKnjCCBUsw
ggQzoAMCAQICAimIMA0GCSqGSIb3DQEBBQUAMDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpHZXJt
YW5HcmlkMRIwEAYDVQQDEwlHcmlkS2EtQ0EwHhcNMTAwMjAyMTUzODQyWhcNMTEwMzA0MTUzODQy
WjBTMQswCQYDVQQGEwJERTETMBEGA1UEChMKR2VybWFuR3JpZDEMMAoGA1UECxMDTE1VMSEwHwYD
VQQDExhDaHJpc3RvcGggQW50b24gTWl0dGVyZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQDB2Qx+2tMdrECcbeWidmr8n6M307ZhmRkijL2L4fSfD0tq5dgd6/upKPl/yZszPA9uRnCa
GJBX+AA5+3GXG9sL/zE88t7c1LdD1rJcO23OO3Z35bWj3zMzhiXFq+rlgqLTixeS4YjEJ45J58BQ
nvdZW9enAwtF+loQguehemyOv7GTpsbTBzwBcrM2YOdX1DdFBdspvjv/zGbgA8qcVNqKPZ/j1Om0
nLwDK/q+5yUO4v1m50Y6ApgmGuH9+xCBwKiBhjwR575utKfIBoAYAAZ4GAO0RWB6tsXrLV6OTSj0
Cvx97+6FbI7btHtLDz62r3KJKHt3YVhLufPPurr6moKfAgMBAAGjggJEMIICQDAMBgNVHRMBAf8E
AjAAMA4GA1UdDwEB/wQEAwIE8DAdBgNVHQ4EFgQU6mpOncVXSCbY9n7zHlYWcvVMAGcwXgYDVR0j
BFcwVYAUxnXJKKzRC/w8/7m1HtNfO4BiEjShOqQ4MDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpH
ZXJtYW5HcmlkMRIwEAYDVQQDEwlHcmlkS2EtQ0GCAQAwOgYDVR0RBDMwMYEvY2hyaXN0b3BoLmFu
dG9uLm1pdHRlcmVyQHBoeXNpay51bmktbXVlbmNoZW4uZGUwHwYDVR0SBBgwFoEUZ3JpZGthLWNh
QGl3ci5memsuZGUwNQYDVR0fBC4wLDAqoCigJoYkaHR0cDovL2dyaWQuZnprLmRlL2NhL2dyaWRr
YS1jcmwuZGVyMBoGA1UdIAQTMBEwDwYNKwYBBAGUNqssAQEBBTARBglghkgBhvhCAQEEBAMCBaAw
TgYJYIZIAYb4QgENBEEWP0NlcnRpZmljYXRlIGlzc3VlZCB1bmRlciBDUC9DUFMgdi4gMS41IGF0
IGh0dHA6Ly9ncmlkLmZ6ay5kZS9jYTAkBglghkgBhvhCAQIEFxYVaHR0cDovL2dyaWQuZnprLmRl
L2NhMDMGCWCGSAGG+EIBCAQmFiRodHRwOi8vZ3JpZC5memsuZGUvY2EvZ3JpZGthLWNwcy5wZGYw
MwYJYIZIAYb4QgEDBCYWJGh0dHA6Ly9ncmlkLmZ6ay5kZS9jYS9ncmlka2EtY3JsLmRlcjANBgkq
hkiG9w0BAQUFAAOCAQEAx4bax1WiHpkiGAtCHawUp7+4CJfRDnrRv5B477+h8ILTY0mzHNumC5Ru
+RpnfUi4zcbFA8uEnKifTRFeZH6kflC+xhLfg2kiN00Qqy0+IvYcTYo/ZGUhKLV3Q22R8tKpTjuY
o4svWK0PQoSgcrVccGp7ZzHknKAS3dZjQTSg5JXfeLKrh0JZVRQ2S3CaOGBzTb8hXPSP1iAJ3klw
hAApYZux9NQmBlEW7DeK5DwKiny+dbuipMrXwASz4tgnI/s9wwEml8tGXjnQDbyz4uRMa2Xyrzg4
iq+vWHLUsRGC1Api5FsBfBVTQPqRE1isyk8rPYcBoDk7dirgswhHwcK97TCCBUswggQzoAMCAQIC
AimIMA0GCSqGSIb3DQEBBQUAMDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpHZXJtYW5HcmlkMRIw
EAYDVQQDEwlHcmlkS2EtQ0EwHhcNMTAwMjAyMTUzODQyWhcNMTEwMzA0MTUzODQyWjBTMQswCQYD
VQQGEwJERTETMBEGA1UEChMKR2VybWFuR3JpZDEMMAoGA1UECxMDTE1VMSEwHwYDVQQDExhDaHJp
c3RvcGggQW50b24gTWl0dGVyZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDB2Qx+
2tMdrECcbeWidmr8n6M307ZhmRkijL2L4fSfD0tq5dgd6/upKPl/yZszPA9uRnCaGJBX+AA5+3GX
G9sL/zE88t7c1LdD1rJcO23OO3Z35bWj3zMzhiXFq+rlgqLTixeS4YjEJ45J58BQnvdZW9enAwtF
+loQguehemyOv7GTpsbTBzwBcrM2YOdX1DdFBdspvjv/zGbgA8qcVNqKPZ/j1Om0nLwDK/q+5yUO
4v1m50Y6ApgmGuH9+xCBwKiBhjwR575utKfIBoAYAAZ4GAO0RWB6tsXrLV6OTSj0Cvx97+6FbI7b
tHtLDz62r3KJKHt3YVhLufPPurr6moKfAgMBAAGjggJEMIICQDAMBgNVHRMBAf8EAjAAMA4GA1Ud
DwEB/wQEAwIE8DAdBgNVHQ4EFgQU6mpOncVXSCbY9n7zHlYWcvVMAGcwXgYDVR0jBFcwVYAUxnXJ
KKzRC/w8/7m1HtNfO4BiEjShOqQ4MDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpHZXJtYW5Hcmlk
MRIwEAYDVQQDEwlHcmlkS2EtQ0GCAQAwOgYDVR0RBDMwMYEvY2hyaXN0b3BoLmFudG9uLm1pdHRl
cmVyQHBoeXNpay51bmktbXVlbmNoZW4uZGUwHwYDVR0SBBgwFoEUZ3JpZGthLWNhQGl3ci5memsu
ZGUwNQYDVR0fBC4wLDAqoCigJoYkaHR0cDovL2dyaWQuZnprLmRlL2NhL2dyaWRrYS1jcmwuZGVy
MBoGA1UdIAQTMBEwDwYNKwYBBAGUNqssAQEBBTARBglghkgBhvhCAQEEBAMCBaAwTgYJYIZIAYb4
QgENBEEWP0NlcnRpZmljYXRlIGlzc3VlZCB1bmRlciBDUC9DUFMgdi4gMS41IGF0IGh0dHA6Ly9n
cmlkLmZ6ay5kZS9jYTAkBglghkgBhvhCAQIEFxYVaHR0cDovL2dyaWQuZnprLmRlL2NhMDMGCWCG
SAGG+EIBCAQmFiRodHRwOi8vZ3JpZC5memsuZGUvY2EvZ3JpZGthLWNwcy5wZGYwMwYJYIZIAYb4
QgEDBCYWJGh0dHA6Ly9ncmlkLmZ6ay5kZS9jYS9ncmlka2EtY3JsLmRlcjANBgkqhkiG9w0BAQUF
AAOCAQEAx4bax1WiHpkiGAtCHawUp7+4CJfRDnrRv5B477+h8ILTY0mzHNumC5Ru+RpnfUi4zcbF
A8uEnKifTRFeZH6kflC+xhLfg2kiN00Qqy0+IvYcTYo/ZGUhKLV3Q22R8tKpTjuYo4svWK0PQoSg
crVccGp7ZzHknKAS3dZjQTSg5JXfeLKrh0JZVRQ2S3CaOGBzTb8hXPSP1iAJ3klwhAApYZux9NQm
BlEW7DeK5DwKiny+dbuipMrXwASz4tgnI/s9wwEml8tGXjnQDbyz4uRMa2Xyrzg4iq+vWHLUsRGC
1Api5FsBfBVTQPqRE1isyk8rPYcBoDk7dirgswhHwcK97TGCAl8wggJbAgEBMDwwNjELMAkGA1UE
BhMCREUxEzARBgNVBAoTCkdlcm1hbkdyaWQxEjAQBgNVBAMTCUdyaWRLYS1DQQICKYgwCQYFKw4D
AhoFAKCB+TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xMDAzMDQx
MDI4NTBaMCMGCSqGSIb3DQEJBDEWBBQoqn3Fmv9fbKn982qtLwGmPmaWZDBLBgkrBgEEAYI3EAQx
PjA8MDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpHZXJtYW5HcmlkMRIwEAYDVQQDEwlHcmlkS2Et
Q0ECAimIME0GCyqGSIb3DQEJEAILMT6gPDA2MQswCQYDVQQGEwJERTETMBEGA1UEChMKR2VybWFu
R3JpZDESMBAGA1UEAxMJR3JpZEthLUNBAgIpiDANBgkqhkiG9w0BAQEFAASCAQA5cZx/HdmkcOq6
XM8pwsV6COPt6BLF+fONJFYHa5PeTvlRTG60jLj/VKxTiGtR+8LJjExAStuS4baMB9gfZNXbE1wv
eFdN/bnWCEgbVCbZgKYY1ykq54WxgrNmDyZPaeR+WQPcdrsso6bwlK+xbJ71i4U7icX6SR0DVhbE
0h+0P3QExC+lP/BG05QnfQ/uG6pCO77NotviFdsazdzxyiQNbaFV06YZaMWTo6oBTFK+fnAXHYYf
ElmSevosXQ1Su40S/JEYgZLUm6KTIxOjDgqUX0O0zMkw0YaIvdqZkJNhcWo91/ajeWd3zZOgRrnv
/YoX4Gc5+79VpIv17s4y+WE5AAAAAAAA


--=-QucaXlcD91aQWDyG1vIe--

