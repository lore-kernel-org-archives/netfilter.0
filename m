From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Routing decision?
Date: 15 Sep 2003 17:03:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063638190.31314.118.camel@raylinux.internal>
References: <3F657D37.1010000@able.be>
	 <1063616905.31092.78.camel@raylinux.internal>  <3F65981D.1060700@able.be>
	 <1063628083.31092.82.camel@raylinux.internal>  <3F65B63E.7030203@able.be>
	 <1063631398.31092.91.camel@raylinux.internal>
	 <1063632718.932.71.camel@elendil.intranet.cartel-securite.net>
	 <1063633591.31093.99.camel@raylinux.internal>
	 <1063634445.930.102.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-YLfCTH0RhiFmypiCP1/q"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063634445.930.102.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Wim Ceulemans <wim.ceulemans@able.be>, Netfilter Mailing List <netfilter@lists.netfilter.org>, pieter@able.be


--=-YLfCTH0RhiFmypiCP1/q
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-09-15 at 16:00, Cedric Blancher wrote:
> Le lun 15/09/2003 =E0 15:46, Ray Leach a =E9crit :
> > My firewall machine currently has 5 NICs, each with their own ip (one
> > has a public ip - eth0)
> > eth0 has the public ip. It also has 10 alias ips.
> > eth1 has a private ip of 192.168.1.1.
> > eth1 network is my dmz with all the web servers from 192.168.1.165 to
> > 192.168.1.173.
> > If I want to DNAT incoming traffic destined to on of the aliases bound
> > to interface eth0 to a server in the dmz - eth1 192.168.1.165 (for
> > example), then I need :
> >  - a PREROUTING DNAT rule
> >  - a FORWAORD rule for each direction (eth0 -> eth1 and eth1 -> eth0)
> >  - and an INPUT rule for eth0 alias ip.
> > Does that make sense?
>=20
> Not to me. Supposing alias i set up (using iproute or ifconfig) I would
> do this (and I think you did this) :
>=20
> 	iptables -t nat -A PREROUTING -d $ALIAS -i eth0 -j DNAT \
> 		--to 192.168.1.165
> 	iptables -A FORWARD -d 192.168.1.165 -i eth0 -o eth1 -j ACCEPT
> 	iptables -A FORWARD -s 192.168.1.165 -i eth1 -o eth0 -j ACCEPT
>=20
> And that's all to set a DNAT for incoming packets.
>=20
> > If I remove the INPUT rule, my DNAT does not work, the packets get sent
> > to the OUTPUT chain ...
>=20
> What is the INPUT rule ? Once your packet gets DNATed in PREROUTING, it
> is not sent to NF_IP_LOCAL_IN, but to NF_IP_FORWARD. Thus, it does not
> cross filter table INPUT chain. If packets go through INPUT chain, that
> means they're still destined to the alias IP, so that the DNAT rule did
> not match them.
> And I do not see how packets could go to OUTPUT chain as they're
> supposed to get routed, not locally generated... The only case I see is
> REDIRECT target use on a local proxy, so packets go through INPUT, then
> proxy reply sent through OUTPUT chain.
Now that's a possibility! I didn't even think of that. I do have a
transparent squid proxy running on that machine.

I suppose I was watching the traffic going through the proxy (probably
because I was testing from a local machine).

Thanks


>=20
> I'm a bit lost on this one.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-YLfCTH0RhiFmypiCP1/q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/ZdSuh1fuR/Bv+ygRAoL3AJ41vpNCoP+zin4K2P46xRp1WejaGQCfQhQt
ilWm6b9md/5kQnLThhaIoXQ=
=s17S
-----END PGP SIGNATURE-----

--=-YLfCTH0RhiFmypiCP1/q--


