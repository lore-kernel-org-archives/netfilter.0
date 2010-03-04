From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: how to harden iptables rules?
Date: Thu, 04 Mar 2010 12:47:23 +0100
Message-ID: <1267703243.22478.57.camel@etppc09.garching.physik.uni-muenchen.de>
References: <20100303172001.149912au9jha5s8g@webmail.physik.uni-muenchen.de>
	 <4B8E9F4A.9080706@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1; protocol="application/x-pkcs7-signature"; boundary="=-Lf8X/bOegneMKG4N7shE"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8E9F4A.9080706@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-Lf8X/bOegneMKG4N7shE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi.

On Wed, 2010-03-03 at 18:41 +0100, Pascal Hambourg wrote:
> > #accept outgoing packets by default
> > :OUTPUT ACCEPT [0:0]
> ACCEPT as a default policy is not so much hardening IMHO.
Yeah I know ^^,... but unfortunately software is used on my systems
which uses random source ports and not even a portrange is
configurable...
So I don't see a way to handle this except accepting output per
default :(


> > -A INPUT	-m state  --state ESTABLISHED,RELATED	-j ACCEPT
> Mostly agree, although I would drop some ICMP types such as redirect or
> source quench that may be harmful.
Why would ICMP packets match this rule? Are they (well at least errors
in response to some IP traffic) counted as RELATED?
But probably not things like echo-request, right? What should it relate
to?


> --reject-with-tcp-reset is more appropriate for TCP packets. DROP is
> more appropriate for ICMP packets.
good point,...
Well I accpeted ICMP before so that should never happen, but as you've
adviced I'll probably change this and then it makes sense to drop them.
Well,.. does it really? I've always thought no ICMP error messages would
be generated on errors with ICMP packets?


> > if I block it completely (except echo-request) I also dont't get any =20
> > ICMP error messages,
>=20
> No, valid ICMP error messages have the ESTABLISHED state.
Ah :-) Great!


> > net.ipv6.bindv6only =3D 1
> This has not much to do with iptables and packet filtering.
Oh yes,.. it just slipped in when grepping all net stuff :D

btw: Now that I generally block ICMP (except echo-request and
ESTABLISHED),... would I still need things like:
net.ipv4.conf.all.accept_redirects =3D 0
net.ipv6.conf.all.accept_redirects =3D 0
?

And does someone know whether the log_martians setting only affects
whether martians are logged or also whether they're really discarded?


> > 3) What I never clearly understood: Do I have to handle (drop) =20
> > "external packets" with:
> > -a source address of 127.x.x.x or :1
> > -a destination address of 127.x.x.x or :1
> > -a source address that matches one of the addresses of my other =20
> > interfaces (e.g. 88.88.88.88 if that is the address of eth0)
> This is not critical, because the IP stack already discards such packets.
Great great,... and I again assumes that this happens "before" netfilter
comes in place?


> > And how would I block these things cleanly? Using addrtype?
> Possibly. Or by specifying addresses explicitly.
Well but what I've understood from what you've wrote, this kind of stuff
is discarded automatically by the kernel anyway,... so no need to take
manual actions, right?


> > 4) Should I generally drop packets with state=3DINVALID or perhaps not =
=20
> > for packets from/to lo?
> Generally, yes. However you may make an exception on lo.
Yeah,.. I already thought about whether it makes sense to have
exceptions for lo on this...


> > 5) Is it necessary to do this or is it done automatically?
> > -p tcp ! --syn -m state   --state NEW	-j DROP
> > and (!) vice versa:
> > -p tcp   --syn -m state ! --state NEW	-j DROP
>=20
> The behaviour of TCP conntrack depends on the kernel version and some
> kernel parameters (mainly net.netfilter.nf_conntrack_tcp_be_liberal).
> --state NEW may not imply --syn and vice versa.
Uhm... well now I don't know what I should do here ^^
I tried to find some documentation on nf_conntrack_tcp_be_liberal but
was not really able to do so... :(
I use always one of the recent kernel versions..


> > 6) When I accept packets for dedicated services (e.g. ssh) I can do =20
> > one of those:
> > a) -A INPUT	--destination 88.88.88.88 --protocol tcp -m tcp =20
> > --destination-port ssh --syn	-j ACCEPT
> > (if 88.88.88.88 is the address of eth0)
> > b) -A INPUT	--in-interface eth0 --protocol tcp -m tcp =20
> > --destination-port ssh --syn	-j ACCEPT
> > c)  -A INPUT	--protocol tcp -m tcp --destination-port ssh --syn	-j ACCE=
PT
> >=20
> > (c) Is probably a bad idea as it would allow ssh also on other interfac=
es
> > But is there (from a security point of view) and advantage between (a) =
=20
> > and (b)?
>=20
> (b) also allow connecting on another interface because Linux enforces
> the so-called "weak host model". It all depends on your needs. Do you
> want to filter by interface, address, none or both ?
Well in principle,.. filtering by interface would be totally ok for
me,... I just wanna prevent things like this (if they're possible at
all?!):
my interface has e.g. again the address 88.88.88.88
someone sends packets with destination address 88.88.88.11 to that
interface (which should be not handled by it)...

Again,.. if such evil is automatically dropped my the kernel I'm totally
fine with filtering by interface,.. if not I'd guess filtering by
address would be more secure...

uhm.... Rethinking this scenario, I'd guess that packets with
dest=3D88.88.88.11 would be considered as packets to be forwarded, right?
So they should be either dropped because of my:
:FORWARD DROP
policy or my:
net.ipv4.ip_forward=3D0
right?



Again,... lots of thanks for your answers :)
Cheers,
Chris.

--=-Lf8X/bOegneMKG4N7shE
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
MTQ3MjNaMCMGCSqGSIb3DQEJBDEWBBQfVasPL0ZBMENjWpHQnMHNo0LmoDBLBgkrBgEEAYI3EAQx
PjA8MDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpHZXJtYW5HcmlkMRIwEAYDVQQDEwlHcmlkS2Et
Q0ECAimIME0GCyqGSIb3DQEJEAILMT6gPDA2MQswCQYDVQQGEwJERTETMBEGA1UEChMKR2VybWFu
R3JpZDESMBAGA1UEAxMJR3JpZEthLUNBAgIpiDANBgkqhkiG9w0BAQEFAASCAQC6fDK5kM/eqo3f
XZEafDsxWezetMRKhHU6s8eNHeEIm8OcSNaBSFK1u3StT+4NkhdIglEf+iRKN26As02NAh8eouD+
qqvZroCsRFxLX9Nkmc2sIpu7YuwEKBMJVGyOECtIA6QpaMLNTetzvaQLy8jm5EgYpxWT1BFqaRbF
e9cJ4Papvb0LJoiz2MJxPulvGldh3uhs+e0Ig4TITBqd7wZM/ZdRXj3K37IE9MEqZ3m+Y2eW0Rug
hiiX0cd4lUR0HWs7d/ye992/6mwqvBrj4RnkCP1wbK7KGeWFJ0LIHv4F8Y6znqBnXYwuhygNg7Iy
Mxq46tDHzZ5vIbjblhqn7murAAAAAAAA


--=-Lf8X/bOegneMKG4N7shE--

