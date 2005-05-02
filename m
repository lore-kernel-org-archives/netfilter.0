From: "John G. Norman" <john.g.norman@gmail.com>
Subject: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 2 May 2005 14:42:55 -0400
Message-ID: <df31c4040505021142197fdcdc@mail.gmail.com>
Reply-To: john@7fff.com
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

Hi. I've been reading through the FAQ and some of the recent list
history, and haven't found much guidance on the problem below.

I am trying to do a transparent proxy from port 80 to port 8080. I've
had no problem doing this on a recent release of SuSE (iptables
1.2.9), but something's not working on Fedora 3.

The version of iptables on this release of Fedora is 1.2.11

/proc/sys/net/ipv4/ip_forward shows: 1

(any other settings in /proc/sys/net/ipv4 that could affect this?)

I've tried it two ways, which I think should be equivalent (the
system's IP is 192.168.10.101):

/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 8080

/sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.16
8.10.101:8080

Port 8080 is definitely open, and I can browse to that port with no
problems. For 80, I get connection refused.

My filter table is wide open; nothing in mangle, and I show below
what's in nat to show that the setting is at least there. Also below I
show the nat table when I use -j REDIRECT.

Any ideas? I'm completely stumped.=20

John




[root@preview preview]# /sbin/iptables -nvL
Chain INPUT (policy ACCEPT 944 packets, 351K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion


Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion


Chain OUTPUT (policy ACCEPT 653 packets, 143K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion

[root@preview preview]#

[root@preview preview]# /sbin/iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
[root@preview preview]# /sbin/iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere            tcp dpt:http t=
o:192
.168.10.101:8080

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination




=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D



And here's the nat table when I use -j REDIRECT (looks good . . .):

[root@preview preview]# !352
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT -=
-to-p
ort 8080
[root@preview preview]# /sbin/iptables -t nat -LUT
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
REDIRECT   tcp  --  anywhere             anywhere            tcp dpt:http r=
edir
ports 8080

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@preview preview]#

