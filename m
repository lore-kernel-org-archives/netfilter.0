From: Lars Dam <l.p.dam@amity.nl>
Subject: FW: Can IPTables check for a valid IP address
Date: Thu, 18 Sep 2014 17:53:45 +0200
Message-ID: <D4669F1AE5CE3D4293C4658A698E502904B637068E4F@SELENIUM.amity.local>
References: <D4669F1AE5CE3D4293C4658A698E502904B637068E4C@SELENIUM.amity.local>
 <541AF628.8090509@sterenborg.org> <1888551.XEiLyKG9NI@nb003>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_D4669F1AE5CE3D4293C4658A698E502904B637068E4FSELENIUMami_"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1888551.XEiLyKG9NI@nb003>
Content-Language: nl-NL
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

--_002_D4669F1AE5CE3D4293C4658A698E502904B637068E4FSELENIUMami_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks. I know what to do.

Regards,

Lars Da,

-----Oorspronkelijk bericht-----
Van: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.or=
g] Namens Michael Schwartzkopff
Verzonden: Thursday, September 18, 2014 5:31 PM
Aan: netfilter@vger.kernel.org
Onderwerp: Re: Can IPTables check for a valid IP address

Am Donnerstag, 18. September 2014, 17:11:36 schrieb R. Sterenborg:
> On 09/18/2014 03:50 PM, Lars Dam wrote:
> > We suffer from DNS lookups with a response IP address which is not=20
> > existing.
> >=20
> > Can Iptables check on this?
>=20
> What is it you actually want iptables to do? Do you want it to check=20
> if the IP address that the DNS server responds with exists and is in use?
> Or..? Maybe the DNS server should be fixed instead of trying to go this w=
ay.
>=20
> Iptables (well, Netfilter) is a packet filter. You can filter packets=20
> that match a rule that you define. It can't validate your DNS server's=20
> output

iptables cannot help you since the source IP address presumably varies. If =
the source address does not vary than iptables can help you.

Just google "iptables rate limit"


Anyway, it seems that you operate a open resolver on your server. Please go=
ogle, why this is not a good idea. But if you really want to run a open res=
olver, than read the docs of your DNS server how to limit the request rates=
. For bind, see:

http://ss.vix.su/~vjs/rl-arm.html
 .



Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044 Franziskanerstra=
=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein

--_002_D4669F1AE5CE3D4293C4658A698E502904B637068E4FSELENIUMami_
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: signature.asc
Content-Disposition: attachment; filename="signature.asc"; size=237;
	creation-date="Thu, 18 Sep 2014 15:53:45 GMT";
	modification-date="Thu, 18 Sep 2014 15:53:45 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjQuMTIgKEdO
VS9MaW51eCkNCg0KaUY0RUFCRUlBQVlGQWxRYStzUUFDZ2tRc210ZXNxTHVCRFIwWFFFQTZVSzNp
UWRLYTJFWFMxa1Uwa2pVWWl1RA0KenlGdXJCbU54eFQzQjNhcktNc0JBTjQ4NUtUazByeWlYa1JC
TytBTGllZVJYY0hBR3oxYmorRURDQmNsdmJJNQ0KPW9VbGoNCi0tLS0tRU5EIFBHUCBTSUdOQVRV
UkUtLS0tLQ0K

--_002_D4669F1AE5CE3D4293C4658A698E502904B637068E4FSELENIUMami_--
