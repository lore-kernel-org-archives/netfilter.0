From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: How does netfilter decide which in/out-interface a packet has
Date: Sun, 07 Mar 2010 04:14:26 +0100
Message-ID: <1267931666.9967.6.camel@fermat.scientia.net>
References: <20100303165422.18973x8p8ccy6s84@webmail.physik.uni-muenchen.de>
	 <4B8E97BA.9070103@plouf.fr.eu.org>
	 <1267698530.22478.27.camel@etppc09.garching.physik.uni-muenchen.de>
	 <4B903B4F.2030708@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="sha1"; protocol="application/x-pkcs7-signature"; boundary="=-yk3j02dLPLBnpzRj05Ej"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B903B4F.2030708@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-yk3j02dLPLBnpzRj05Ej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok... I think I'm confused now ^^


Before you've said:
>> How does netfilter decide which in/out-interface a packet has?
>It doesn't. The packet decides which input interface is arrives on, and
>the routing decision decides which output interface it leaves.

So what exactly does it mean?
a) If the packet physically arrives on e.g. eth0 ("by wire") it's
interface is counted as eth0, regardless of what its destination-address
says?

b) If it appears on any interface (e.g. eth0 or eth1) its interface is
counted as that one that matches the destination address on the
packet,... even if it appears physically on eth0 but if it still hast
the destination address of eth1


On Thu, 2010-03-04 at 23:59 +0100, Pascal Hambourg wrote:
> Christoph Anton Mitterer a =C3=A9crit :
> > So the kernel basically sees when packets do not leave the box but are
> > just "internal traffic" and uses lo for this?
> > I assume this also applies for byte counters like RX/TX packets and
> > they're accounted on lo?
> Yes and yes.
Do you perhaps know where I can see this in the code?
And is this also the case for v6?


> >>> "incoming traffic (from remote):
> >>> 99.99.99.99 --> 127.x.x.x     =3D> is that possible at all? how would=
 =20
> >>> the in=3D/out=3D be?
> >> eth0, but the packet is discarded after PREROUTING by the input routin=
g
> >> decision which prohibits receiving a packet with a loopback address fr=
om
> >> outside (a non loopback interface).
> > Ah great,... so I don't have to manually drop such stuff... right?
> > Are such packets dropped (like DROP) or are the rejected with error
> > codes?
> They are silently discarded, like DROP. Some of these packets are logged
> when sysctl net.ipv4.conf.*.log_martians is enabled. Otherwise you can
> log (and drop) them with iptables.
a) Uhmm... wait... you say "otherwise" does this mean if log_martians is
disabled they are neither logged NOR discarded?
b) What is all regarded as "martians" here,.. there are different
definitions on the web...


> Note that I observed once that the kernel allowed sending IPv6 packets
> outside the host with the source address ::1 (IPv6 loopback address),
> which should be prohibited. I didn't test all "impossible" addresses but
> there may be other cases. So it may be worth filtering with ip(6)tables
> anyway.
argl...


Thanks,
Chris.


--=-yk3j02dLPLBnpzRj05Ej
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
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
AhoFAKCB+TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xMDAzMDcw
MzE0MjNaMCMGCSqGSIb3DQEJBDEWBBTr4boai7kjDnzJHbSTz4cwQy/xTzBLBgkrBgEEAYI3EAQx
PjA8MDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpHZXJtYW5HcmlkMRIwEAYDVQQDEwlHcmlkS2Et
Q0ECAimIME0GCyqGSIb3DQEJEAILMT6gPDA2MQswCQYDVQQGEwJERTETMBEGA1UEChMKR2VybWFu
R3JpZDESMBAGA1UEAxMJR3JpZEthLUNBAgIpiDANBgkqhkiG9w0BAQEFAASCAQC+WtrPST2hsisU
HkuJ4z3h3aKFK/xVGiyuUWdC1/3pfzvtpb1q5/YpdhbKS2DXWorVMkA/PKTGm00xGRA+GrLHIux9
aCRqUFLbcInks9synssR8UXRo2v4B5supjwN0WOyjnNz0kWyUjczfk/FPqMxJZAQlyWCU13vA1pw
/hooOuDkAoNEVXFk2oJ6vO5iUE7wcIDYcrTb+HayxNq87JTD/U62eUyM9xLrY1Jgy9qMwzF6l9YT
Ecc4B4DAICnAUacWnQ8ABp2MSBUY2HojbMAJKUmGgy8I4+uVtesoiWSuMCNo1LoC53CdbaO0AeJ7
wy/IfaEfscoBq8EV6GYW+Uo7AAAAAAAA


--=-yk3j02dLPLBnpzRj05Ej--

