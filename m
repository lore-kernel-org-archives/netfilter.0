From: Eric Leblond <eric@inl.fr>
Subject: Re: A secure router, by MAC address
Date: Wed, 20 Oct 2004 21:12:42 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098299562.8628.48.camel@porky>
References: <1098297965.5686.9.camel@6-allhosts>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6KaRev4xZcf+/Ivb83aV"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098297965.5686.9.camel@6-allhosts>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: "jgalvez@webpipe.net" <jgalvez@webpipe.net>
Cc: netfilter@lists.netfilter.org


--=-6KaRev4xZcf+/Ivb83aV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

It really looks like you want to distinguish between well know users and
a set of mobile users.
NuFW (http://www.nufw.org) is done to distinguish between users because
it's an authentication firewall. It authenticates connection in a secure
manner, so you're sure of the identity of users that you let go accross
your firewall.

You can easily manage to build a solution comparable to the one you
describe below with NuFW. With more flexibility and more security.

On Wed, 2004-10-20 at 12:46 -0600, jgalvez@webpipe.net wrote:
> I am trying to setup a router, that forwards traffic from one interface
> for only a specific set of MAC addresses.
>=20
> Users on eth1 side will use a static IP address with a known MAC
> address. DHCP will be running on eth1 for rogue users. If the source IP
> is 10.0.0.0/8 all port 80 traffic needs to be redirected to localhost
> port 80. ONLY traffic from a listed IP and MAC should be allowed to be
> forwarded out.
>=20
> I need some recommendation on how to accomplish this.  If you could
> point me to a similar example or something I can figure it out . The
> more specific the better.  I have a few of my notes and attempts below.
>=20
> TIA
> -Josh
>=20
> eth0:
>  -Allow all traffic, in and out
> eth1:
>  -Allow all DHCP traffic - something like below
>   #iptables -I INPUT -i eth1 -p udp --dport 67:68 --sport 67:68 \
>   -j ACCEPT
>  -Allow all incoming traffic by source IP and MAC address
>   #iptables -A PREROUTING -i eth1 -t mangle -m mac \
>   --source 208.5.x.242 --mac-source 00:30:65:0e:91:d6 -j ACCEPT
>  -Redirect all port 80 traffic from 10.0.0.0/8 to localhost:80
>  -Drop all other incoming traffic
>   #iptables -A PREROUTING -i eth1 -t mangle -j DROP

BR,
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-6KaRev4xZcf+/Ivb83aV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBdriqnxA7CdMWjzIRAmQdAJ4wOVMcwU1K1WyDT6tXfniCtrddNQCeOlZc
o5e2Gi2OeCjY+QiM6OqABdo=
=CQGc
-----END PGP SIGNATURE-----

--=-6KaRev4xZcf+/Ivb83aV--


