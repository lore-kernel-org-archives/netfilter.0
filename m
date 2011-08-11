From: Eric Leblond <eric@regit.org>
Subject: Re: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 12:10:54 +0200
Message-ID: <1313057465.3408.12.camel@tiger.regit.org>
References: <1313055975.3628.56.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-TKXgp4yonDV3MzzoZ0lU"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1313055975.3628.56.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org


--=-TKXgp4yonDV3MzzoZ0lU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello John,

Nice to hear from you again ;)

On Thu, 2011-08-11 at 05:46 -0400, John A. Sullivan III wrote:
> Hello, all.  We have been having a subtle problem with conntrack for
> quite a long time but it has suddenly gotten much worse.  Packets are
> being matched as INVALID when we would expect them to be ESTABLISHED.
> We are running on kernel 2.6.30.5 on X86_64 with CentOS 5.4 and
> iptables-1.3.5-5.3.el5_4.1.  This has escalated from a minor annoyance
> that we were going to investigate to provoking serious outages and all
> hands to the pump.
>=20
> The conntrack table is not swamped although we did increase the max
> count and the hashsize just in case to no avail:
> [root@fw01 netfilter]# cat ip_conntrack_max
> 65536
> [root@fw01 netfilter]# cat ip_conntrack_count
> 532
>=20
>=20
> Here are three specific examples.  The first is from the FORWARD chain.
> Here are the logging messages:
>=20
>=20
> Aug 11 03:29:19 fw01 kernel: FORWARD INVALID IN=3Dbond1 OUT=3Dbond4
> SRC=3D172.x.y.73 DST=3D172.x.z.34 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D6=
3 ID=3D32940
> DF PROTO=3DTCP SPT=3D8080 DPT=3D52999 WINDOW=3D34 RES=3D0x00 ACK FIN URGP=
=3D0

I've already observed this kind of problem. This was related with some
software/OSes having really strange timeout value.

To check weither this is the same problem, you can ask the kernel to log
the reason why the packets are invalid. This can be made by running:

        echo "255">/proc/sys/net/netfilter/nf_conntrack_log_invalid

After doing this, the kernel will log all invalid packets through the
default log system. You can check which one you are using by doing:
 =20
        cat /proc/net/netfilter/nf_log=20
         0 NONE ()
         1 NONE ()
         2 ipt_LOG (ipt_LOG)
        ...
       =20
2 is the coding for IPv4. With that ipt_LOG value, the message are sent
via the standard kernel log. If instead of this value, you've got
something like ULOG or NFLOG, you will need to get the message by
listening to the nflog-group or ulog-group 0 in ulogd[2].

If this is timeout issue, you can play with the timeout setting of the
conntrack in the /proc/sys/net/netfilter/nf_conntrack_*time* files.

BR,
--=20
Eric Leblond=20
Blog: http://home.regit.org/

--=-TKXgp4yonDV3MzzoZ0lU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5Dqq4ACgkQnxA7CdMWjzJiFwCcC3o8Zhlbhxz4n0fAyoadlPQd
lO4AoIA3sqN1kznokFJtLVOdRVBVLQEs
=xLrK
-----END PGP SIGNATURE-----

--=-TKXgp4yonDV3MzzoZ0lU--

