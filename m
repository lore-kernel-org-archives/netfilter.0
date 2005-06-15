From: Andy Smith <andy@strugglers.net>
Subject: Re: Why does this connection stop being tracked?
Date: Wed, 15 Jun 2005 11:30:45 +0000
Message-ID: <20050615113045.GF754@strugglers.net>
References: <20050614161105.GN750@strugglers.net>
	<Pine.LNX.4.58.0506151312470.27260@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0506151312470.27260@blackhole.kfki.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org


--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks Jozsef for looking at this.

On Wed, Jun 15, 2005 at 01:18:38PM +0200, Jozsef Kadlecsik wrote:
> On Tue, 14 Jun 2005, Andy Smith wrote:
>=20
> > In dom0 I have iptables running, with the eb-nf support of linux
> > 2.6.11 and the physdev module loaded so that I can match traffic
> > coming in to each of my user domains.
> [...]
> > Now, I have noticed that while this works most of the time, for
> > reasons unknown to me, some TCP connections just seem to stop being
> > tracked and hit the DROP rule.  Even though they have been tracked
> > fine for several hours.  This happens on every user domain to all
> > kinds of TCP connections, but I have pared the ruleset down to just
> > the one domain (strugglers.net) and SSH to demonstrate.
>=20
> You have two choices: either disable TCP SACK support on all your
> real/virtual machines behind your firewall, or upgrade the kernel on the
> firewall.

Do you have any instructions or a pointer to documentation onhow to
temporarily disable SACK?  If it was a /proc setting that would be
ideal; I don't really want to have to recompile kernels though.

> There is a SACK related bug in netfilter connection tracking in
> 2.6.11 (and below).  According to the dumped traffic your connections
> suffer from packet losses,
       =20
Interesting; this may explain why I only notice this when I'm coming
=66rom 82.44.131.131 - its network is kind of sucky. :)

>        SACK kicks in and conntrack screws up tracking
> the given TCP connections. (Sorry, I can't recall at which rc release was
> the fix submitted in.)

How sure are you that this is the problem I am seeing?

Thanks again for your help.

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCsBFlIJm2TL8VSQsRAobxAKDk8tD/Yffm3r833V3td2/azlbctgCg4sU4
xVMiGomwi11o6nouXO//QuM=
=i6GK
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--

