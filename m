From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Count/limit feature
Date: Wed, 2 Apr 2003 22:36:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030403033653.GH18434@ns.snowman.net>
References: <20030402141644.60c03834.arnt@c2i.net> <000401c2f95d$6b2a8a60$1001a8c0@s3ac>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mGogChkTWDyM7+rg"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000401c2f95d$6b2a8a60$1001a8c0@s3ac>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Rowan Reid <rreid@studio3arc.com>
Cc: netfilter@lists.netfilter.org


--mGogChkTWDyM7+rg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Rowan Reid (rreid@studio3arc.com) wrote:
> I was talking to someone of BSD persuasion and they noted that the ipfw
> feature had a count parameter which can be used to limit icmp attacks.
> Ie more then n number of pings and you begin to ignore the client or
> address range.  Is there something similar for netfilter

You can do this with ipt_recent to ignore the address it's coming from.
I'm thinking about adding an ability to do address ranges to it.

	Stephen

--mGogChkTWDyM7+rg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+i6xVrzgMPqB3kigRAiP9AJ9RF9902U5hEAMVwwsHdRpX6btEogCgkIpo
EG7YZOltJO3Ff732h3cL4NI=
=Ckrt
-----END PGP SIGNATURE-----

--mGogChkTWDyM7+rg--

