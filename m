From: "Alexander W. Janssen" <yalla@hackers-r-us.org>
Subject: questions regarding fragmentation
Date: Sat, 4 Oct 2003 15:53:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031004135329.GA3533@hackers-r-us.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

the filtering howto states:

  "If you are doing connection tracking or NAT, then all fragments will get
  merged back together before they reach the packet filtering code, so you
  need never worry about fragments."

This fits to my observation regarding NAT: i send out fragmented ICMP packa=
ges
with sing and they were reassembled before they left the outbound wire.

But it also says:

  "Usually it is regarded as safe to let second and further fragments throu=
gh,
  since filtering will effect the first fragment, and thus prevent reassemb=
ly
  on the target host; however, bugs have been known to allow crashing of
  machines simply by sending fragments. Your call."
  (talking about the -f flag)

Does that mean that fragments allways will be reassembled before they get
forwarded when you use connection tracking a/o NAT?

It's looks like that for me - never had problems with fragments, though. I'm
just asking because i'm just creating a big testcase-scenario for a accepta=
nce
of a new firewall i just build for a customer.
I'm just curious. Haven't thought about it for a long time since the
filtering-code became stateful...

Thanks,
Alex.


--=20
"Obviously Linux owes its heritage to UNIX, but not its code.
We would not, nor will not, make such a claim."
                            -- Darl McBride, August 28th 2002      =20


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/ftDZEMMZKORQoYIRAjDaAJ47tMZsJP00o3jvnh0tn+JofSX1xACfVAr/
n/pQmAYxae8kWublctpQpWY=
=DshO
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

