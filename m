From: Alexander Samad <alex@samad.com.au>
Subject: Re: kernel 2.6 ipsec and DNAT
Date: Sat, 4 Sep 2004 08:31:15 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040903223115.GP3169@samad.com.au>
References: <ED78BD9E-FDCA-11D8-8A26-000A95BDFB08@equation.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DMotDPdpQlD4ewOK"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <ED78BD9E-FDCA-11D8-8A26-000A95BDFB08@equation.fr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--DMotDPdpQlD4ewOK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

This is a known problem with netfilter and 2.6 and ipsec with the native
stack, there are fixs in pom-ng (Patch o matic), but this means building
your own kernel as it patches the kernel and the netfilter modules.  Not
to bad though, been doing this for a while and haven't had any majour
problems


Alex

On Fri, Sep 03, 2004 at 07:01:41PM +0200, Alain RICHARD wrote:
> Hi,
>=20
> we are using iptables and ipsec since several years now (starting with=20
> freeswan 1.0) without too much problems. We have now upgraded to the=20
> 2.6 kernel (under Fedora 2) and Openswan 2.x.
>=20
> Our setup works perfectly, with several dozens of tunnels up and=20
> running. We have avoided the lake of ipsec0 interface by marking=20
> packets (in fact this is great solution that enable us to separate=20
> completely the firewall settings from the vpn tunnels).
>=20
> The problem I am encountering now is that it seems that DNAT is not=20
> working when the d-natted session is from a tunneled site. My settup is=
=20
> :
>=20
>=20
> 192.168.1.0/24 local intranet
> 192.168.2.0/24 distant intranet
>=20
> the ipsec tunnel is setup from distant to local in order to get all the=
=20
> traffic passing into the local firewall (192.168.2.0/24 -> 0.0.0.0/0).
>=20
> This works perfectly and all the traffic either intranet or internet=20
> pass thru the local firewall.
>=20
> The problem now is that I want now to redirect the web traffic to squid=
=20
> using a classical transparent proxying :
>=20
> iptables -t nat -A PREROUTING -p tcp --dport 80 -m mark --mark=20
> 0x50010000/0xFFFF0000 -j DNAT --to 192.168.1.99:3128
>=20
> for an unknown reason, this is not working. On the 192.168.1.99 host, I=
=20
> see the connexion arriving but not correctly coming up :
>=20
> tethereal host 192.168.2.18
>   0.256680 192.168.2.18 -> 192.168.1.99 TCP 1166 > http [SYN] Seq=3D0=20
> Ack=3D0 Win=3D64512 Len=3D0 MSS=3D1260
>   0.256718 192.168.1.99 -> 192.168.2.18 TCP http > 1166 [SYN, ACK]=20
> Seq=3D0 Ack=3D1 Win=3D5840 Len=3D0 MSS=3D1460
>   0.442346 192.168.2.18 -> 192.168.1.99 TCP 1024 > http [RST] Seq=3D0=20
> Ack=3D0 Win=3D0 Len=3D0
>=20
> the last line RST seams not to be issued by the 192.168.2.18 host, but=20
> probably by the firewall/VPN gateway. I have also tried to set=20
> /proc/sys/net/ipv4/conf/*/rp_filter to 0, but the problem is the same.
>=20
> the same setup was correctly working under a kernel 2.4, so I think the=
=20
> problem is about natting the vpn connexion.
>=20
> Is there any problem like this under the current 2.6.8 kernel ? Do you=20
> have any idea to try to bypass the problem ?
>=20
> -------------------------------------------------------
> Alain RICHARD <mailto:alain.richard@equation.fr>
> EQUATION SA <http://www.equation.fr/>
> Tel : +33 477 79 48 00	 Fax : +33 477 79 48 01
> Applications client/serveur, ing?nierie r?seau et Linux
>=20
>=20

--DMotDPdpQlD4ewOK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBOPCzkZz88chpJ2MRAhGMAJ9z8jGU0lnN46nOiwyp+4mWNUd8fACbBkZG
1CmAVtkenZpB/O+DeayECrs=
=nBZQ
-----END PGP SIGNATURE-----

--DMotDPdpQlD4ewOK--

