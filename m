From: Stephen Touset <stephen@touset.org>
Subject: Re: Problems w/ Linux firewall and Windows VPN
Date: Thu, 01 Jan 2004 22:21:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073013684.11201.46.camel@localhost>
References: <1073007380.11132.3.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-FedQc06K/ZpLJygIfVr0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073007380.11132.3.camel@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-FedQc06K/ZpLJygIfVr0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Seeing as I forgot to attach the packet output, they can be found at https:=
//touset.org/packets.ext and https://touset.org/packets.int.

On Thu, 2004-01-01 at 20:36, Stephen Touset wrote:
> I've recently set up a firewall in our house, running Debian. It's using
> iptables to do packet filtering. When I installed it, my mother started
> having problems connecting through VPN to her company (MAPICS). The
> connection starts fine, but after 5-10 minutes, it disconnects. I do not
> have this problem connecting to other VPN servers (such as to my
> employer) using her computer, so I know this is specific to their
> system.=20
>=20
> Previously, we were using a Linksys router, and it worked fine.
>=20
> Now, my first idea was that the firewall was blocking a certain type of
> packet, thus causing the connection to be terminated. However, running
> tcpdump on the internal and external interfaces show that everything is
> passing through nicely.
>=20
> Of note is that every time, right before the disconnect, their VPN
> server sends a PPTP Echo-Request to her client. The response from her
> client is a TCP RST, and the connection is terminated. I have verified
> this repeatedly, and this is the case every time. However, there are
> dozens of other times during the connection where a PPTP Echo-Request is
> sent from their server, and her client responds with the correct PPTP
> Echo-Reply, and they respond with a TCP ACK on that reply. In other
> words, the echo handshake goes back and forth several times throughout
> the connection, correctly, and at one of them her client decides not to
> reply, and simply RST the connection. I've examined the packets
> containing the Request from both a completed handshake and from the
> terminated one, and they both appear to be identical, excluding sequence
> numbers and acknowledgment numbers.
>=20
> I'm attaching packet captures from ethereal in the libpcap format--one
> from the perspective of the internal interface, and one from the
> external. These are pre-filtered, so they contain *all* network traffic
> at the time, so I'm positive that nothing that could identify the
> problem is left out. The VPN server is 208.217.85.63, and her client is
> 192.168.1.102. It's over a PPTP connection, with a Windows-based VPN
> server--I'm guessing Windows 2000 Server.
>=20
> If anyone could help me discover what the problem is, or point me in the
> direction of someone who could, I would be *extremely* grateful.
--=20
Stephen Touset <stephen@touset.org>

--=-FedQc06K/ZpLJygIfVr0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQA/9OO0+fMdKwQeHvYRAvUZAJ94Nm4Wm2jOek1vxn7DoH+qw4mzGgCgmvc9
c8xPNK4NKLIKIxXhGmcDKjs=
=7fdK
-----END PGP SIGNATURE-----

--=-FedQc06K/ZpLJygIfVr0--


