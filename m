From: Stephen Frost <sfrost@snowman.net>
Subject: Re: -m recent
Date: Thu, 23 Jan 2003 17:40:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030123224028.GM484@ns.snowman.net>
References: <3E2FEA1C.9030305@maximum-linux.net> <20030123191505.GL484@ns.snowman.net> <3E301172.101@maximum-linux.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E301172.101@maximum-linux.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: uniplex <uniplex@maximum-linux.net>
Cc: netfilter <netfilter@lists.netfilter.org>


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* uniplex (uniplex@maximum-linux.net) wrote:
> How can I tell what version of ipt_recent I have? I downloaded the=20
> latest version of patch-o-matic and installed your patch from there.
>=20
> I tried using --name in different places but it still doesn't seem to=20
> work for whatever reason. Here's what I've tested with now.
>=20
> iptables -A INPUT -i eth0 -p all -m recent --update -j DROP --name icmps
>=20
> iptables -N icmps
> iptables -A INPUT -p icmp -i eth0 -j icmps
> iptables -A icmps -m limit --limit 2/hour --limit-burst 1 -j LOG=20
> --log-level alert --log-prefix "icmp: "
> iptables -A icmps -m recent --set -j DROP --name icmps
> iptables -A icmps -j DROP

It'd be before the -j DROP to see if that fixes it.  Recent versions of
ipt_recent will print out to your kernel log (which you can usually see
via dmesg) what version of ipt_recent it is.  If you're not seeing that
then you probably want to try and get a later version.  The latest
'released' version is on my website,
http://snowman.net/projects/ipt_recent/ .  There have been a number of
bug fixes, however, and so if you want to try my current 'beta' you can
download it from:
http://snowman.net/projects/ipt_recent/ipt_recent-0.2.6.tar.gz .
I've had alot of good responses to the beta so I'm planning on
releasing it when I have some time to do the 'paperwork'.  My son was
born a week ago and I'm still pretty busy with him tho. :)

	Stephen

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+MG9crzgMPqB3kigRAsb2AJwJj/N6CBl9HhvVz5t7SLX0/mTw/gCghswc
q65J1eUXBABYG5hGCt+JmS0=
=ZBuk
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--

