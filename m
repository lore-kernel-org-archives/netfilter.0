From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Natted IRC "inherently insecure"?
Date: Sun, 7 Jul 2002 20:19:42 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708001941.GC653@ns>
References: <3D243492.6090408@tampabay.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3D243492.6090408@tampabay.rr.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "Jesse W. Asher" <jasher1@tampabay.rr.com>
Cc: netfilter@lists.samba.org


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Jesse W. Asher (jasher1@tampabay.rr.com) wrote:
>=20
> Someone recently indicated to me that they believed that natting IRC=20
> through a firewall was "inherently insecure" and I wanted to get=20
> opinions on that statement.  I guess, in my mind, it isn't any more or=20
> less secure than any other service natted through the firewall - it all=
=20
> depends on how comfortable you feel with the inherent security of the=20
> client/tool that you're using.
>=20
> Comments?

The client/tool is one thing but I think what they were probably getting
at is the issue of DCC.  The problem with DCC is that it expects to be
able to reach any >1024 port on the remote system.  The two clients work
out, over the IRC network, the ports to use.  If your firewall doesn't
allow connections to high ports outbound or inbound, and you don't use
some kind of IRC helper in your firewall, then DCC won't work.  This may
be acceptable to you but some people feel they need DCC.  Using an IRC
helper in your firewall can mitigate these problems some.  They can't
fix everything though because of the way in which the DCC protocol
works.  A user using DCC can potentially allow a scan of the high ports
on at least the machine they're IRC'ing from.

Unfortunately I'm not very familiar with the internals of the netfilter
IRC-helper module or what checks it does but there are some things it
has no way to know due simply to where it has to be and what it gets to
see.  I havn't heard of many people getting attacked in such a way
though so the chances of you being exploited in that way are probably
pretty slim.  Unless you have someone going for you specifically using
an IRC helper will probably be enough.  Most attackers are going for
'easy' targets, things they can sweep large network blocks for; such as
the recent OpenSSH holes, various Windows-based services, etc.

	Stephen

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9KNqdrzgMPqB3kigRAhX+AJ9JynigcgnxlaHYvcc9SJREw4L/6wCfTtY9
F0wHXLgEBs3kYcn/VYHoiVs=
=PTTp
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--

