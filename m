From: Unknown <unknown@unknown.invalid>
Subject: Re: transparent squid with internal sites as well
Date: 25 Nov 2002 12:53:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038221585.19172.151.camel@rayw.knowledgefactory.co.za>
References: <20021125121935.0adac911.bain@tcsn.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-fdHjmXxx32RC+KPRK+Ie"
Return-path: <netfilter-admin@lists.netfilter.org>
From: Raymond Leach <Ray@work>
In-Reply-To: <20021125121935.0adac911.bain@tcsn.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-fdHjmXxx32RC+KPRK+Ie
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

One solution could be split horizon DNS? Is your firewall also a DNS
server?

Ray

On Mon, 2002-11-25 at 12:19, Henti Smith wrote:
> Hi there=20
>=20
> I have a little problem I'm hoping somebody can help me with.
>=20
> We are running a WAN here with firewall and tranparent proxy. I have some=
 webservers on the inside of the firewall (yes I know .. this is not my cho=
ice... *sigh*)
> which I'm forwarding all data to ip's to those machines.=20
>=20
> The problem is:
>=20
> With transparent proxy working the way it should, nobody on the internal =
network can see the internal websites.
> With transparent proxy off, all works but I have no way of seeing who bro=
wses where anor content control.
>=20
> here is firewall rules that pertain to setup.
>=20
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination        =20
> REDIRECT   tcp  --  10.0.0.0/8           0.0.0.0            tcp dpt:www r=
edir ports 3128=20
> REDIRECT   tcp  --  10.0.0.0/8           0.0.0.0            tcp dpt:3128 =
redir ports 3128=20
> DNAT       tcp  --  anywhere             web1		    tcp dpt:www to:10.0.0.=
10:80=20
> DNAT       tcp  --  anywhere             web1               tcp dpt:https=
 to:10.0.0.10:443=20
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination        =20
> SNAT       all  --  10.0.0.0/8          !10.2.0.0/16        to:liveip
> SNAT       all  --  192.168.1.0/24       anywhere           to:liveip
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination        =20
>=20
> as off right now .. transparent proxy is not logging any internal traffic=
 ... but I need to have tranparent proxy but still allow internal users to =
browse to web1
>=20
> any suggestions ?=20
>=20
> Henti Smith
--=20

--=-fdHjmXxx32RC+KPRK+Ie
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA94gERh1fuR/Bv+ygRAn+hAJ9HsjKj9S1uXOf2dIaAG/cVHKpLSgCggG3e
GOYWV/KjdIxET1B3XPqEYuc=
=SFKt
-----END PGP SIGNATURE-----

--=-fdHjmXxx32RC+KPRK+Ie--


