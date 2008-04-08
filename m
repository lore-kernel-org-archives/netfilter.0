From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Tue, 8 Apr 2008 15:15:33 +0200
Message-ID: <20080408131533.GA28766@piper.oerlikon.madduck.net>
References: <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <20080403152330.GA15573@piper.oerlikon.madduck.net> <47F56197.1000504@plouf.fr.eu.org> <20080404085029.GA27854@piper.oerlikon.madduck.net> <47F65500.8040705@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47F65500.8040705@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Pascal Hambourg <pascal.mail@plouf.fr.eu.org> [2008.04.04.1819 =
+0200]:
>> Note, however, that the 2.6.18 kernel modules exist and everything
>> can be set up without errors, it then just doesn't work.
>
> This is getting confused. Didn't you wrote "I can confirm that nf_* =20
> modules are not present in Debian's 2.6.18" ?

No, nf_* are not, but ip_conntrack_* are and there is no error when
I load a -m state rule with ip6tables.

> But you reply him that "this is still the case with 2.6.24."
> So what exactly is wrong with IPv6 conntrack in 2.6.24 ?
>
> On which pre-2.6.24 versions - besides Debian's 2.6.18 image which
> has  IPv6 conntrack support disable at build time, this is not
> a bug but a  feature - do you see an IPv6 conntrack bug such as
> the "don't seem to  register OUTGOING packets in the connection
> table" bug you described ?

Yes, http://marc.info/?l=3Dnetfilter&m=3D120717177831833&w=3D2

Other than that, this thread was to find out whether work has been
done on IPv6 conntrack since 2.6.18.

And apparently in 2.6.22, it's not fixed:

  http://marc.info/?l=3Dnetfilter&m=3D120721692500732&w=3D2

or is this just a Debian issue? CONFIG_NF_CONNTRACK_IPV6=3Dm is set in
2.6.22.

> AFAIK, the only improvement in the area of this thread is that an error =
=20
> "can't load conntrack support for proto=3D10" is triggered when you try t=
o =20
> use the 'state' match in ip6tables if the kernel is built with =20
> ip_conntrack, thus lacks IPv6 conntrack support.

Good. It *does* work on 2.6.24, so I guess we can close this thread.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"when a woman marries again it is because she detested her first husband.
 when a man marries again it is because he adored his first wife.
 women try their luck; men risk theirs."
                                                        -- oscar wilde
=20
spamtraps: madduck.bogus@madduck.net

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH+2/1IgvIgzMMSnURAo8zAKC1AR2MRrZdmoyK0ND2HU190dI94ACgtMxO
Hrkcg8p8XhfAdooSJFZenvI=
=FCas
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
