From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Sat, 17 Dec 2005 17:59:21 -0500
Message-ID: <20051217225921.GA5417@bostoncoop.net>
References: <20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
	<Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
	<20051118015254.GA21128@bostoncoop.net>
	<Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2005 at 12:07:59PM +0100, Jozsef Kadlecsik wrote:
> > > > I'm running kernel 2.6.8-2-k7 from Debian Stable, iptables v1.2.11.
> > > Try to upgrade to a newer kernel.
> > I guess I'd do this as a last resort. I'm trying to keep the system in
> > question on Debian Stable if possible. Is there reason to think a kernel
> > upgrade would just fix it?
> Just as a last resort. But the problem is so strange, I can't recall any
> patch related to such a behaviour.

I've finally managed to upgrade the kernel without hosing my RAID/LVM
setup.

Unfortunately, I still have the identical problem. I'm now using
2.6.14-2-k7 from Debian unstable.

Packets go from client to nat box, then nat to server, then back from
server to nat box, but never then back to internal client.

The connection is showing up as tracked in /proc/net/ip_conntrack.

Even if I force nat encapsulation by SNATing the packets to unprivileged
ports, I get the same result (other than that the reply packets come back
on whatever unprivileged port was selected).

Does anyone have any other ideas about how to troubleshoot this problem?
I was really hoping the kernel upgrade would fix it, but unfortunately
not.
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDpJhJdTf3ZklQ6qYRAg2WAJ4rK9n5Hoxack4k035fEwfCJadBSACfdr93
0CSoigIfYKd8UE0crYFpTdY=
=9h2U
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

