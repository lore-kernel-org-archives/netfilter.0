From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Hello -- complicated firewal :(
Date: Tue, 02 Dec 2003 07:51:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070344266.4549.31.camel@raylinux.internal>
References: <20031201124713.3fea02c6.mgale@utilitran.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-jaxhBbPVhq6CtM1BAU6D"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031201124713.3fea02c6.mgale@utilitran.com>
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


--=-jaxhBbPVhq6CtM1BAU6D
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-12-01 at 21:47, Michael Gale wrote:
> Hello,
>=20
> 	I have been using iptables for a while but only in simple setups. Now I =
have been given the task to setup a major enterprise level firewall.
>=20
> This firewall has 22 external virtual IP addresses plus one primary inter=
nal and external IP. Oh it also has 1 virtual IP on the internal as well.
>=20
> So right now I have two firewalls running a master and slave cluster - wh=
ich every one is master listens on it's external and internal primary IP's =
for connections from me only so I can administer it.
>=20
> Plus then the master will listen on the 22 virtual IP's for DNAT them to =
the severs on the DMZ.
>=20
> The slave will only listen for traffic on the external and internal prima=
ry IP's so I can administer it.
>=20
> For a failover to be transparent the internal NIC of the master will list=
en on 172.16.0.1 and this is the internal networks gateway. This is NOT the=
 primary IP of either firewall.
>=20
> OK my question is .. when my master is up on firewall-1 it will listen on=
 172.16.0.1 (internal network default gateway) and 172.16.0.2 (primary INTE=
RNAL IP used only for administration)
>=20
Why do you need a virtual IP for administration? One IP on the internal
should be sufficient.

Use an INPUT rule to allow only your IP to administer the firewall:
iptables -P INPUT DROP
.
.
.
iptables -A INPUT -i eth1 -p tcp --dport 22 -s <your_ip> -d 172.16.0.1
-j ACCEPT

> How can I make it so internal users can only use 172.16.0.1 as a internet=
 gateway and NOT 172.16.0.2. =20

> >From my knowledge the FORWARD chain can only filter on source and destin=
ation address -- I would think I would have to filter out based on what IP =
the packet was forwarded to ... but how ?
>=20
> I hope this is clear -- I tried looking for help on some IRC channels and=
 nobody understood what I was talking about.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-jaxhBbPVhq6CtM1BAU6D
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/zChKh1fuR/Bv+ygRAlGoAJ9EDqAW5dF46wfbQi+7emShKLEgWQCeJ8KE
9VsLJRKyB3zb2RFL0ZHDcto=
=q0ry
-----END PGP SIGNATURE-----

--=-jaxhBbPVhq6CtM1BAU6D--


