From: Patrick van der Smagt <smagt@dlr.de>
Subject: how to assign a real IP to a PPP host?
Date: Mon, 4 Nov 2002 10:37:24 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.40.0211041029270.5446-100000@amazonas.robotic.dlr.de>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Netfilters,

I'm blocked by the following problem.  My host has two IPs on interface 0:
	12.12.12.12
	12.12.12.13
The first IP is its "real" IP on eth0:0, I created the second one to have
it assigned to a ppp-connected client machine.

To my host a second machine is connected over a ppp connection, and it
has the local IP 10.1.0.100.  What I want to do is to give the remote
machine the permanent IP 12.12.12.13.  I want all network traffic for
10.1.0.100=12.12.12.13 (and a cluster of machines behind that) to be
routed through 12.12.12.12.

I've set up iptables as follows to do what I want:
  iptables -t nat -D PREROUTING --dst 12.12.12.13 \
        -j DNAT --to-destination 10.1.0.100
  iptables -t nat -D POSTROUTING --dst 10.1.0.0/24 \
        -j DNAT --to-destination 12.12.12.13
  iptables -t nat -D OUTPUT --dst 12.12.12.13 \
        -j DNAT --to-destination 10.1.0.100
The first and second rule work fine, with those I can reach my machine
10.1.0.100 at address 12.12.12.13 from all hosts, except 12.12.12.12 (of
course). That's what the third rule is for.  However, rule 3 does not
do everything for me.  After setting up all of the above rules, when I
telnet to port 110 from .12 to .13, I receive no answer.  I find in
/proc/net/ip_conntrack on .12:

tcp      6 118 SYN_SENT src=12.12.12.13 dst=12.12.12.13 sport=2996
dport=110 [UNREPLIED] src=10.1.0.100 dst=12.12.12.13 sport=110
dport=2996 use=1

or

tcp      6 57 SYN_RECV src=12.12.12.13 dst=12.12.12.13 sport=2996
dport=110 src=10.1.0.100 dst=12.12.12.13 sport=110
dport=2996 use=1

How do I get this running??  Please help!

Patrick


