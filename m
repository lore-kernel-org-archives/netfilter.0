From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 4 Apr 2008 14:39:40 +0200
Message-ID: <20080404123940.GA9157@piper.oerlikon.madduck.net>
References: <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net> <87y77vx7kn.fsf@petole.dyndns.org> <20080404085100.GB27854@piper.oerlikon.madduck.net> <87lk3uq9p3.fsf@petole.dyndns.org> <20080404110428.GA32555@piper.oerlikon.madduck.net> <877ifdrfu4.fsf@petole.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <877ifdrfu4.fsf@petole.dyndns.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Nicolas KOWALSKI <niko@petole.dyndns.org>
Cc: netfilter@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.04.1359 +020=
0]:
> > also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.04.1057 =
+0200]:
> >> -A INPUT -s ::/0 -d ::/0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> >> -A INPUT -s ::/0 -d ff01::/32 -j ACCEPT
> >> -A INPUT -s ::/0 -d ff02::/32 -j ACCEPT
> >> -A INPUT -s ::/0 -d ::/0 -m state --state INVALID -j LOG
> >> -A INPUT -s ::/0 -d ::/0 -m state --state INVALID -j DROP
> >
> > Why do you treat multicast special before INVALID?
>=20
> These rules matched the router sollicitation packets, apparently. I
> will reorder the ICMPv6 ACCEPT rule before INVALID.

I read in another email to this thread that conntrack does not
involved multicast (yet), so you're right.

> >> -A INPUT -s 2001:6f8:3f1::/48 -d ::/0 -i eth0 -j ACCEPT
> >
> > Source-authenticated rules *can* be exploited.
>=20
> Even with the '-i eth0' ?
>=20
> Well, I will remove this also.

Sure, if they are on the inside. 70% of the attacks come from the
inside in companies. Of course, if this is a home network, the issue
(and security requirements) are different.

> >> -A INPUT -s ::/0 -d ::/0 -p ipv6-icmp -j ACCEPT
> >> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 22 -j ACCEPT
> >
> > You probably want --syn in there too.
>=20
> ESTABLISHED,RElATED connections are matched before, so at this point
> these can only be new sessions, and so I did not feel it was necessary
> to add more checks. I will correct this.

NEW just means that conntrack does not know about the connection.
--syn means that the SYN flag is set. They *should* be the same, and
if INVALID worked right, then you would never see non-syn flags at
this point, but they do have different meanings.

Ideally, however, --syn is no longer needed if you do

  -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
  -A INPUT -m state --state INVALID -j DROP
  -A INPUT -m state --state NEW -j in-new

  -A in-new -p tcp --dport 22 -j ACCEPT
  [...]

  -A INPUT -j log-and-drop

I /think/ this is the correct way to write iptables rules, but
please correct me if I am wrong, anyone!

> -A INPUT -s ::/0 -d ::/0 -i lo -j ACCEPT
> -A INPUT -s ::/0 -d ::/0 -p ipv6-icmp -j ACCEPT
> -A INPUT -s ::/0 -d ::/0 -m state --state RELATED,ESTABLISHED -j ACCEPT

Now make sure that your hosts don't honour redirects. I actually
don't think passing *all* ICMPv6 is a good idea. Do read the RFC
(see followup thread).

> -A INPUT -s ::/0 -d ::/0 -m state --state INVALID -j LOG
> -A INPUT -s ::/0 -d ::/0 -m state --state INVALID -j DROP

(might not want to log this, actually. who cares?)

> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 22 -m state --state NEW -j=
 ACCEPT
> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 25 -m state --state NEW -j=
 ACCEPT
> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 80 -m state --state NEW -j=
 ACCEPT
> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 443 -m state --state NEW -=
j ACCEPT
> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 465 -m state --state NEW -=
j ACCEPT
> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 993 -m state --state NEW -=
j ACCEPT

note how I simplify the rules with the in-new chain...

> -A FORWARD -s ::/0 -d 2001:6f8:3f1::/48 -i sixxs -o eth0 -m state --state=
 RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -s 2001:6f8:3f1::/48 -d ::/0 -i eth0 -o sixxs -j ACCEPT

In an ideal world, the addresses shouldn't be needed because the
routing tables should ensure that no other peers could be routed
through the interfaces you specify, but I am still not sure about
this...

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
obviously i was either onto something, or on something.
                                 -- larry wall on the creation of perl
=20
spamtraps: madduck.bogus@madduck.net

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9iGMIgvIgzMMSnURAtZYAJsHnd0Qb+mtKHvLFca5Ln71/2WbmQCfRlvu
jnfE0LFgCBzzbvighYQmjY4=
=9+MY
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
