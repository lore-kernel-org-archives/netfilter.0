From: Harald Welte <laforge@netfilter.org>
Subject: Re: Memory leak?
Date: Fri, 7 Nov 2003 17:53:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031107165336.GW5741@sunbeam.de.gnumonks.org>
References: <20031103142830.14782.87331.Mailman@netfilter-sponsored-by.noris.net> <000301c3a2e2$ce7e05e0$12dfa643@tichael>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ywUhQCikZ2Y3PNw"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000301c3a2e2$ce7e05e0$12dfa643@tichael>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Michael Friedhoff <michael@profindy.com>
Cc: netfilter@lists.netfilter.org


--0ywUhQCikZ2Y3PNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2003 at 08:49:10AM -0600, Michael Friedhoff wrote:

what is your ps outout supposed to tell us?
=20
> I am not positive that netfilter is the cause for
> the memory loss, but it is the only purpose of the
> machine.  In the last 12 hours, the amout of
> available memory has decreased by 1.5MB.  I know
> that isn't much, but since this is a production box,
> I would rather not have to reboot it constantly.

what amount of memory are you referring to?  'free' memory (as in the
top program) will always be very low, since linux uses almost all free
memory for caching/buffering.=20

the output of /proc/slabinfo (|grep ip_conntrack) should be more useful
to see if the conntrack hash is growing or not.

> --Michael Friedhoff

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--0ywUhQCikZ2Y3PNw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/q84QXaXGVTD0i/8RAu9EAJ44s27HHyTa6Mq8GjdrrLSJiQKdFwCfUgY2
SCsJV8oB8sQC0zPLRXQivuU=
=psfM
-----END PGP SIGNATURE-----

--0ywUhQCikZ2Y3PNw--

