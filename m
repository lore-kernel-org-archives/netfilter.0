From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 4 Apr 2008 10:50:29 +0200
Message-ID: <20080404085029.GA27854@piper.oerlikon.madduck.net>
References: <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <20080403152330.GA15573@piper.oerlikon.madduck.net> <47F56197.1000504@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47F56197.1000504@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Pascal Hambourg <pascal.mail@plouf.fr.eu.org> [2008.04.04.0100 =
+0200]:
>> This bug I see with 2.6.18
>
> Of course, Debian's 2.6.18 does not support IPv6 conntrack.

Okay, this is all I was asking in the original mail.

Note, however, that the 2.6.18 kernel modules exist and everything
can be set up without errors, it then just doesn't work.

>> and someone else with 2.6.22.
>
> Nicolas ? He just wrote he couldn't reproduce it.

Okay, I have not tried.

>> Or are you saying that if you ping6 from the machine with the
>> iptables rules to somewhere else, the echo-reply gets matched by
>> RELATED or ESTABLISHED?
>
> Yes, of course. The outgoing echo request is in the NEW state and
> the  incoming echo reply is in the ESTABLISHED state. Same with an
> incoming  echo request.

=2E.. except for 2.6.18, where everything seems like that should be
the case, but it doesn't work at all. Packets aren't even in the NEW
state, it seems.

On 2.6.18, I've observed that --state INVALID seems to match *all*
IPv6 packets, and NEW,ESTABLISHED,RELATED match *none*.

> There must be something wrong with your kernel.

Yeah, it's 2.6.18. You have 2.6.20. Apparently conntrack has been
worked on. That's all I wanted to know.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
you can't assign IP address 127.0.0.1 to the loopback adapter,
because it is a reserved address for loopback devices.
                                  -- micro$oft windoze xp professional
=20
spamtraps: madduck.bogus@madduck.net

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9evVIgvIgzMMSnURAowaAKDQV2x60KvFQLw4tkQFnqFRfVMwBgCg1eYk
oQOw+bHgDYhlIR6lgWisb5Q=
=Kzpj
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
