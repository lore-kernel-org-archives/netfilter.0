From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: How to change a packet's arriving interface? -j ROUTE?
Date: 09 Dec 2002 07:32:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039411928.1714.3.camel@rayw.knowledgefactory.co.za>
References: <3DF0D338.C2F4E50@Gallantry.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-cXl92us0/3MQXsV/GjzV"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF0D338.C2F4E50@Gallantry.com>
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


--=-cXl92us0/3MQXsV/GjzV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Use SNAT on the POSTROUTING chain in the NAT table.

iptables -t nat -A POSTROUTING -d $NET_DMZ -j SNAT --to-source
$IP_DMZ_IFACE

also you would need a FORWARD rule to route the initial traffic:
iptables -A FORWARD -d $NET_DMZ -j ACCEPT

These are the least restrictive examples of possible rules. The above
assumes you have public ips in your DMZ.

Ray

On Fri, 2002-12-06 at 18:41, Jason Liao wrote:
> Hi,
>=20
> I have a firewall running iptables with 3 interfaces: LAN, WAN and DMZ.=20
> The LAN IP address is 10.0.0.1/24, WAN 66.134.34.157/28, and DMZ
> 66.134.34.249/28.  The WAN interface connects to the Internet and the
> DMZ interface connects to a stub network.
>=20
> When someone sends a packet to the IP address of the DMZ interface from
> the Internet, the packet x.x.x.x->66.134.34.249 arrives at the WAN
> interface.  I want to know if there is a way using iptables (maybe with
> other tools such as iproute2) to make this packet to appear as if it
> arrives at the DMZ interface.  The packet itself should not be
> modified.  I need this to work because I am running an IPSec VPN with
> FreeS/WAN on the DMZ interface.  When the ESP packets arrives on the WAN
> interface, they cannot be properly processed by IPSec because the ipsec0
> interface is tied to the DMZ interface directly. =20
>=20
> I looked at the mangle table but could not figure out if it is the right
> direction.  I read about the ROUTE target but do not know if this target
> is for diverting packets to be sent OUT on another interface, or can it
> be used to change a packet's arriving interface.
>=20
> Thanks in advance.
>=20
> Jason Liao
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/

--=-cXl92us0/3MQXsV/GjzV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99CrYh1fuR/Bv+ygRAgQ+AJ0dkkwFf9lZ1oSetE4b+zotUz6Z4gCePLpr
Sj2mbALOAjo0N/hmBmdb13c=
=F5Ri
-----END PGP SIGNATURE-----

--=-cXl92us0/3MQXsV/GjzV--


