From: Stephen Frost <sfrost@snowman.net>
Subject: Re: ipt_recent 0.3.0 --rttl still doesn't work  (I made a patch instead, can't wait)
Date: Mon, 3 Mar 2003 11:24:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030303162454.GN2721@ns.snowman.net>
References: <F208OXC80dFvgSFVA4R00035c2a@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2+jOUFLb7N+7fooZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F208OXC80dFvgSFVA4R00035c2a@hotmail.com>
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


--2+jOUFLb7N+7fooZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* per j (perj8@hotmail.com) wrote:
> I've played around with -j TTL and no it doesn't have to do with the TTL=
=20
> mangled in the FORWARD chain because all my rules with -m recent are in=
=20
> INPUT chain or the beginning of the FORWARD chain before ACCEPT.

If your patch is against 0.3.0 then it may very well matter since your
patch doesn't remove the 'if(out) ttl++;' line from 0.3.0.  Could you
check for that?

> I tried out the ipt_recent-0.3.0 release and the problem still exists.  I=
=20
> turned on debug and found out r_list[location].ttl is always the same and=
=20
> doesn't even come close to the ttl value stored in the recent list.

Yeah, that's an old bug from when I switched to using hash tables
apparently.  I believe that *should* read:
while(hash_table[hash_result] !=3D -1 && !(r_list[hash_table[hash_result]].=
addr =3D=3D addr &&
	(!r_list[hash_table[hash_result]].ttl || r_list[hash_table[hash_result]].t=
tl !=3D ttl))) {

Instead.  Note that I also had to invert the ttl check, it should be
considered a collision when the ttl doesn't match and matching ttl has
been requested.

> I got pretty fussed up patching and re-patching my kernel and your latest=
=20
> release still didn't fix the --rttl problem.  Finally I spend quite some=
=20
> time reviewing your source code.  Your code on the IPT_RECENT_TTL section=
=20
> doesn't do a single thing because the location variable in r_list[locatio=
n]=20
> doesn't change when hash_result is incremented.  I tried adding location =
=3D=20
> hash_table[hash_result] in the while loop, but that caused kernel panic. =
 I=20
> rewrote the whole IPT_RECENT_TTL code and now my tests for TTL matching=
=20
> works.  I fixed it!

Unfortunately what you did doesn't really work.  The goal of doing the
TTL match is to differentiate between IP addresses based on their TTL so
that they are really considered two seperate entities.  What you've done
is to only allow one TTL value per IP address, whichever TTL came first.
So, for example:

10.10.0.1 sends to router, TTL =3D=3D 32
  10.10.0.1 gets added to recent list with ttl =3D=3D 32
10.10.0.1 sends to router, TTL =3D=3D 25
  10.10.0.1 gets 'found' in the hash table but then fails the TTL match

10.10.0.1 with TTL of 25 will therefore never make it into the recent
list, which is wrong.  Instead of just picking the first TTL and going
with that these two need to be treated seperately as if they were two
different IP addresses.

If you could try the above changes I'd like to hear if they work for you
or not.  I'll try and find some time to really test the TTL code soon.

> Also I fixed the (unreported) problem with ttl not being set zero when=20
> manually adding ip addresses into the recent list with a for loop in a ba=
sh=20

Thanks, added that into my local version.

	Stephen

--2+jOUFLb7N+7fooZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Y4HVrzgMPqB3kigRAvo8AJ90HWgpPyN4paQBZqnjzq2v9Y48+QCfY9gr
H4KjMY2Nmg+nxCoF8OYNBcQ=
=LSI9
-----END PGP SIGNATURE-----

--2+jOUFLb7N+7fooZ--

