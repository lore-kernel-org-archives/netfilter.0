From: Fabio Bastiglia Oliva <fboliva@safenetworks.com>
Subject: SNAT/DNAT + IP Alias problem?
Date: Wed, 30 Jul 2003 02:35:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1644259315.20030730023516@safenetworks.com>
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

Hi guys,

I'm  posting  this message once again... I know that my english is not
so  good,  sorry,  but  I'll try to explain the problem the best way I
can.

I  have  used  all  my  aspirin supply trying to understand/solve this
problem... Please Help... otherwise Bayer will get all my money. :)

The  problem:  I'm  using  two  netfilter  firewalls  in two different
networks.  Both  networks are using SNAT/DNAT to provide access to the
servers   protected   by  these  firewalls,  but  I'm  geting  a  poor
comunication  performance  (slowness)  when  I'm  accessing a NATed IP
address from one network to another.


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


This is what happens:
=====================
    
Ping  the Firewall B interface eth0 from Firewall A... No problem, the
round-trip is OK... 17 ms avg.
 
Ping  the  Firewall B interface eth0 from Network A... No problem, the
round-trip is OK... 17 ms avg.

Ping  the  Firewall  B  aliased interface eth0:0 from Network A... the
round-trip increases a lot... 150-300 ms avg.

Ping  the  Firewall  B aliased interface eth0:0 from Firewall A... the
round-trip is OK again... 17 ms avg.
 


Iptables DNAT/SNAT configuration (eth0:0 eth0:1) (network B)
============================================================

iptables -t nat -A PREROUTING -d 123.123.123.123 -j DNAT --to 10.0.0.1
iptables -t nat -A POSTROUTING -s 10.0.0.1 -j SNAT --to 123.123.123.123
iptables -A FORWARD -i eth0 -mstate --state ESTABLISHED,RELATED -j ACCEPT

123.123.123.123 = eth0:0 aliased IP address
10.0.0.1 = network B intranet IP address


I  think  the  problem  is  at  the SNAT/DNAT configuration, or even a
problem with the IP alias... but I wasn't able to find it yet.


Thanks indeed (in advance) for any help.


Best regards
________________________
Fabio Bastiglia Oliva
fboliva@safenetworks.com


