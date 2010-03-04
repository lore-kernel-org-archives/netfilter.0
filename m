From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: miscellaneous netfilter questions
Date: Thu, 04 Mar 2010 11:19:03 +0100
Message-ID: <1267697943.22478.17.camel@etppc09.garching.physik.uni-muenchen.de>
References: <20100303165419.87692fvlklxfna68@webmail.physik.uni-muenchen.de>
	 <4B8E94F7.4080908@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha1; protocol="application/x-pkcs7-signature"; boundary="=-GMaihmaGviwrHsuVz/ZJ"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8E94F7.4080908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-GMaihmaGviwrHsuVz/ZJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Pascal.

Thanks in advance for your detailed answers :)


On Wed, 2010-03-03 at 17:57 +0100, Pascal Hambourg wrote:
> Packets processed with the NOTRACK target have the UNTRACKED state.
Ah, nice,... this is not described in the manpage (at least not in
Debian's 1.4.6 package of iptables).
Perhaps one should add this?


> > Or is it all the addresses which the kernel thinks the host has itself,=
 e.g.
> The latter, I guess.
I looked through some source files of the kernel and iptables,.. but was
not able to really find a definite answer on this... seems to be
"hidden" (well at least to me) ^^


> > a) It's quite clear what happens if one uses "-f" or "! -f" but what =20
> > happens if neither of the tow is give? Does it mean "! -f" or is it =20
> > like "match not fragmented packets AND fragmented packets (both the =20
> > first AND further fragments).
> The latter, obviously. All packets are matched regardless of fragmentatio=
n.
Not sure whether this is really so obvious,... anyway, perhaps this
could also be added to the manpage... e.g. for -o and -i it says what
happens if the options are omitted. :)


> For IPv4, indeed when conntrack is enabled incoming fragmented datagrams
> are reassembled before the PREROUTING chains. Note that packets which
> are to be delivered locally are reassembled by the stack (not by
> conntrack) before the INPUT chains anyway, so you never see fragments in
> INPUT chains.
ok... well...
a) What about packages not delivered locally? I assume they're simply
passed on in the fragmented state as they are? Is this always the case?
E.g. if the next hop network as an MTU that is smaller than the fragment
size?

b) All these things which you say that are happening on the stack (e.g.
the defragmentation here, dropping of packets with bogus addresses or
source addresses that match the address of a local interface)... these
things generally happen _before_ netfilter, right? Or at which place are
they happening?


> AFAIK things work a bit differently for IPv6 : fragmented datagrams are
> "virtually" reassembled for conntrack (the reason being that an IPv6
> router does not handle fragmentation/reassembly), but continue to exist
> as fragments through the ip6tables chains and the IPv6 stack.
Ah... I see... uhm... in this case, how would the following work?
Image one wants to allow incomming packets for ssh so we have about:
:INPUT DROP
-A INPUT --protocol tcp -m tcp --destination-port ssh -j ACCEPT

Now packets come in fragmented,... this would not work for later
fragments right, as the port is not known... so as soon as fragmentation
happens, the above would not work (as expected).

But it should work with those rules:
:INPUT DROP
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT --protocol tcp -m tcp --destination-port ssh --syn -j ACCEPT

..because contrack still works, and the fragmented packets are accepted
by the first rule.

Do I understand this correctly?



Thanks again,
Chris.

--=-GMaihmaGviwrHsuVz/ZJ
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
MDE5MDNaMCMGCSqGSIb3DQEJBDEWBBQj6pyjV4I/FZG1RRRVOIzEO7UYvTBLBgkrBgEEAYI3EAQx
PjA8MDYxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpHZXJtYW5HcmlkMRIwEAYDVQQDEwlHcmlkS2Et
Q0ECAimIME0GCyqGSIb3DQEJEAILMT6gPDA2MQswCQYDVQQGEwJERTETMBEGA1UEChMKR2VybWFu
R3JpZDESMBAGA1UEAxMJR3JpZEthLUNBAgIpiDANBgkqhkiG9w0BAQEFAASCAQA50GkZwkhsfzqJ
OiXKUOeH8HkTSm7LvhwmyDbdBo/qKT9KUXbEe+PYAnrn//MCmCsU4U8C9WHYExKzjkvagPhDMoDU
IUK0l0bm+sq03UZ6E2LkoErweVp9QtxM7Audcw8/0eyLfeRGoYZlnlqq43Qz5Phce5y5YroxDNdb
aIAEUtQrIAwsPwoWUrQR2mR3O38/8kG9OOAqdsGOAU3QkcJBw3shZZzzt2ArqYx7PlpgPP5d+87K
74YUIDbE209PyZ0vray+bzGHHjvxTP0pk3sXVUvGSPD4GcWqSU5qy8gmVW4fUKwLk7cvQNOx4cQS
cgmIuaVdxzGwDvjuXaZ3aJbLAAAAAAAA


--=-GMaihmaGviwrHsuVz/ZJ--

