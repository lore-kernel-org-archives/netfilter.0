From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: Re: Tightening up outgoing traffic
Date: Wed, 16 Oct 2002 11:58:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210161158.17348.apapadop@cmu.edu>
References: <1034686034.15446.38.camel@localhost.localdomain> <1034772030.2206.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1034772030.2206.5.camel@localhost.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Neil Hodge <neh@attbi.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wednesday 16 October 2002 08:40, Neil Hodge wrote:
<snip>
> Thanks for all of the information.  It worked well.  Although, when I
> had to reboot (for another reason), X wouldn't start . . .  Alas, that'=
s
> a battle for another day.
>
You need to enable all traffic on the loopback interface. X creates local=
=20
connections for itself.

/sbin/iptables -A OUTPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT

should so the job

- -A
- --=20
http://www.andrew.cmu.edu/~apapadop/pub_key.asc
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE9rYyZgmAMwQt1gmURAtspAJwJCiP8GGA5W6XEnm9d3cI6MgCi5ACeK+9+
4TmYKgGeik0f+eM5Csh+hB0=3D
=3DPke4
-----END PGP SIGNATURE-----


