From: Stephen Frost <sfrost@snowman.net>
Subject: Re: ipt_recent 0.3.0 --rttl still doesn't work (I made a patch instead, can't wait)
Date: Mon, 3 Mar 2003 19:48:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030304004808.GP2721@ns.snowman.net>
References: <F191QIirBHORUedPfms0003b720@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="88pBQ1/6ie/nQzMF"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F191QIirBHORUedPfms0003b720@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: per j <perj8@hotmail.com>
Cc: netfilter@lists.netfilter.org, ipt_recent@snowman.net


--88pBQ1/6ie/nQzMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* per j (perj8@hotmail.com) wrote:
> Nope, my patch doesn't remove 'if(out) ttl++;'.  However I'm not too=20
> certain whether one would really use it.  It doesn't really matter unless=
=20
> --rttl is in the POSTROUTING chains.  So far -m recent and LOG are both=
=20
> seeing the same TTL for me and I have no --rttl in POSTROUTING.  Why woul=
d=20
> one use --rttl in POSTROUTING?  That's pretty late to filter incoming=20
> packets (or rather outgoing packets).  Perhaps one would use it to mangle=
=20
> forwarded parkets, but it would mean the packet already traversed the=20
> FORWARD chain!  Maybe you could better explain 'if(out) ttl++;'?  I guess=
=20
> it's there for those who must use --rttl in POSTROUTING?

The routing is done before the FORWARD chain is done (how else would you
know the outgoing interface?) and I believe the ttl incrementation
happens in the routing code.  I don't know that for sure and havn't had
time to test it.  The 'if(out) ttl++;' is meant to make TTL matching
work for people who use recent matching between PREROUTING and
FORWARD/POSTROUTING.  If you're using -j TTL and whatnot then really all
bets are off and there's no way for ipt_recent to figure that out so if
you're doing that you're kind of on your own with the ipt_recent TTL
matching.  The point of the 'if(out) ttl++;' is to allow you to 'set' in
PREROUTING and then 'rcheck' or 'update' in FORWARD, after the routing
code is done and have the TTL match work correctly, provided you are not
otherwise mucking the TTL.

> On the other hand, I use -j TTL --ttl-inc 1 in PREROUTING to restore the=
=20
> TTL of packets going through the gateway as if packets forwarded through=
=20
> the gateway are coming from the gateway.  So this _conflicts_ with your=
=20
> 'if(out) ttl++;' if I were to use --rttl in POSTROUTING after -j TTL in t=
he=20
> mangle table.  I think it best not to use 'if(out) ttl++;' in ipt_recent =
in=20
> this case.

I guess I could make that bit of code optional if there's really a need
for it to be?

> I see your point about making a new table entry for any different TTL fro=
m=20
> the same ip address.  Valid point indeed!  --rttl seems to work fine with=
=20
> your suggested code change to r_list[location].ttl, so I'm using the=20
> following patch instead.

Glad that's working.

> I wonder why you left the ?old? bug hanging around without giving your=20
> users any notice?  You should have publicly announced --rttl code is not=
=20
> yet done somewhere in the documentation or on your announcement pages. =
=20
> It's kinda a lie to publicly release ipt_recent without announcing the TO=
DO=20
> list of _old_ bugs.  Before this patch, --rttl worked only in extremely=
=20
> rare condition when r_list[location].addr=3D=3Daddr and location=3D=3D0. =
 and u=20
> knew this was an old bug for a year or so? (sigh)

I didn't know about the bug before you pointed it out to me.  After you
pointed it out I realized how old a bug it was because of what it was
doing.

	Stephen

--88pBQ1/6ie/nQzMF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Y/fHrzgMPqB3kigRAqTcAJ99LP2m8eXNvZqJgSlSkP5WEjcfrgCfaMcK
eQ6ErN7PafbMRBeNFkMBx98=
=zr48
-----END PGP SIGNATURE-----

--88pBQ1/6ie/nQzMF--

