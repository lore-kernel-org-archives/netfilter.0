From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Reinjecting packets using libipq
Date: Tue, 20 Apr 2004 12:29:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420102929.GA6236@zion.homelinux.com>
References: <OFCC294FDA.EB782326-ON65256E7C.002FB337@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFCC294FDA.EB782326-ON65256E7C.002FB337@hss.hns.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi again,

On Tue, Apr 20, 2004 at 02:25:19PM +0530, aksingh@hss.hns.com told us:
>=20
> Hi Sven,
>=20
>    thanks for the reply, i wll be a bit more specific with my question th=
is
> time
>    suppose I am using netfilter hooks, and not iptables ---
>=20
>    my PRE_ROUTING hook returns NF_QUEUE and the packet goes to the user
>    space, my user space program plays with the packet and then calls
>    ip_set_verdict with a verdict of NF_ACCEPT, in this case the packet
>    would continue its journey in the kernel from after the PRE_ROUTING ho=
ok
>    or would it again get caught by the PRE_ROUTING hook ?

Well, like I said, when packets are reinjected (by nf_reinject) they=20
continue traversal at the very next rule in your chain. When there's=20
no rule left, the traversal of this chain should end. (well that's
what I read from the kernel source, so please anybody correct if I'm
wrong :)

>    Also, I had another doubt, can we use libpq to reinject absolutely new
>    packets into the kernel at the ip level and make sure that they dont g=
et
>    caught by our registered netfilter hooks ? .. or if we cannot use libpq
>    then is someother way available (on the same system where we have the
>    PRE_ROUTING netfilter hook, we want to bypass this hook for certain
>    packets). The newly injected packets cld either be outbound(going to t=
he
>    wire) or inbound( they after going to ip will have to go up the stack =
to
>    tcp and all)

I recently read your new mail at the netfilter mailing list about=20
(re)injecting new packets from userspace, but actually I don't think
that this would work (or at least it would be quite some work to
do), as you'd also have to build a completely new skb in your=20
function which would call nf_reinject. Anyone else with more
knowledge on this one??

Another way of injecting packets to the kernel might be packet sockets,
don't know if that would be the right one for you. see man 7 packet


HTH

Sven

>=20
> thanks
> Amit
>=20


--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 12:17:13  up 2 days, 19:14,  1 user,  load average: 4.20, 4.08, 2.82

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAhPuJo4FAdB2PneQRAsqCAJwKto7Uh1QyH6g5ikni/EDR2EeGmQCcC1ku
t2+W4Sjd+9niz3UxbCszt2w=
=tISc
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

