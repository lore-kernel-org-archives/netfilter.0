From: Fabio Bastiglia Oliva <fboliva@safenetworks.com>
Subject: snat/dnat problem?
Date: Sat, 26 Jul 2003 04:50:42 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <536552435.20030726045042@safenetworks.com>
Reply-To: Fabio Bastiglia Oliva <fboliva@safenetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I have used all my aspirin supply trying to understand/solve
the problem I'll describe below... Please Help! :)

The enviroment:
===============

 +-------------+
 |  Network A  |
 +------+------+
        |
 +------+YA----+
 | Firewall A  |
 +------+XA----+
        |
        |
        |
 +------+XB----+
 | Firewall B  |
 +------+YB----+
        |
 +------+------+
 |  Network B  |
 +-------------+

XA = eth0 (intrernet)

YA = eth1 (intranet)

XB = eth0 (intrernet)
 \_ 1 IP address plus 2 more IP addresses using the same NIC
    (eth0, eth0:0, eth0:1)

YB = eth1 (intranet)

Both Firewalls configuration:
    - Slackware 9.0
    - Kernel 2.4.21-ac4
    - iptables 1.2.8


The Problem
===========

Ping  the Firewall B interface eth0 from Firewall A... No problem, the
round-trip is OK... 17 ms avg.
 
Ping  the  Firewall B interface eth0 from Network A... No problem, the
round-trip is OK... 17 ms avg.

Ping  the  Firewall  B  aliased interface eth0:0 from Network A... the
round-trip increases a lot... 150-300 ms avg.

Ping  the  Firewall  B aliased interface eth0:0 from Firewall A... the
round-trip is OK again... 17 ms avg.
 
I  think  the  problem is at the SNAT/DNAT configuration, but I wasn't
able to find it yet.

Iptables DNAT/SNAT configuration (eth0:0 eth0:1)
================================================

iptables -t nat -A PREROUTING -d 1.1.1.1 -j DNAT --to 10.0.0.1
iptables -t nat -A POSTROUTING -s 10.0.0.1 -j SNAT --to 1.1.1.1
iptables -A FORWARD -i eth0 -mstate --state ESTABLISHED,RELATED -j ACCEPT

1.1.1.1 = eth0:0 aliased IP address
10.0.0.1 = network B intranet IP address


Thanks in advance.


Best regards
________________________
Fabio Bastiglia Oliva
fboliva@safenetworks.com


