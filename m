From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: anti-dos
Date: Wed, 28 Jan 2004 12:35:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075286102.2000.61.camel@raylinux.internal>
References: <F22386C3FEB012449238672E38ED61E71642B1@overlord.overturemedia.com>
	 <1075277664.7228.56.camel@raylinux.internal>
	 <200401281108.04514.heinrici76@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-N9CVoRp2/ztzrLouaG/m"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401281108.04514.heinrici76@gmx.de>
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


--=-N9CVoRp2/ztzrLouaG/m
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-01-28 at 12:08, Axel Heinrici wrote:
> Hi
>=20
> On Wednesday 28 January 2004 09:14, Ray Leach wrote:
> >
> > You can use the limit support to limit packet rates:
> >
> > ### syn-flood chain
> > $IPTABLES -N syn-flood
> > $IPTABLES -A syn-flood -i $IFACE_INET -m limit --limit 75/s
> > --limit-burst 100 -j RETURN
> > $IPTABLES -A syn-flood -i $IFACE_DMZ -m limit --limit 75/s
> > --limit-burst 100 -j RETURN
> > $IPTABLES -A syn-flood -i $IFACE_INT -j RETURN
> > $IPTABLES -A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
> > $IPTABLES -A syn-flood -j DROP
> >
> > $IPTABLES -A INPUT -i $IFACE_INT -p tcp --syn -j syn-flood
> > $IPTABLES -A INPUT -i $IFACE_DMZ -p tcp --syn -j syn-flood
> > $IPTABLES -A INPUT -i $IFACE_INET -p tcp --syn -j syn-flood
> >
> I have a questions on this. As I interpret the rules any packet with is=20
> not catched by the two limit-rules is targeted to LOG.=20
> Due to the huge number of possible SYN-Packets in a dos-attack this does=20
> not seem useful to me. Shouldn't there be a "-m --limit=20
> 10/minute" in the log-rule?
The LOG rule is so I can trace where the DOS came from. The limit of
75/s is assuming that our 512K line is capable of receiving that many
packets per second (if it isn't, then we better start looking for new
hardware).


>=20
> with kind regards
> 	Axel
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-N9CVoRp2/ztzrLouaG/m
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAF5BWh1fuR/Bv+ygRAuRYAJ4mYhXbTcROpdVLxjyCnO51CsTtbgCfUeT0
M/qlNof9LNTjbExbFwp2tMc=
=xDJM
-----END PGP SIGNATURE-----

--=-N9CVoRp2/ztzrLouaG/m--


