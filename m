From: "Kran Kor" <krankor@linuxmail.org>
Subject: Problem with transparent bridge setup.
Date: Fri, 02 Dec 2005 05:40:03 +0800
Message-ID: <20051201214003.E1D9DCA0E9@ws5-11.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a bridge (br0) with two interfaces (eth1 and eth2).  Neither br0, et=
h1, or eth2 have an IP address assigned to them.  Eth0 is the only interfac=
e with an=20
IP.  There is a web server running locally on this bridge configured so tha=
t any request sent to it returs the only page.  I'm trying to get all web t=
raffic (port=20
80 for now) from certain clients transparently redirected to the local web =
server.  Basically I want to take traffic from a client matching virii/malw=
are traffic=20
and redirect it to a web page that has instructions for disinfection/cleani=
ng.  Also I want to isolate any infected clients traffic to only one side o=
f the=20
bridge.  I want to keep these bridges as "transparent" as possible.=20
=20
Here's what I have tried so far:=20
=20
# netstat -ln=20
Active Internet connections (only servers)=20
Proto Recv-Q Send-Q Local Address           Foreign Address         State=
=20=20=20=20=20=20=20
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN=
=20
=20
# route -n=20
Kernel IP routing table=20
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce=20
172.16.110.0    0.0.0.0         255.255.254.0   U     0      0        0 eth=
0=20
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo=
=20
0.0.0.0         172.16.111.254  0.0.0.0         UG    1      0        0 eth=
0=20
=20
=20
From filter:=20
-A FORWARD -p udp -m udp --dport 53 -j ACCEPT=20=20
-A FORWARD -p udp -m udp --sport 53 -j ACCEPT=20=20
-A FORWARD -p tcp -m tcp --dport 53 -j ACCEPT=20=20
-A FORWARD -p tcp -m tcp --sport 53 -j ACCEPT=20=20
-A FORWARD -s $CLIENT_IP -j DROP=20=20
-A icmp-flood -m limit --limit 1/sec -j RETURN=20=20
-A icmp-flood -j DROP=20=20
-A syn-flood -m limit --limit 50/sec --limit-burst 150 -j RETURN=20=20
-A syn-flood -j DROP=20
=20
From nat:=20
-A PREROUTING -s $CLIENT_IP -p tcp -m tcp --dport 80 -j DNAT --to-destinati=
on 127.0.0.1:80=20
=20
Using the DNAT rule above the traffic can be seen on lo:=20
15:09:21.474893 IP 172.16.110.139.1782 > 127.0.0.1.80: S 1919280507:1919280=
507(0) win 65535 <mss 1460,nop,nop,sackOK>=20
15:09:24.427208 IP 172.16.110.139.1782 > 127.0.0.1.80: S 1919280507:1919280=
507(0) win 65535 <mss 1460,nop,nop,sackOK>=20
=20
As seen from the client side bridge interface eth2:=20
15:09:21.474843 IP 172.16.110.139.1782 > 216.193.202.92.80: S 1919280507:19=
19280507(0) win 65535 <mss 1460,nop,nop,sackOK>=20
15:09:24.427183 IP 172.16.110.139.1782 > 216.193.202.92.80: S 1919280507:19=
19280507(0) win 65535 <mss 1460,nop,nop,sackOK>=20
=20
But the kernel sees the traffic as "martian" and disards them:=20
Dec  1 15:09:45 xxxxxxxx last message repeated 9 times=20
Dec  1 15:11:37 xxxxxxxx kernel: martian destination 127.0.0.1 from 172.16.=
110.139, dev br0=20
Dec  1 15:11:46 xxxxxxxx last message repeated 2 times=20
=20
Ok, that isn't what I want to see... so I tried using a REDIRECT rule in pl=
ace of the DNAT rule:=20
iptables -t nat -A PREROUTING -p tcp -s 172.16.110.139 --dport 80 -j REDIRE=
CT --to-ports 80=20
=20
Now the only interface I can see the clients web traffic on is eth2 (the in=
terface on the bridge facing the client).=20
tcpdump on eth2:=20
15:19:29.280597 IP 172.16.110.139.1791 > 216.193.202.92.80: S 3561515512:35=
61515512(0) win 65535 <mss 1460,nop,nop,sackOK>=20
=20
Eth1, br0, and lo don't see any of it, nothing in kernel or apache logs eit=
her.  Where is it getting redirected to??=20
=20
I have tried using 2.6.13 2.6.14 2.6.14.3 and 2.6.15-rc4, iptables-1.3.3 an=
d 1.3.4.=20
=20
Any ideas on what I am doing wrong? What is the correct way to do this?=20
=20
Thanks in advance.=20
=20
=20=20

--=20
_______________________________________________
Check out the latest SMS services @ http://www.linuxmail.org
This allows you to send and receive SMS through your mailbox.

Powered by Outblaze

