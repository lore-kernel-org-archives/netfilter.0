From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: Can I have DES / 3 DES VPN with IPtables Kernal kernel version 2. 4.20 with IPSEC installed
Date: Thu, 18 Dec 2003 11:15:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031218161552.GA19518@alcove.wittsend.com>
References: <A44765C986F8D411995B00B0D0795F4B1E9A1B17@hhtnt002> <1071759272.1883.4.camel@jasiiitosh.nexusmgmt.com> <20031218081126.7719e90c.mgale@utilitran.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031218081126.7719e90c.mgale@utilitran.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Michael Gale <mgale@utilitran.com>
Cc: netfilter@lists.netfilter.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2003 at 08:11:26AM -0700, Michael Gale wrote:
> Hello,

> 	You should seriously consider Super FreeS/Wan ... it supports more then =
DES and 3DES which are out dated and I believe it has been proven.=20

	FreeSWAN doesn't support DES because it's considered weak.
Single DES hasn't been "cracked" per se, it's just that it's keyspace
(56 bits) is now considered too small to resist concerted brute force
attacks.  If it's used for persistent storage of data, you could have a
real problem.  If it's used with ephemeral keys in a communications
channel with frequent auto-rekeying and perfect forward secrecy (supported
by IKE/pluto) it's not so much a problem since brute forcing would take
longer than the life expectancy of the ephemeral key.  If you used it
for long term "shared secret" keys and sessions with no rekeying, you
could have a problem.  So if you want to be really REALLY sure, you
avoid single DES and so unpatched FreeSWAN doesn't support it.

> Michael.


> On Thu, 18 Dec 2003 09:54:32 -0500
> "John A. Sullivan III" <john.sullivan@nexusmgmt.com> wrote:
>=20
> > On Thu, 2003-12-18 at 07:58, Laxmi_Narsaiah wrote:
> > > Hi,
> > >=20
> > > Can I have DES / 3 DES VPN with IPtables Kernal kernel version 2.4.20
> > > with IPSEC installed, please let me know.
> > >=20
> > <snip>
> > 	We do this all the time with FreeS/WAN.  In fact, we are developing a
> > GUI front end to managed combined firewall and VPN security for large,
> > complex implementations.  You can find training slide shows on using
> > iptables, FreeS/WAN, iproute2 and DHCP at http://iscs.sourceforge.net -
> > Good luck
> > --=20
> > John A. Sullivan III
> > Chief Technology Officer
> > Nexus Management
> > +1 207-985-7880
> > john.sullivan@nexusmgmt.com
> > ---
> > If you are interested in helping to develop a GPL enterprise class
> > VPN/Firewall/Security device management console, please visit
> > http://iscs.sourceforge.net=20
> >=20
> >=20
>=20
>=20
> --=20
> Michael Gale
> Network Administrator
> Utilitran Corporation

	Mike
--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBP+HSuOHJS0bfHdRxAQHYfQP+LXT7W3w1bN06+dWhHyxnbVnTFfvzRV9u
9UOSW4TOm+nmG5ntyNe8XV1U3VZHSumMYYOVrq35DwBZgzUHBl8DsQ+e+fIU1yT3
dPgYanJau/LujyjTGtUqLD7+o3IK7j7SzHexbUE02Za8VMR+fv9/SXpEM6emoXR1
yS2AhJ8aey8=
=SFl1
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

