From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: more fun with squid
Date: 12 May 2003 08:12:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052719930.1460.5.camel@raylinux.internal>
References: <ABEKJILKOKKGGDJKHKDFOEPICAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-FRPrMhel+BrzZoPDILjp"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFOEPICAAA.patrick@vikus.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter EMAIL <netfilter@lists.netfilter.org>


--=-FRPrMhel+BrzZoPDILjp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

To set squid up as a transparent proxy (obviously read the HowTo for
this), and basically there are 4 directives to change in the config
file:

httpd_accel_uses_host_header on
httpd_accel_port 80
httpd_accel_host virtual
... umm the last only is something like httpd_accel_proxy....something

Then you have to get netfilter to redirect packets to squid:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to
1.2.3.4:3128




On Fri, 2003-05-09 at 21:49, Patrick Ahler wrote:
> Ok, I got squid working great behind my firewall even set it up so IE wou=
ld
> autodetect it. What I would rather do though is have netfilter/the firewa=
ll
> server(192.168.1.a) forward any http packets from my network 192.168.1.0 =
to
> the proxy server on 192.168.1.b and then out to the internet through the
> firewall(192.168.1.a). That way the proxy would be transparent to the use=
rs'
> browsers and no autodetection would be required. Not sure how to setup th=
ese
> rules, or if this is even the most efficient way of accomplishing the tas=
k.
> Also, I don't know if it makes a difference... but the firewall runs NAT
> tables.
>=20
> So, in other words, this is what I'd like to do...
> (user)192.168.1.c --->(firewall)192.168.1.a--->(squid/proxy)192.168.1.b--=
->(
> firewall)192.168.1.a
>=20
> Thanks in advance,
> -Patrick
>=20
>=20
>=20

--=-FRPrMhel+BrzZoPDILjp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+vzs6h1fuR/Bv+ygRAkW8AJ9b0xoGrPbRlxQEisbfu1ZnfonIpwCfbeG5
DhqV+W7+toEOchK5P7Ra9nw=
=4MpI
-----END PGP SIGNATURE-----

--=-FRPrMhel+BrzZoPDILjp--


