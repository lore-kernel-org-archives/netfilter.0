From: "Hubris_1" <Hubris_1@netzero.net>
Subject: Stateful firewalling via IPTABLES fails to track FTP passive connections?
Date: Sun, 6 Oct 2002 03:10:12 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c26d18$2e24c6c0$0500000a@widgets>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C26CE5.E25C3700"
Return-path: <netfilter-admin@lists.netfilter.org>
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

This is a multi-part message in MIME format.

------=_NextPart_000_0007_01C26CE5.E25C3700
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All:

Hi and thanks in advance for any help you can provide.

I'm setting up a basic IPTables filter (IPTables v. 1.2.5 running on a =
RedHat Linux 7.3 machine).  Configuring the IPTABLES is pretty =
straightforward, except that IPTABLES does not detect the port change =
that occurs just after the server accepts the clients PASV request.  =
I've verified this is where the problem occurs via sniffer.  If I permit =
TCP to high unnumbered ports through the firewall (1024-65535), it works =
just fine.  Documentation I've read for IPTables implies that it should =
work for passive and for active ftp.

My firewall setup is listed below (its a work in progress for a test lab =
- thats why it only accepts the 10.x.x.x IPs).  The FTP server is tied =
to address 10.0.0.254, and is currently designed to accept connections =
from eth0.  Note the policy on chain OUTPUT is set to allow all packets, =
and FORWARD is set to statefully allow all traffic from eth0 to eth1 so =
I have not included them.  Line 30 is the config I've had to add to make =
passive ftp to the server work - but I would expect lines 13 and 11 to =
take care of it without having to add the final line.

So, my question boils down to this - does IPTables inspect the PASV =
request and reply to open the correct FTP data port if using stateful =
inspection?  Or do you essentially need to open all high-level ports to =
get passive FTP working?

I can provide the sniffs of what's occurring to any interested parties, =
but they clearly indicate that the FTP data channel (going to TCP port =
1645 as I recall) is being blocked by the INPUT filter - the client =
tries several SYNs on this packet and never gets a SYN/ACK back.  I =
should note that this occurs after the FTP client has authenticated and =
directly after he performs an "ls" - it hangs at this point and =
eventually drops.


Chain INPUT (policy DROP 33404 packets, 2153K bytes)

num pkts bytes target prot opt in out source destination=20

1 0 0 DROP all -- eth0 * 0.0.0.0/0 127.0.0.0/8=20

2 0 0 DROP all -- eth1 * 0.0.0.0/0 127.0.0.0/8=20

3 0 0 DROP all -- eth2 * 0.0.0.0/0 127.0.0.0/8=20

4 18 10368 ACCEPT udp -- !eth2 * 0.0.0.0/0 255.255.255.255 udp spt:68 =
dpt:67=20

5 4 2304 ACCEPT udp -- eth0 * 0.0.0.0/0 10.0.0.254 udp spt:68 dpt:67=20

6 0 0 ACCEPT udp -- eth1 * 0.0.0.0/0 10.0.1.254 udp spt:68 dpt:67=20

7 0 0 DROP all -- eth1 * !10.0.1.0/24 0.0.0.0/0=20

8 63 4473 DROP all -- eth0 * !10.0.0.0/24 0.0.0.0/0=20

9 0 0 DROP all -- eth2 * !10.0.2.0/24 0.0.0.0/0=20

10 1996 166K ACCEPT all -- * * 127.0.0.0/8 127.0.0.0/8=20

11 1802K 2418M ACCEPT all -- * * 0.0.0.0/0 0.0.0.0/0 state =
RELATED,ESTABLISHED=20

12 56 3308 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.254 state NEW tcp =
dpt:22=20

13 48 2758 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.254 state NEW tcp =
dpt:21=20

14 0 0 ACCEPT icmp -- eth2 * 0.0.0.0/0 10.0.2.254 icmp type 3 code 4=20

15 0 0 ACCEPT icmp -- eth1 * 0.0.0.0/0 10.0.1.254 icmp type 3 code 4=20

16 0 0 ACCEPT icmp -- eth0 * 0.0.0.0/0 10.0.0.254 icmp type 3 code 4=20

