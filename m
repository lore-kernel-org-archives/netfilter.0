From: martin f krafft <madduck@madduck.net>
Subject: RFC 4890 (icmpv6 firewall recommendations) and ip6tables (was:
	ip6tables icmp conntracking on 2.6.18 vs 2.6.24)
Date: Fri, 4 Apr 2008 09:32:30 +0200
Message-ID: <20080404073230.GA22259@piper.oerlikon.madduck.net>
References: <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> [2008.04.03.1814 +0=
200]:
> In order to handle ICMPv6 in the best way I'd suggest to read
> rfc4890 titled Recommendations for Filtering ICMPv6 Messages in
> Firewalls, which even comes with a sample ip6tables script.

I read over that document and I am a bit dazzled at the complexity
of the resulting ip6tables ruleset after running the script. It does
certain things that I'd *hope* wouldn't be necessary because they
remind me of the patchwork that used to be packet filters in their
early days, blocking corner cases that nobody has thought of before.
It's 2008 now and ip6tables/netfilter is highly advanced, so when
I see stuff like this:

  # Drop echo replies which have a multicast address as a destination
  ip6tables -A icmpv6-filter -p icmpv6 -d ff00::/8 \
    --icmpv6-type echo-reply -j DROP

I really scratch my head because either Linux should be dropping
such invalid messages itself, or at the very least, netfilter
should, and not even as part of --state INVALID dropping, since
those are invalid packets (if I understand this right) no matter
whether I am tracking state or not.

The next thing I really have to wonder about is why the author
iterates the error messages and for each, adds a rule like

  ip6tables -A icmpv6-filter -m state -p icmpv6 \
    -d $inner_prefix \
    --state ESTABLISHED,RELATED
    --icmpv6-type packet-too-big \
    -j ACCEPT

for each.

This unnecessarily complicates the ruleset to the point an admin
will just lose track, I think. Why not just let a global --state
ESTABLISHED,RELATED rule accept those? I can hardly imagine a case
in which you don't want to ACCEPT ESTABLISHED,RELATED, and if you
do, you should be using NOTRACK, no?

Next, the script adds explicit DROP rules to the FORWARD chain for
most non-errors, like neighbor-solicitation and the like. Why? The
chain policy should be DROP and the ruleset limited to ACCEPTs, no?

I really wonder how this script made its way into an RFC. It's
hardly a recommendation, or well, it isn't a recommendation that's
built on any features in today's netfilter/ip6tables and general
kernel IP stack.

We're early enough in the IPv6 life-cycle that we can fix problems
at the core, rather than recommending rulesets with hundreds of
lines that guard against cases that should never happen anyway, or
rulesets which don't actually harness the power of the tools they
use.

I won't even mention stuff like typos, e.g. under "TIME EXCEEDED
ERROR MESSAGES" we find artifacts of copy-paste errors
("packet-too-big"). But then again, these days, ISO has lowered the
standards of, ha, "standards" anyway. But I won't mention it. :)

I still appreciate that you pointed out this RFC, Jozsef, it
contains a lot of good information and should be required reading
for any IPv6 firewall engineer. I hope you concur, however, that its
appendix B is useless.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
the images rushed around his mind and tried
to find somewhere to settle down and make sense.
            -- douglas adams, "the hitchhiker's guide to the galaxy"
=20
spamtraps: madduck.bogus@madduck.net

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9dmOIgvIgzMMSnURAkn5AJ9Oq/Nwe7K5ZK5AU8n1dgxomlpUtwCgm77q
vYA07s43t3McGxvtUNYF5us=
=X0Li
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
