From: Unknown <unknown@unknown.invalid>
Subject: Re: transparent squid with internal sites as well
Date: 27 Nov 2002 09:39:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038382761.1451.77.camel@rayw.knowledgefactory.co.za>
References: <20021125121935.0adac911.bain@tcsn.co.za>
	 <1038221585.19172.151.camel@rayw.knowledgefactory.co.za>
	 <20021127085814.16b50de3.bain@tcsn.co.za>
	 <1038380456.1451.65.camel@rayw.knowledgefactory.co.za>
	 <20021127091419.57f9a3e6.bain@tcsn.co.za>
	 <1038381319.1450.74.camel@rayw.knowledgefactory.co.za>
	 <20021127092641.3d320dd8.bain@tcsn.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-a6rxxMsx9wCTzUbJLHwH"
Return-path: <netfilter-admin@lists.netfilter.org>
From: Raymond Leach <Ray@work>
In-Reply-To: <20021127092641.3d320dd8.bain@tcsn.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Henti Smith <bain@tcsn.co.za>
Cc: Raymond Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-a6rxxMsx9wCTzUbJLHwH
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-11-27 at 09:26, Henti Smith wrote:
> On 27 Nov 2002 09:15:19 +0200
> Raymond Leach <Ray@work> wrote:
>=20
> > > I'm way new to transparent proxy, but I've done a bit of playing ipta=
bles.=20
> > > I'm going to play around witha  few more ideas tho.
> > We also use squid as a transparent proxy here. For internal websites
> > though, do you need them to go through the proxy? Is there some trackin=
g
> > that you need to do, or would it not be possible to 'catch' the request=
s
> > to the servers using iptables before they get redirected to squid? This
> > is what we do, and it works fine.
>=20
> internal browsing we don't care about ... but I do need to provide stats =
for external traffic
> if I can redirect the internal stuff before it gets to the proxy cool ..=20
> as long as the rest still goes to proxy and I get stats as per usual on h=
ow much they download
>=20
> > Also, check what interface squid is using to process the request. It
> > might be trying to use the external interface instead of the internal
> > one.
>=20
> any ideas how to do that ?=20

Here are my rules:
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 80 -d
$IP_INET_WEB1 -j DNAT --to $IP_INT_WEB1
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 8080 -d
$IP_INET_WEB1 -j DNAT --to $IP_INT_WEB1
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 80 -d
$IP_INET_WEB2 -j DNAT --to $IP_INT_WEB2
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 80 -d
$IP_INET_WEB3 -j DNAT --to $IP_INT_WEB3
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 8080 -d
$IP_INET_WEB3 -j DNAT --to $IP_INT_WEB3
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 80 -d
$IP_INET_WEB4 -j DNAT --to $IP_INT_WEB4
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 80 -d
$IP_INET_WEB6 -j DNAT --to $IP_INT_WEB6
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 8080 -d
$IP_INET_WEB6 -j DNAT --to $IP_INT_WEB6
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp --dport 80 -d
$IP_INET_WEB7 -j DNAT --to $IP_INT_WEB7
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp -s $NET_INT --dport
80:90 -j REDIRECT --to-port 3128
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp -s $NET_INT --dport
443 -j REDIRECT --to-port 3128
$IPTABLES -t nat -A PREROUTING -i $IFACE_INT -p tcp -s $NET_INT --dport
8080 -j REDIRECT --to-port 3128

If you need explainations, just SHOUT !

>=20
> Henti=20
--=20

--=-a6rxxMsx9wCTzUbJLHwH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA95Haph1fuR/Bv+ygRAqNHAJwLGh7U/oXJHeAX7OfReANBYx++FgCfRYIj
bsLHo88YikDaaMGDozd0qSk=
=7zUl
-----END PGP SIGNATURE-----

--=-a6rxxMsx9wCTzUbJLHwH--


