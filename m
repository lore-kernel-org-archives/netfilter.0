From: Athan <netfilter@miggy.org>
Subject: Re: DNAT/MASQ Precedence
Date: Fri, 31 Jan 2003 10:14:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030131101420.GU11221@miggy.org>
References: <200301301931.41645.katriel@traum.org.il> <20030130193408.GR11221@miggy.org> <200301310958.38656.katriel@traum.org.il>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yPSgZSQ6mfPWgZ9n"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200301310958.38656.katriel@traum.org.il>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Katriel Traum <katriel@traum.org.il>
Cc: netfilter@lists.netfilter.org


--yPSgZSQ6mfPWgZ9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2003 at 09:58:35AM +0000, Katriel Traum wrote:
> On Thursday 30 January 2003 19:34, Athan wrote:
> > On Thu, Jan 30, 2003 at 07:31:38PM +0000, Katriel Traum wrote:
> > > I want to redirect _all_ traffic into the DMZ (is that even possible?)
> > > and in the same time MASQ the LAN. The question is will they collide?=
 If
> > > I use a ruleset such as:
> > > iptables -A PREROUTING -i $INET_IF -j DNAT --to-destination $DMZ_IP
> > > iptables -A POSTROUTING -o $INET_IF -j MASQUERADE
> > > (yes, there's only one computer in the DMZ)
> > >
> > > Will I get return traffic into my lan? won't it be DNATed into the DM=
Z?
> >
> >   You need at least one public IP that is *NOT* in the DMZ.  Then change
> > the DMZ rule to exclude on this:
> >
> > iptables -A PREROUTING -i $INET_IF -d ! <not-DMZ IP> -j DNAT
> > --to-destination $DMZ_IP
>=20
> Well, the problem is I have 1 public IP via a cable modem.
> So I ask again, if I DNAT everything into the DMZ lan, and try to MASQ my=
=20
> private lan, will I even get return traffic?

  That would be a problem yes, as the PREROUTING gets done before the
POSTROUTING and will change the packets prior to the routing decision.
You may be able to get away with reserving a range of ports to be used
with SNAT though as the --to-source argument can take a range of port
numbers.

	iptables -A PREROUTING -i $INET_IF -p tcp --dport ! port1:port2 -j DNAT --=
to-destination $IP=20

	iptables -A POSTROUTING -o $INET_IF -s <LAN network> -j SNAT --to-source $=
IP:port1-port2

Note that the DNAT rule DOES now mention protocol explicitly, it has to
for --dport to be valid.  Duplicate the line with "-p udp" if you also
need UDP to be working.
  For non UDP/TCP (i.e. ICMP) to work correctly you have to hope a few
rules with the appropriate -m state will do the right thing.  AIUI they
should as how they treat things should be based on the connection
tracking table.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--yPSgZSQ6mfPWgZ9n
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj46THwACgkQzbc+I5XfxKe4wACgnQaV/ceVZZpNN2wXzTtLSQwp
oTkAn2sovM78eUXxtbliAN1Pt9I5i2BV
=f9iF
-----END PGP SIGNATURE-----

--yPSgZSQ6mfPWgZ9n--

