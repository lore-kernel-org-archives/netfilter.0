From: Harald Welte <laforge@netfilter.org>
Subject: Re: [netfilter-core] IPTables...
Date: Tue, 18 Feb 2003 18:44:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030218174457.GW11812@sunbeam.de.gnumonks.org>
References: <HAEDIOFCFBKACBFKGGJEAEJKCIAA.mike@plenty.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vIXBmblrD40XNCy4"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <HAEDIOFCFBKACBFKGGJEAEJKCIAA.mike@plenty.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Michael Lawford <mike@plenty.co.za>
Cc: coreteam@netfilter.org, Netfilter Mailinglist <netfilter@lists.netfilter.org>


--vIXBmblrD40XNCy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2003 at 06:39:45PM +0200, Michael Lawford wrote:
> Hi There,

Hi!

> I have a RaQ550 server that runs iptables.  The other day i logged in and
> got 1000+ of the following message from my server.

Please read http://www.netfilter.org/contact.html... I am sure you can
understand that the development team of a volunteer project can not
provide individual enduser support.

Apart from this, I cannot see how iptables should be involved with your
problem.  Maybe you should contact the vendor of your particular
product.

> And I keep getting these little error messages every 2 or 3 minutes...  N=
ow
> my network and UUNet guys tell me that it is IPTables that is trying to
> resolve to their main DNS server.  They have checked the settings and all

DNS resolving is done unsing UDP, your errors were about ICMP.

> Regards,
> Michael

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--vIXBmblrD40XNCy4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+UnEZXaXGVTD0i/8RApgHAJ9ZnpRsGmpihWJmYVf+wU7AH8dYpACfUaJo
jKZgi5hmTfUxLpMM6e8h8P4=
=8/6e
-----END PGP SIGNATURE-----

--vIXBmblrD40XNCy4--

