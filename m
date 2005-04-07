From: Alexander Samad <alex@samad.com.au>
Subject: Re: firewall protocols
Date: Fri, 8 Apr 2005 08:13:51 +1000
Message-ID: <20050407221351.GA8563@samad.com.au>
References: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
	<42557D73.7070500@provident-solutions.com>
	<Pine.LNX.4.60.0504071609440.23293@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0504071609440.23293@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2005 at 04:14:08PM -0400, R. DuFresne wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On Thu, 7 Apr 2005, Vernon A. Fort wrote:
>=20
> >Ted Gervais wrote:
> >
> >>I have just discovered that people are not able to telnet to my system=
=20
> >>and I have been told that it is not because I don't have the necessary=
=20
> >>ports open but rather the problem is because of protocols??
> >>
> >>I have no idea what this means and am wondering if someone could explai=
n.=20
> >>If it is needed I can supply a copy of my firewall  but was wondering=
=20
> >>first if anyone has heard of this.
> >
> >you should be able to list the open port from the iptables command: =20
> >iptables -L -nv
> >and
> >telnet localhost to see if telnet if running
> >
> >from the iptables, you should see port 23 open from the ip address needi=
ng=20
> >access.  you should also be able to telnet to the localhost.
> >
>=20
> Which might tell him if the ports open, but not if there's anything reall=
y=20
> listening on the port.  gre telnet /etc/inetd.conf is a better starting=
=20
> point, since he claims is rulebase allows telnet already, this so7unds=20
> like the ports open but there's nothing listening.  If he see this=20
> response;
>=20
> #telnet stream  tcp     nowait  root    /usr/sbin/tcpd  in.telnetd
>=20
> He needs to vi /etc/inetd.conf to enable telnet <and with tcpd for other=
=20
> sec reasons>  the kill -HUP inetd and also then make sure his=20
> /etc/hosts.allow is setup to allow telnet, especially if he has a=20
> populated /etc/hosts.deny.


can always try a netstat -pane | grep 23 to see what is using/listening
on port 23

>=20
> Thanks,
>=20
> Ron DuFresne
> - --=20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
> Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>=20
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>=20
>                 -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>=20
> iD8DBQFCVZSVst+vzJSwZikRAi1AAJ4lcGiGAAo4nNFMFI5M4cEja7s0jwCcDI18
> xX+FOhgzqbMgGbGdIhZ4oGE=3D
> =3DyWtU
> -----END PGP SIGNATURE-----
>=20
>=20

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCVbCfkZz88chpJ2MRAo5oAKD0z1V1IK7CQSxAiuXpyDASGw20nACgvALp
QHgKkfO9vTNLvR/c/V+YAkM=
=GWUN
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

