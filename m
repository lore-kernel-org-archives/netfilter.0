From: Henrik Martin <henrik@netgate.net>
Subject: Yet another local nat/port redirecting question
Date: Tue, 24 Apr 2007 17:01:27 -0700
Message-ID: <200704241701.28038.henrik@netgate.net>
Reply-To: Henrik Martin <henrik@netgate.net>
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

Hi everyone. I've been trying to get the nat/redirect feature to work
on my Linux box for a while, and I just can't seem to get it to
function properly. What I'm trying to do is a simple port redirect
from port 80 to port 8080 on my box. Here's how it's set up:

SuSE Linux 10.2 (32 bit). Kernel version is 2.6.18.2-34. One ethernet
interface with a 192.168.X.X address (I'm forced to by my ISP). My ISP
lets through ports 80 and 443 plus SSH to my machine.=20
Iptables version is 1.3.6.

All I want to do is run my web server as an ordinary user and having
it bind to port 8080 and then have my firewall redirect traffic from
port 80 to 8080.  I have a firewall running on the local machine and I
only let through ports 80, 443, and SSH. I'm using the SuSEFirewall
utilities to create this.  At first, I tried setting the REDIRECT
variable in SuSE's own firewall to do the port forwarding, but
couldn't get it to work. So I've basically pared it down to where I've
disabled the SuSE firewall, and I'm just doing the following on the
command line:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 8080

=46rom reading other posts on this list, it *should* work. Here's a
recap of what's happening:

# iptables --list -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

#iptables --list -n -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

# iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 80=
80
# iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 8080
# iptables --list -n -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
REDIRECT   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80 red=
ir ports 8080

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
REDIRECT   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80 red=
ir ports 8080

If I log into an external machine and try to telnet to my web server's
port, I can see the PREROUTING chain's packet counter increase, but=20
not the OUTPUT. I'm not able to connect.

# iptables --list -n -t nat -v
Chain PREROUTING (policy ACCEPT 140K packets, 42M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion=20
    3   180 REDIRECT   tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0           tcp dpt:80 redir ports 8080

Chain POSTROUTING (policy ACCEPT 140K packets, 42M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion=20

Chain OUTPUT (policy ACCEPT 763 packets, 56801 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion=20
    0     0 REDIRECT   tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0           tcp dpt:80 redir ports 8080


What am I doing wrong? Is this a bug, or is it the way I'm configuring
the firewall? I've tried everything, including specifying that the
redirect should go to localhost port 8080 over the lo interface, but
nothing seems to make a difference.

As a workaround, I've configured xinetd to redirect traffic on port 80
to 8080, but the downside of this is that the web server log files
will only show traffic from localhost, so I can't do any useful
traffic analysis.  I'd highly appreciate an example of how to set this
up properly using netfilter/iptables if someone has a solution to
this. Thanks much,

/Henrik



