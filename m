From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Sub-Net-Router does not more forward
Date: Sat, 21 May 2005 19:38:59 +0200
Message-ID: <20050521173859.GA31526@freenet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello *,

I am Running Debian GNU/Linux 3.0 with Kernel 2.4.27 and I have
following Network since 6 years:

----8<----------------------------------------------------------------
        Internet Access with dynamic IP Address
                           |
                           |
                  +--------+--------+
                  | Netgear  DM602A |
                  +--------+--------+
                           |IP 192.168.0.1
                           |NM 255.255.255.240
                           |NW 192.168.0.0
                           |BC 192.168.0.15
                           |
                           |
                           |IP 192.168.0.14
                           |NM 255.255.255.240
                           |NW 192.168.0.0
                           |BC 192.168.0.15
                           |GW 192.168.0.1
+--------------------------+-------------------------------+
|                         eth0                             |
|                                                          |
|      SUB-Net-Router without NAT or IP-Masquertading      |
| IP-Forwarding is activated and I have NO iptables rules. |
|                                                          |
|          eth1        eth2        eth3        eth4        |
+-----------+-----------+-----------+-----------+----------+
IP 192.168. |0.193      |0.65       |0.33       |0.129
NM 255.255. |255.192    |255.192    |255.224    |255.192
NW 192.168. |0.0        |0.64       |0.32       |0.128
BC 192.168. |0.15       |0.127      |0.63       |0.192
            |           |           |           |
            |           |           |           |
          public      private     secure      cyber
          network     network     network     network    =20
----8<----------------------------------------------------------------

Now I have following problem:

If I am on the Sub-Net-Router I can reach the Internet and all
subnets without any problems. I can reach the Sub-Net-Router from
the Internet via SSH.

'ping', 'wget' or 'ssh' between the subnets is working too.

But if I am in one of the Sub-Nets, I can not get anything from the
Internet.

I have installed tcpdump and monitored eth2 and eth0 on the "Sub-Net-
Router" and gotten following:

I am in the "private network" on my Workststion <michelle1> which
has the IP 192.168.0.71 and the gateway 192.168.0.65.  Now I 'ping
-c 2 www.debian.org' and can see, the DNS-Request is coming into eth2
and goes to eth0 out.  The traffic LED on my Netgear DM602A is now
blinking and I can see, the package is coming back into eth0.

But now, my "Sub-Net-Router" stops forwarding the package back via
eth2 to my Workststion <michelle1>...

What I am missing here ?

The bad thing is, the router was working for more then 6 years (Linux
2.0.38 and now 2.4.27)

Any Ideas ?

Greetings
Michelle

--=20
Linux-User #280138 with the Linux Counter, http://counter.li.org/
Michelle Konzack   Apt. 917                  ICQ #328449886
                   50, rue de Soultz         MSM LinuxMichi
0033/3/88452356    67100 Strasbourg/France   IRC #Debian (irc.icq.com)

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCj3IzC0FPBMSS+BIRAtDvAJ4onarz07Zp0WRmg2MakS4XgOBqWwCgvv0K
4DfWNMoACj/ph5a/J3XMhOo=
=D8w0
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

