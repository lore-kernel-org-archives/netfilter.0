From: Sheldon Hearn <sheldonh@clue.co.za>
Subject: SNAT for two interfaces not working
Date: Wed, 28 Sep 2005 15:47:23 +0200
Message-ID: <200509281547.23683@axl.clue.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1407823.2x4iYB8Vbr";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

--nextPart1407823.2x4iYB8Vbr
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Hi folks,

I approach you in desperation, after more than 8 hours of hacking and 4=20
hours of Googling.

I have a Netfilter firewall (2.6.12-gentoo-r9 which is Linux-2.6.12.6=20
with some Gentoo patches) that protects a number of privately addressed=20
hosts.  It has a leased line, with a configuration that works perfectly=20
and now I am trying to offload HTTP traffic over a new ADSL line.

My approach is to fwmark HTTP traffic, and route that via the ADSL=20
router using iproute2.  It's "almost" working.  The initial SYN leaves=20
(correctly SNAT'd) and the SYN+ACK arrives, but the packet goes missing=20
at this point.  It doesn't hit INPUT or FORWARD.

I'm doing SNAT for both the leased line and the ADSL line.  SNAT is=20
working fine for the leased line, and I'm worried that there's a=20
problem with using SNAT (or MASQUERADE, which also doesn't work) on=20
multiple interfaces.  The Google results don't look good.  The only=20
thread I found with a firm conclusion was "gave up, using OpenBSD PF". =20
I've just migrated this box _from_ FreeBSD so I can use Netfilter, so I=20
_really_ don't want to go there.

Here's the layout:

eth0: 10.0.1.1/24				[LAN]
eth1: 172.16.1.2/24	(peer 172.16.1.1)	[leased line]
eth2: 172.16.2.2/24	(peer 172.16.2.1)	[ADSL]

Both peers NAT for us.  The default gateway is 172.16.1.1, which means=20
that we route over the leased line by default.

I started out using FireHOL, but have trimmed down my firewall script to=20
the bare essentials to maximise my chance of getting help on this list:

iptables -t mangle -A PREROUTING -i eth0 \
    -p tcp -m multiport --dports 80,443,8080 -j MARK --set-mark 2
iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source 172.16.2.2
iptables -t nat -A POSTROUTING -o eth1 \
    -j SNAT --to-source 172.16.1.2
iptables -t filter -A FORWARD -j ACCEPT
iptables -t filter -A INPUT -j ACCEPT
iptables -t filter -A OUTPUT -j ACCEPT
ip rule add prio 100 fwmark 2 table 2
ip route add table 2 default via 172.16.2.1 dev eth2
ip route add default via 196.15.213.254 dev eth1
ip route 10.0.1.0/24 dev eth0

So, I hop onto 10.0.1.4 and try to establish an outbound HTTP=20
connection.  I sniff eth2 on the firewall and see this:

13:40:37.936255 IP 172.16.2.2.62206 > 209.47.140.1.80: S=20
838943189:838943189(0) win 65535 <mss 1460,nop,nop,sackOK,nop,wscale=20
1,nop,nop,timestamp 127711 0>

13:40:37.976520 IP 209.47.140.1.80 > 172.16.2.2.62206: S=20
2257786260:2257786260(0) ack 838943190 win 5840 <mss=20
1432,nop,nop,sackOK>

Obviously they keep on trying.  On eth0, I see this:

13:40:37.936232 IP 10.0.1.4.62206 > 209.47.140.1.80: S=20
838943189:838943189(0) win 65535 <mss 1460,nop,nop,sackOK,nop,wscale=20
1,nop,nop,timestamp 127711 0>

13:40:40.931238 IP 10.0.1.4.62206 > 209.47.140.1.80: S=20
838943189:838943189(0) win 65535 <mss 1460,nop,nop,sackOK,nop,wscale=20
1,nop,nop,timestamp 128011 0>

So basically, the SYN+ACK is arriving back at the firewall, but the=20
firewall then ignores it.  If I add logging, I see the packet hit=20
PREROUTING, but that's it.

I've implemented HTTP-over-ADSL offload on FreeBSD IPFW+Squid and Linux=20
IPFW, and thought I'd have absolutely no problem with Linux Netfilter.

Any help (even "it's known to not work, give up now" or "works for me,=20
keep trying") would be GREATLY appreciated.

Thanks,
Sheldon.

--nextPart1407823.2x4iYB8Vbr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBDOp7rpGJX8XSgas0RAtmUAKCK4YHUo+Fyo0a9E65RW/5AaBdw3gCfcoWM
EH8mo0+q/10DL2HT48UdTwU=
=YyOY
-----END PGP SIGNATURE-----

--nextPart1407823.2x4iYB8Vbr--


