From: Lopsch <lopsch@lopsch.com>
Subject: Re: question about --tcp-flags
Date: Fri, 03 Dec 2004 00:44:00 +0100
Message-ID: <41AFA8C0.4010006@lopsch.com>
References: <41AF9255.4040408@lopsch.com>	<20041202231155.GA6712@bender.817west.com>	<41AF9865.2090401@lopsch.com>
	<1102028933.3217.2.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature";
	boundary="------------enig580418C18B8D5C9E37FCEB99"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102028933.3217.2.camel@hubcap.ljm.dom>
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
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig580418C18B8D5C9E37FCEB99
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Jason Opperisano schrieb:
> On Thu, 2004-12-02 at 17:34, Lopsch wrote:
>=20
>>Thank=C2=B4s will take look at that list :). But a last question. --syn=
 is=20
>>the same as --tcp-flags ALL SYN?
>=20
>=20
> no.  "--syn" is the example you asked about:
>=20
>   --tcp-flags SYN,RST,ACK SYN
>=20
> this is clearly explained in 'man iptables' btw...
>=20
> -j
>=20
> --
> "Fame was like a drug. But what was even more like a drug were
>  the drugs."
> 	--The Simpsons
Yes I know but the manpages don=C2=B4t work here don=C2=B4t know why. Hmm=
 but then=20
it=C2=B4s better to explicit drop packets like ... --tcp-flags SYN,FIN=20
SYN,FIN before using a line like this ... --syn -m state --state NEW ...=20
because this would also allow the usage of SYN,FIN for new connections.=20
And that=C2=B4s not a legal set. Or isn=C2=B4t it necessary to drop those=
 packets=20
because TCP will take care of that and send RST for them?

--------------enig580418C18B8D5C9E37FCEB99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)

iQIVAwUBQa+owCXe0Lt4Z4FpAQGvVA//e2KWbG5JLmrEF3f20gu6ZX4wA7LWoM4/
tbC0MCoKX32gKhR9WopgYLF/KWksBVVMhqvqTQ8MSTW+RZZKHnNs/IbLw6mb+hR/
Xdyj4awnOD+ZZqtSBhlgIn/MBsAvqLilp/3tZYFuELpml43g16ILD425auFDj9VC
iKtiwe+zEqWSBrHqV6QvEyN7spKVJrz9HYhBWQGRWMU0+ztHLxjeEiHcuKqtjaZV
lH13MD1XYDv3WcpClfBOxz39lHS2L49uzEKu85nVAMrfx6PCL8uAIVMaet8YlASQ
QjUqn49I0tqANAq9E7eIH6OKkAWAbvgcZgIc1THRIW9Ce64nkgN/H0gQfl78OcZi
7PgPC8+63/SdOccbfk+v6oFGEqLBz2pKkujwwZ8fidbt9KZbmCXxuZK0MCuyn1va
dV3e3yNhNJJZ+BNPFYkZxwecAHTVik8YV7MnAaY8XBUCv6PsxNGcgWXuxNhxXW57
B6i6fvWdczCKMyhS+8rNObKmRl/h7G516a59jp8t1CdmELc12SHW0xZ/1cZz9wwZ
JcQ2zOhyoDyv0jL7VFQ1vyQIpDa5PUpONYtzO5kJf+U/dA/bHQ6EAB4VUbG3O+NY
7C714FG5cRwHTkmORVfD3DOjmHD99EGnTO9ru7pOvTW5WscIghVyxDBiA+ufpQ1i
SPX4ssFXIws=
=zUpt
-----END PGP SIGNATURE-----

--------------enig580418C18B8D5C9E37FCEB99--


