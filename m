From: Wiktor Wodecki <w.wodecki@manfred-dahlhoff.de>
Subject: Re: advanced ip accounting
Date: Fri, 5 Jul 2002 13:06:37 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705110637.GA6793@equilibrium.manfred-dahlhoff.de>
References: <20020705074508.GB2006@mt.mk.cvut.cz> <02070513000901.14428@Lms>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <02070513000901.14428@Lms>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Jan Humme <jan.humme@xs4all.nl>
Cc: netfilter@lists.samba.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2002 at 01:00:09PM +0200, Jan Humme wrote:
> On Friday 05 July 2002 09:45, Martin Tomasek wrote:
> > Hello all,
> > I'm looking for some accounting for netfilter, which should be used like
> > this:
> > iptables -A FORWARD -s 1.2.0.0/16 -j ACCOUNTING
> #iptables -A FORWARD -s 1.2.0.0/16
> i.e. without the -j option, to create a counter, and use

this doesn't give you detailed information about every IP, only for the
whole subnet...but the original poster might want to look at http://lwn.net=
/Articles/2718/

--=20

Regards,

Wiktor Wodecki <w.wodecki@manfred-dahlhoff.de>

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9JX29quOEd6FVn+cRAikNAKCMljqQfDJbBDr31WCINVhRKA3ssACfajv1
SBZ/6Ftrt8lu+RS3iIJb/Oo=
=CDxF
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--