17 0 0 ACCEPT icmp -- eth0 * 0.0.0.0/0 10.0.0.254 icmp type 0=20

18 0 0 ACCEPT icmp -- eth1 * 0.0.0.0/0 10.0.1.254 icmp type 0=20

19 0 0 ACCEPT icmp -- eth2 * 0.0.0.0/0 10.0.2.254 icmp type 0=20

20 0 0 ACCEPT icmp -- eth2 * 0.0.0.0/0 10.0.2.254 icmp type 8=20

21 4 280 ACCEPT icmp -- eth1 * 0.0.0.0/0 10.0.1.254 icmp type 8=20

22 27 2004 ACCEPT icmp -- eth0 * 0.0.0.0/0 10.0.0.254 icmp type 8=20

23 7297 466K ACCEPT udp -- !eth2 * 0.0.0.0/0 10.0.0.254 udp dpt:53=20

24 0 0 ACCEPT udp -- eth0 * 0.0.0.0/0 10.0.0.254 udp dpts:137:139=20

25 0 0 ACCEPT udp -- eth0 * 0.0.0.0/0 255.255.255.255 udp dpts:137:139=20

26 0 0 ACCEPT tcp -- eth0 * 0.0.0.0/0 255.255.255.255 tcp dpts:137:139=20

27 19 1020 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.254 tcp dpts:137:139=20

28 0 0 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.255 tcp dpts:137:139=20

29 13375 2387K ACCEPT udp -- eth0 * 0.0.0.0/0 10.0.0.255 udp =
dpts:137:139=20

30 2260 136K ACCEPT tcp -- * * 0.0.0.0/0 10.0.0.254 tcp dpts:1025:65535=20



Chris

