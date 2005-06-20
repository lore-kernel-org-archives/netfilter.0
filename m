From: Harald Welte <laforge@netfilter.org>
Subject: Re: iptables PPTP tunneling
Date: Tue, 21 Jun 2005 00:35:26 +0200
Message-ID: <20050620223526.GC23109@obroa-skai.de.gnumonks.org>
References: <20050620185220.GA9417@mwg.dp.ua>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050620185220.GA9417@mwg.dp.ua>
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
To: Wladimir Mutel <mwg@mwg.dp.ua>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2005 at 09:52:20PM +0300, Wladimir Mutel wrote:
> 	In our private LAN we have Windows server that initiates PPTP
> 	connection with outside VPN server. tcp/1723 traffic is always
> 	masqueraded very well, but when it comes to GRE, the ruleset
> 	often loses outgoing GRE packet (does it translate it or not, I
> 	don't know, but it does not create anything
> 	related/established - when outside server tries to send GRE
> 	packet first, our Linux router responds with ICMP: protocol 47
> 	unreachable). But this behaviour sometimes changes to desirable
> 	one: in some way, GRE connection is established and
> 	translated/masqueraded very well for the rest of time until
> 	Windows reconnect or Linux reboot/ruleset reload.

yes, that is totally conforming to what your ruleset looks like.

if the first packet comes from your internal network, then a nat mapping
is set up, and incoming response packets will  be NATed accordingly.

if the first packet comes from your remote pptp server, then your
ruleset treats it like an incoming connection to a not-opened port and
therefore sends it up the local network stack.  Since no program has
upened a socket for the gre protocol, the NAT machine responds with
protocol unreachable.

If you want to make it work, you have two options

1) to configure a DNAT rule for GRE,
DNAT'ing all incoming GRE packets from the server to your internal PPTP
client.

2) to configure your NAT box to silently DROP incoming GRE packets with
state "NEW".  This way you basically ignore the first packet(s) from
server->client and wait for the client->server packet to set up the
connection.


> 	As I know, you work on PPTP masquerading module for iptables and
> 	kernel 2.6. Could you please inform when it will be possible to
> 	use it with kernel 2.6.12, or how could we masquerade (single)
> 	PPTP connection with current 2.6.12 iptables feature set and get
> 	more predictable behaviour from it than that random one I just
> 	described.

the scheduled date is no later than June 30.  But you don't need a
conntrack/nat helper if you only run one pptp session, just configure
your nat correctly and it will work.

>=20
> 	Thank you in advance for your reply.
--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCt0SuXaXGVTD0i/8RAlmQAJ9/iKIs8q+aRKLkfG80IqJnj42sEgCfas10
C5e0+V1bJfrHHGuduQIAMSg=
=6D/2
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--

