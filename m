From: Carl Baldwin <carl@ecbaldwin.net>
Subject: Problem with Transparent Proxy and 2.6 IPSec
Date: Tue, 16 Mar 2004 20:37:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040317033707.GA9494@cube.ecbaldwin.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I am new to this list but not new to iptables.  I have used iptables for
several years and have had much success with it.  I want to present the
problem that I have and request comments on how I might resolve it.

I have been using a transparent proxy with squid and smtp for about a
year.  It has worked fine and I've been very happy with it.

The problem came when I dumped freeswan and gave ipsec in linux 2.6.4 a
try.  This ipsec has been, for the most part, more reliable and easier
to understand for me.

I first ran into a problem that has already been discussed on this list
(or maybe netfilter-devel?).  This problem is with transport mode in
ipsec.  So, I switched to tunnel mode.  For more on that problem do a
search on the list archives.

In tunnel mode, as you may know from previous postings, iptables sees
each packet twice.  First, as an esp packet.  Second, as the
de-encapsulated version of the packet.  This is good, I think, although
I would like a way to know that a packet was authenticated or encrypted
prior to its de-encapsulation.  However, that is the subject of a future
posting.

Anyway, most rules work for me.  I can SNAT these packets out onto the
global network, all my INPUT rules seem to work and things are generally
happy.  However, my transparent proxies do not work.  Does anyone know
why?

SOME INTERESTING OBSERVATIONS

Here is something that I observed running tcpdump on the two hosts at
the end of the tunnel.  This is part of the dump when trying to telnet
=66rom cube to host mail --- names changed to protect the innocent --- on
port 25.  The nat box is called nat and the source machine is called
cube.  Here is the dump on the nat box side:

18:44:43.825043 cube > nat: ESP(spi=3D0x00000201,seq=3D0x532b) (DF) [tos 0x=
10]
18:44:43.825043 cube.39869 > mail.smtp: S 1307041850:1307041850(0) win 5840=
 <mss 1460,sackOK,timestamp 118540183 0,nop,wscale 0> (DF) [tos 0x10]
18:44:43.825292 mail > cube: ESP(spi=3D0x00000301,seq=3D0x54ca) (DF)
18:44:46.824219 cube > nat: ESP(spi=3D0x00000201,seq=3D0x532f) (DF) [tos 0x=
10]
18:44:46.824219 cube.39869 > mail.smtp: S 1307041850:1307041850(0) win 5840=
 <mss 1460,sackOK,timestamp 118543184 0,nop,wscale 0> (DF) [tos 0x10]

Here, I see the request to mail.smtp encapsulated in esp and then
de-encapsulated.  Then I see a mail > cube esp packet.  Then another
cube > nat packet.

On cube I see the following.

18:44:43.823985 mail > cube.39869: ESP(spi=3D0x00000301,seq=3D0xc06c) (DF)
18:44:43.823985 nat.smtp > cube.39869: S 4174872998:4174872998(0) ack 13070=
41851 win 5792 <mss 1460,sackOK,timestamp 186145512 118540183,nop,wscale 0>=
 (DF)
18:44:46.823183 mail > cube.39869: ESP(spi=3D0x00000301,seq=3D0xc06d) (DF)
18:44:46.823183 nat.smtp > cube.39869: S 4174872998:4174872998(0) ack 13070=
41851 win 5792 <mss 1460,sackOK,timestamp 186148512 118540183,nop,wscale 0>=
 (DF)

It looks to me like a response is being sent.  So, I'm not sure where
things might be breaking down.

MISC INFO ABOUT MY SETUP

I run a debian testing machine as my NAT and proxy.  Both the proxy and the
firewall are on the same machine because this is my home machine and I'm ju=
st
playing around with this stuff at the moment.  My other linux machines
communicate with this box through an ipsec tunnel.  Network analysis with
tcpdump comfirms this.  Currently, I have one windows machine that is allow=
ed
to talk to this linux machine without ipsec.  This machine can still use the
transparent proxies without a problem.

# This shows the version of iptables that I am running.
nat:~> dpkg -l iptables
Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err: upperc=
ase=3Dbad)
||/ Name       Version   Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ii  iptables   1.2.9-5   Linux kernel 2.4+ iptables administration tools

# Info on my kernel.  (I have tried all of the 2.6.x stable releases)
nat:~> uname -a
Linux nat 2.6.4 #1 Sun Mar 14 14:54:23 MST 2004 i686 GNU/Linux

# Here are the relavant iptables rules (iptables-save format.)
#   NOTE eth0 goes to the global internet, eth1 to my local net.

# Generated by iptables-save v1.2.9 on Tue Mar 16 10:51:20 2004
*nat
:PREROUTING ACCEPT [88:22304]
:POSTROUTING ACCEPT [98:14092]
:OUTPUT ACCEPT [139:17757]
-A PREROUTING -i eth1 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
-A PREROUTING -i eth1 -p tcp -m tcp --dport 25 -j REDIRECT --to-ports 25
-A POSTROUTING -o eth0 -j SNAT --to-source 192.168.1.2
COMMIT

# Generated by iptables-save v1.2.9 on Tue Mar 16 10:51:20 2004
*filter
:INPUT DROP [72:21276]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [9217:2302627]
-A INPUT -p ah -j ACCEPT
-A INPUT -p esp -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -i eth1 -p tcp -m tcp --dport 8080 -j ACCEPT
-A FORWARD -i eth1 -o eth0 -j ACCEPT
-A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT

OTHER INTERESTING ASIDES

Just as an aside, most of you are used to seeing this done with squid
but some may not be used to seeing it done with smtp.  It works great
and I love it.  Only my border machine needs to know about special rules
for routing certain mail (like routing mail to aol for instance).  My
desktop and laptop think they are delivering MX direct.

Thanks for taking the time to read this.
Carl Baldwin

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAV8fjOTkbhe0mu4QRAoewAKDMYQeOpDVpsPioMMfvUVCXRUdfnQCgpySk
3P1ugswteMJYTDgzZaZx6nc=
=GbVD
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