------=_NextPart_000_0007_01C26CE5.E25C3700
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4919.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>All:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hi and thanks in advance for any help =
you can=20
provide.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm setting up a basic IPTables filter =
(IPTables v.=20
1.2.5 running on a RedHat Linux 7.3 machine).&nbsp; Configuring the =
IPTABLES is=20
pretty straightforward, except that IPTABLES does not detect the port =
change=20
that occurs just after the server accepts the clients PASV =
request.&nbsp; I've=20
verified this is where the problem occurs via sniffer.&nbsp; If I permit =
TCP to=20
high unnumbered ports through the firewall (1024-65535), it works just=20
fine.&nbsp; Documentation I've read for IPTables implies that it should =
work for=20
passive and for active ftp.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My firewall setup is listed below (its =
a work in=20
progress for a test lab - thats why it only accepts the 10.x.x.x =
IPs).&nbsp; The=20
FTP server&nbsp;is tied to&nbsp;address 10.0.0.254, and is currently =
designed to=20
accept connections from eth0.&nbsp; Note the policy on chain OUTPUT is =
set to=20
allow all packets, and FORWARD is set to statefully allow all traffic =
from eth0=20
to eth1 so I have not included them.&nbsp; Line 30 is the config I've =
had to add=20
to make passive ftp to the server work - but I would expect lines 13 and =
11 to=20
take care of it without having to add the final line.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So, my question boils down to this - =
does IPTables=20
inspect the PASV request and reply to open the correct FTP data port if =
using=20
stateful inspection?&nbsp; Or do you essentially need to open all =
high-level=20
ports to get passive FTP working?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I can provide the sniffs of what's =
occurring to any=20
interested parties, but they clearly indicate that the FTP data channel =
(going=20
to TCP port 1645 as I recall) is being blocked by the&nbsp;INPUT =
filter&nbsp;-=20
the client&nbsp;tries several&nbsp;SYNs on this packet and never gets a =
SYN/ACK=20
back.&nbsp; I should note that this occurs after the FTP client has=20
authenticated and directly after he performs an "ls" - it hangs at this =
point=20
and eventually drops.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>
<P>Chain INPUT (policy DROP 33404 packets, 2153K bytes)</P>
<P>num pkts bytes target prot opt in out source destination </P>
<P>1 0 0 DROP all -- eth0 * 0.0.0.0/0 127.0.0.0/8 </P>
<P>2 0 0 DROP all -- eth1 * 0.0.0.0/0 127.0.0.0/8 </P>
<P>3 0 0 DROP all -- eth2 * 0.0.0.0/0 127.0.0.0/8 </P>
<P>4 18 10368 ACCEPT udp -- !eth2 * 0.0.0.0/0 255.255.255.255 udp spt:68 =
dpt:67=20
</P>
<P>5 4 2304 ACCEPT udp -- eth0 * 0.0.0.0/0 10.0.0.254 udp spt:68 dpt:67 =
</P>
<P>6 0 0 ACCEPT udp -- eth1 * 0.0.0.0/0 10.0.1.254 udp spt:68 dpt:67 =
</P>
<P>7 0 0 DROP all -- eth1 * !10.0.1.0/24 0.0.0.0/0 </P>
<P>8 63 4473 DROP all -- eth0 * !10.0.0.0/24 0.0.0.0/0 </P>
<P>9 0 0 DROP all -- eth2 * !10.0.2.0/24 0.0.0.0/0 </P>
<P>10 1996 166K ACCEPT all -- * * 127.0.0.0/8 127.0.0.0/8 </P>
<P>11 1802K 2418M ACCEPT all -- * * 0.0.0.0/0 0.0.0.0/0 state=20
RELATED,ESTABLISHED </P>
<P>12 56 3308 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.254 state NEW tcp =
dpt:22=20
</P>
<P>13 48 2758 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.254 state NEW tcp =
dpt:21=20
</P>
<P>14 0 0 ACCEPT icmp -- eth2 * 0.0.0.0/0 10.0.2.254 icmp type 3 code 4 =
</P>
<P>15 0 0 ACCEPT icmp -- eth1 * 0.0.0.0/0 10.0.1.254 icmp type 3 code 4 =
</P>
<P>16 0 0 ACCEPT icmp -- eth0 * 0.0.0.0/0 10.0.0.254 icmp type 3 code 4 =
</P>
<P>17 0 0 ACCEPT icmp -- eth0 * 0.0.0.0/0 10.0.0.254 icmp type 0 </P>
<P>18 0 0 ACCEPT icmp -- eth1 * 0.0.0.0/0 10.0.1.254 icmp type 0 </P>
<P>19 0 0 ACCEPT icmp -- eth2 * 0.0.0.0/0 10.0.2.254 icmp type 0 </P>
<P>20 0 0 ACCEPT icmp -- eth2 * 0.0.0.0/0 10.0.2.254 icmp type 8 </P>
<P>21 4 280 ACCEPT icmp -- eth1 * 0.0.0.0/0 10.0.1.254 icmp type 8 </P>
<P>22 27 2004 ACCEPT icmp -- eth0 * 0.0.0.0/0 10.0.0.254 icmp type 8 =
</P>
<P>23 7297 466K ACCEPT udp -- !eth2 * 0.0.0.0/0 10.0.0.254 udp dpt:53 =
</P>
<P>24 0 0 ACCEPT udp -- eth0 * 0.0.0.0/0 10.0.0.254 udp dpts:137:139 =
</P>
<P>25 0 0 ACCEPT udp -- eth0 * 0.0.0.0/0 255.255.255.255 udp =
dpts:137:139 </P>
<P>26 0 0 ACCEPT tcp -- eth0 * 0.0.0.0/0 255.255.255.255 tcp =
dpts:137:139 </P>
<P>27 19 1020 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.254 tcp dpts:137:139 =
</P>
<P>28 0 0 ACCEPT tcp -- eth0 * 0.0.0.0/0 10.0.0.255 tcp dpts:137:139 =
</P>
<P>29 13375 2387K ACCEPT udp -- eth0 * 0.0.0.0/0 10.0.0.255 udp =
dpts:137:139=20
</P>
<P>30 2260 136K ACCEPT tcp -- * * 0.0.0.0/0 10.0.0.254 tcp =
dpts:1025:65535 </P>
<P><FONT face=3DArial></FONT>&nbsp;</P>
<P><FONT face=3DArial>Chris</FONT></P></FONT></DIV></BODY></HTML>

------=_NextPart_000_0007_01C26CE5.E25C3700--

-------------------------------------------
Introducing NetZero Long Distance
Unlimited Long Distance only $29.95/ month!
Sign Up Today! www.netzerolongdistance.com

