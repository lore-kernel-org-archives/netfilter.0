From: Alexander Samad <alex@samad.com.au>
Subject: Re: FORWARD RULE -- please help
Date: Tue, 9 Mar 2004 20:10:51 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040309091051.GH24806@samad.com.au>
References: <20040309075404.92394.qmail@web13206.mail.yahoo.com> <200403090846.46608.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0NB0lE7sNnW8+0qW"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403090846.46608.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org


--0NB0lE7sNnW8+0qW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2004 at 08:46:46AM +0000, Antony Stone wrote:
> On Tuesday 09 March 2004 7:54 am, Nilesh wrote:
>=20
> > 203.129.224.149 is my firewall machine running
> > IPTABLES and 192.168.0.22 is my local machine on 2090
> > port service is running
> >
> > 202.129.227.3 is his firewall IP and 192.168.1.25 is
> > his local machine where on 2090 port services is
> > running
> >
> > I want to communicate this both internal
> > machines(192.168.0.22 and 192.168.1.25) through
> > firewall
>=20
> If you want his 192.168.1.0/24 network to be able to communicate with you=
r=20
> 192.168.0.0/24 network then you should investigate IP in IP tunnelling /=
=20
> encapsulation (see the Linux Advanced Routing Guide at http://lartc.org f=
or a=20
> simple guide to how to do this), or else set up a VPN (eg : FreeS/WAN, or=
 the=20
> IPsec implementation built into the 2.6 kernel).

Or he could use MASQ on both sides with 2 dnat rules

on 203.129.224.149

iptables -t nat -I postrouting -o IF_INTERNET -s 192.168.0.22 -p tcp
--dport 2090 -j MASQUERADE

iptables -t nat -I prerouting -i IF_INTERNET -d 203.129.224.149 -s
202.129.227.3 -p tcp --dport 2090 -j DNAT 192.168.0.22=20

iptabes -t filter -I INPUT -i IF_INTERNET -d 203.129.224.149 -p tcp
--dport 2090

and then the reverse on the other side.  Presumed tcp and could use SNAT
instead of MASQ


>=20
> Regards,
>=20
> Antony.
>=20
> --=20
> If at first you don't succeed, destroy all the evidence that you tried.
>=20
>                                                      Please reply to the =
list;
>                                                            please don't C=
C me.
>=20
>=20
>=20

--0NB0lE7sNnW8+0qW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATYobkZz88chpJ2MRAi8VAKC78Pr7FR6X03I8EFaEkxCy8Zyi7ACgo7Qo
H3I/nPaBiZkM1slfG92KHN4=
=eHP6
-----END PGP SIGNATURE-----

--0NB0lE7sNnW8+0qW--

