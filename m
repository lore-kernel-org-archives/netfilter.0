From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: Try to NAT a RTP stream
Date: Wed, 30 Apr 2003 07:28:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430142858.GA6702@home.tig-grr.com>
References: <200304270824.31892.lists@ohlmeier.de> <20030430032642.GA4762@home.tig-grr.com> <001a01c30f09$5b4ad8e0$6401a8c0@int.thorcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001a01c30f09$5b4ad8e0$6401a8c0@int.thorcom.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Michael J. Tubby B.Sc. (Hons) G8TIC" <mike.tubby@thorcom.co.uk>
Cc: Nils Ohlmeier <lists@ohlmeier.de>, netfilter@lists.netfilter.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm sorry, but your message does not quite make sense to me.  Keep in mind
that RTP and RTSP are two very different protocols.  RTSP is a TCP based
protocol that looks quite similar to HTTP.  It is used to control the media
data streams.  It has methods like setup, play, pause, teardown.  RTP is a
UDP based protocol that is used to communicate media (eg. audio and video)
packets.  It's unfortunate that they have such similar abbreviations.

If your application is using SCCP to setup the RTP data stream, then yes, it
would appear that ip_conntrack_sccp and ip_nat_sccp modules are required.

On Wed, Apr 30, 2003 at 12:12:15PM +0100, Michael J. Tubby B.Sc. (Hons) G8T=
IC wrote:
> Tom,
>=20
> I also want to get NAT of RTP/RTSP working for Cisco (Selsius)
> Voice over IP (VOIP), ie. a Cisco/Selsius phone on the inside NAT'ted
> out to a Cisco Call Manager (CCM).
>=20
> The phone uses a TCP connection on port 2000 for Skinny Client
> Control Protocol (SCCP) to the CCM (SCCP is beleived to be based
> on an ASN1 derrived version of ISDN Q.931 signalling) to setup/
> clear down calls and RTS/RTSP traffic for the duration of the actual
> call.
>=20
> Again, the problem is that the outgoing RTP/RTSP (which is really UDP
> with a particular ToS value - 0xB8 if I remember my tcpdumps correctly)
> works fine with current NAT but the inbound replies which are on an
> unrelated port number fail.
>=20
> I suspect that this means that a contrack_sccp module would be required
> to watch the SCCP/ASN1 on port 2000 and prime in the inbound NAT
> of the subsequent RTS/RTSP ?
>=20
> Mike
>=20
>=20
> ----- Original Message -----
> From: "Tom Marshall" <tommy@home.tig-grr.com>
> To: "Nils Ohlmeier" <lists@ohlmeier.de>
> Cc: <netfilter@lists.netfilter.org>
> Sent: Wednesday, April 30, 2003 4:26 AM
> Subject: Re: Try to NAT a RTP stream
>=20
> What application are you using to setup the RTP stream?  If you are using
> RTSP, I posted an RTSP NAT module for kernel 2.4.21-preX a couple of weeks
> ago that may solve your problem.
>=20
> On Sun, Apr 27, 2003 at 08:24:31AM +0200, Nils Ohlmeier wrote:
> > Hello,
> >
> > i try to NAT RTP streams with my own application (i do not use iptables=
 to
> > insert the rules -> should i go to netfilter-devel?).
> >
> > Scenario:
> > 192.168.0.114 <-----> 192.168.0.2
> >                       Netfilter NAT
> >                      217.224.223.167 <--------------> 195.37.77.110
> >
> > The result is that packets go from private to public but not vice versa.
> And
> > the ruleset looks like this (empty chains omitted, ruleset is only for
> > debuging, masquerade rule is for keeping my existing connections):
> >
> > Chain FORWARD (policy ACCEPT 237 packets, 47356 bytes)
> >  pkts bytes target     prot opt in     out     source
> > destination
> >     0     0 ACCEPT     udp  --  *      *       195.37.77.110
> > 192.168.0.114      udp spts:18554:18555 dpts:8766:8767
> >   399 79648 ACCEPT     udp  --  *      *       192.168.0.114
> > 195.37.77.110      udp spts:8766:8767 dpts:18554:18555
> >
> > Chain PREROUTING (policy ACCEPT 3481 packets, 552K bytes)
> >  pkts bytes target     prot opt in     out     source
> > destination
> >     0     0 DNAT       udp  --  *      *       195.37.77.110
> > 217.224.223.167    udp spts:18554:18555 dpts:32790:32791
> > to:192.168.0.114:8766-8767
> >
> > Chain POSTROUTING (policy ACCEPT 660 packets, 52480 bytes)
> >  pkts bytes target     prot opt in     out     source
> > destination
> >     0     0 SNAT       udp  --  *      *       192.168.0.114
> > 195.37.77.110      udp spts:8766:8767 dpts:18554:18555
> > to:217.224.223.167:32790-32791
> >     9  1835 MASQUERADE  all  --  *      *       192.168.0.0/23
> 0.0.0.0/0
> >
> > What i do not understand is why the packets from internal hit the rule =
in
> > FORWARD but do not hit the same rule in POSTROUTING.
> > The second strange thing is that packets come in on the external interf=
ace
> > (observed with ngrep) but to not hit the PREROUTING rule.
> > I fear i missed something obvious :-(
> >
> > Any help/ideas appreciated.
> >
> > Greetings
> >   Nils Ohlmeier

--=20
Guilty until proven innocent: abusing the legal system in the name of the
war on terror.  http://www.wired.com/news/conflict/0,2100,58326,00.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj6v3aoACgkQFMm9uvwPXW45DwCgl0S2CNrh3RbYJ309kfQn2Qi+
rIYAnApe6h+ZGY9tEiFDxPRMLk/M5ALQ
=1WOe
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

