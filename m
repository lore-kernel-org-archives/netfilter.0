From: Alexander Samad <alex@samad.com.au>
Subject: Re: forwarding Ports via VPN ??
Date: Wed, 24 Mar 2004 07:44:21 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040323204421.GB3387@samad.com.au>
References: <1080067446.2018.12.camel@ErrorL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1080067446.2018.12.camel@ErrorL>
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


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2004 at 07:44:07PM +0100, Cestonaro Thilo wrote:
> Hey,
>=20
> i have a vpn established and working via a Linux (Debian) Box and a
> Windows with openvpn.=20
> The tap devices have the following ips:
> linux 192.168.200.201
> windows 192.168.200.202
>=20
> My intern network address at linux net is=20
> 192.168.1.0/24
> and under windows it's
> 192.168.0.0/24
>=20
> now my question:
> I want to forward the ports 2005 2006 7064 from the Linux net into the
> Windows net ( enough when the packets appear at the vpn endpoint in
> Windows net)
> I get at the Linux VPN box the packets via eth0=20
> these packets are send to 255.255.255.255:2005 for example.

I think you will find that broadcast packets can't be NAT in this
fashion, there are a few app's (daemon) out there that re route these in
the fashion that you want, but you need the deamon at both ends of the
tunnel.


> Now I want them to go into the tap0 dev and appear at the windows box.
>=20
> I tried following rules for iptable at the linux box:
>=20
> iptables -A INPUT -i tap0 -j ACCEPT
> iptables -A OUTPUT -o tap0 -j ACCEPT
>=20
> iptables -t nat -A PREROUTING -p udp -i eth0 --dport 2005 -j DNAT --to
> 192.168.200.202:2005
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 2005 -j DNAT --to
> 192.168.200.202:2005
> iptables -t nat -A PREROUTING -p udp -i eth0 --dport 2006 -j DNAT --to
> 192.168.200.202:2006
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 2006 -j DNAT --to
> 192.168.200.202:2006
> iptables -t nat -A PREROUTING -p udp -i eth0 --dport 7064 -j DNAT --to
> 192.168.200.202:7064
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 7064 -j DNAT --to
> 192.168.200.202:7064
>=20
> iptables -A FORWARD -p udp -i eth0 --dport 2005 -j ACCEPT
> iptables -A FORWARD -p tcp -i eth0 --dport 2005 -j ACCEPT
> iptables -A FORWARD -p udp -i eth0 --dport 2006 -j ACCEPT
> iptables -A FORWARD -p tcp -i eth0 --dport 2006 -j ACCEPT
> iptables -A FORWARD -p udp -i eth0 --dport 7064 -j ACCEPT
> iptables -A FORWARD -p tcp -i eth0 --dport 7064 -j ACCEPT
>=20
>=20
> Could anyone say why this is not working?
> I looked at the tap0 dev for outgoing packets with "iptraf -i tap0 -u".
> But there are nor outgoing neither incoming packets :(
>=20
> Ciao Thilo
>=20
>=20
>=20

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAYKGlkZz88chpJ2MRAuX6AJoCU030h2vJS7kpsw69Q+838+ssQwCeLQWw
NL90xAY2LJ/TTc6VTrNY+wc=
=ojvJ
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--

