From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: loop problem
Date: Wed, 21 Apr 2004 10:04:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040421080430.GA14585@zion.homelinux.com>
References: <OF5A3E4536.070CB617-ON65256E7D.0023533F@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF5A3E4536.070CB617-ON65256E7D.0023533F@hss.hns.com>
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


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Wed, Apr 21, 2004 at 12:08:33PM +0530, aksingh@hss.hns.com told us:
>=20
> Hi All
>=20
>   capture packets using the netfilter PRE_ROUTING(all packets coming from
> outside this machine wld be captured here) and  and the NF_IP_LOCAL_OUT
> loop(all packets that are going out of my machine would be captured here).
> Then I do a bit of packet mangling in the user space by returning NF_QUEUE
> from these two hook functions , my user space process which gets the
> packets can do two things, it can either reinject the same into the kernel
> ... by setting the verdict in ip_set_verdict  as NF_ACCEPT .... or it can
> generate(absolutely new packets) its own packets which it wants to send to
> the kernel. I use libnet to inject these new packets, my context in libnet
> is RAW. Now when these newly injected packets reach the ip( the ones that
> were reinjected .. using the ip_set_verdict call are handled fine ... no
> problems there) , they are caught by my NF_IP_LOCAL_OUT hook and handed
> back to my user space appliaction, i dont want this to happen. what can i
> do here to prevent this loop.

Maybe you could mark the packets in PREROUTING hook and in LOCAL OUT
just hand those packets to userspace without the mark??


HTH

Sven

>=20
> thanks
> Amit
>=20

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 10:02:33  up 14:51,  1 user,  load average: 0.02, 0.05, 0.01

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAhisOo4FAdB2PneQRArEGAJ4pbV/9T5FG4JG8fxyMxfuEZYwx9wCfXHHk
hntPXeHmR+k2CUPS1o2wukE=
=F4UV
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--

