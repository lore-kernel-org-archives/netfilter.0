From: Harald Welte <laforge@netfilter.org>
Subject: Re: [RFC] Allowing non-root to get iptables info?
Date: Thu, 28 Feb 2008 10:18:43 +0100
Message-ID: <20080228091843.GJ3877@prithivi.gnumonks.org>
References: <20080225094951.5bd89c9c@extreme>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080225094951.5bd89c9c@extreme>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 25, 2008 at 09:49:51AM -0800, Stephen Hemminger wrote:
> Is there any strong reason why checking the status of iptables is restric=
ted?

It was ages ago that this question last came up.  I believe it was the
general concensus at the time that allowing anyone to read the packet
filter policy can be considered an information leak.

It's not only the policy information, but also quite extensive (and
depending on the ruleset, detailed) statistics about the amount of
packets / bytes from/to a particular machine/service/... - information
that can be much more valuable than the generally readable per-interface
packet/byte counters.

Now yes, it may be arguable whether you should have regular user
accounts on your firewall at all.  However, especially in the case of
co-located servers with no dedicated firewall in front (i.e. just
local INPUT/OUTPUT rules), you don't have much of a choice but to have
local users.  Should they be able to obtain this detailed information?

I think better not.  There's no real reason for them to know this.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD4DBQFHxnxzXaXGVTD0i/8RAlcFAJ9LVQzvkF6UJBWHm55N6RM0OeFPagCY9lRN
L7pHeXSDStIf3fOztOeN9A==
=TU8q
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--
