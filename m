From: "Jeremy Nelson" <jeremy@thepulsegroup.net>
Subject: Weird behaviour with GRE and HTTP on same IP with DNAT
Date: Thu, 20 Jun 2002 14:34:09 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <21CFAEE4AD228C41B78FDEBA4C82B774226B@luci.thepulsegroup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter (E-mail)" <netfilter@lists.samba.org>

Hi Netfilter,

Is this standard behaviour or a bug or have I just got it wrong ??

I had some weird stuff happening on my firewall when I was trying to =
allow both VPN traffic and HTTP traffic through to the same IP.  I am =
using DNAT and im allowing proto 47 and tcp port 1723 and pushing that =
on to an internal address (192.168.97.245). I then append a rule to the =
PREROUTING chain that allows port 80 traffic through. I end up with the =
following in the chain.

XXX.X.XXX.245 is the external address of the box that has the VPN server =
on it as well as the website.

Chain PREROUTING (policy ACCEPT 658K packets, 53M bytes)
 pkts bytes target     prot opt in     out     source               =
destination
    0     0 DNAT       47   --  eth0   *       0.0.0.0/0            =
XXX.X.XXX.245      to:192.168.97.245
    1    48 DNAT       tcp  --  eth0   *       0.0.0.0/0            =
XXX.X.XXX.245      to:192.168.97.245:1723
    0     0 DNAT       tcp  --  eth0   *       0.0.0.0/0            =
XXX.X.XXX.245      tcp dpt:80 to:192.168.97.245:80

I also have entries in the forward table to match. When i have done this =
the web site does not work but the vpn does. A tcpdump below.
203.45.77.145 is the ip of my dial in account i was using to test.=20

User level filter, protocol ALL, datagram packet socket
tcpdump: listening on all devices
13:25:57.223632 eth0 < 203.45.77.145.1386 > XX.X.XXX.245.http: S =
916801727:916801727(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
13:25:57.224139 eth0 > XX.X.XXX.245.http > 203.45.77.145.1386: S =
777470879:777470879(0) ack 916801728 win 17520 <mss 1460,nop,nop,sackOK> =
(DF)
13:25:57.224246 eth0 < 203.45.77.145.1386 > XX.X.XXX.245.http: . 1:1(0) =
ack 1 win 17520 (DF)
13:25:57.224513 eth0 < 203.45.77.145.1386 > XX.X.XXX.245.http: P =
1:345(344) ack 1 win 17520 (DF)
13:25:57.346419 eth0 > XX.X.XXX.245.http > 203.45.77.145.1386: . 1:1(0) =
ack 345 win 17176 (DF)
13:26:27.218099 eth0 > XX.X.XXX.245.http > 203.45.77.145.1386: F 1:1(0) =
ack 345 win 17176 (DF)
13:26:27.218292 eth0 < 203.45.77.145.1386 > XX.X.XXX.245.http: . =
345:345(0) ack 2 win 17520 (DF)
13:26:27.218663 eth0 < 203.45.77.145.1386 > XX.X.XXX.245.http: F =
345:345(0) ack 2 win 17520 (DF)
13:26:27.218864 eth0 > XX.X.XXX.245.http > 203.45.77.145.1386: . 2:2(0) =
ack 346 win 17176 (DF)

As you can see traffic does not even make it past eth0

If i flush the rules and then place the HTTP rule before the VPN rules =
in the chain then everything works ok. This will happen if i setup rules =
on any ip address I have. Is there anyone else that has had this =
problem.

I would have thought that the HTTP traffic would have not matched with =
the protocol 47 rule and been passed on and then matched with the tcp =
port 80 rule. Please correct me if I am totally off track.

Regards

Jeremy

