From: Kuba Zakrzewski <kuba.zakrzewski@plusnet.pl>
Subject: CLUSTERIP + REDIRECT
Date: Fri, 18 Apr 2014 09:25:33 +0200
Message-ID: <5350D36D.3090102@plusnet.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I've got httpd cluster (clustered ips + apache on two machines managed
by corosync + pacemaker).  Apache is hosting few pages and some of them
should not be available to all users. I've setup a set of rules
redirecting unauthorized users to a special page with information they
are not allowed to access resource they requested.

Lets assume that I've two nodes with primary ips 1.2.3.2 & 1.2.3.3.
There is also a clustered ip 1.2.3.4.

Here are the rules:

nat table:

iptables -t nat -A PREROUTING -m tcp -p tcp --dport 80 -s 10.20.30.0/24
-j PREDROP
iptables -t nat -A PREDROP -j LOG --log-prefix "PREHTTP-DROP: "
--log-level 6
iptables -t nat -A PREDROP -p tcp -j REDIRECT --to-ports 8880

filter table:
iptables -A INPUT -p tcp -m multiport --dports 80,8880 -j ACCEPT

of course, pacemaker also adds rule with CLUSTERIP target as first rule
in INPUT chain like this one:

iptables -A INPUT -d 1.2.3.4/32 -i em1 -j CLUSTERIP --new --hashmode
sourceip --clustermac 67:C1:C5:32:1E:8A --total-nodes 2 --local-node 1
--hash-init 0

and problem is, that this doesn't work as expected (for cluster). When I
try to connect to ip which is clustered (1.2.3.4) from not allowed
subnet (10.20.30.0/24), I can see in INPUT chain, packets with source
from 10.20.30.X, destination set to primary ip of node (1.2.3.2 or
1.2.3.3) and destination port set to 8880 - so by this point everything
looks fine. Next, oackets are "catched" by

INPUT -p tcp -m multiport --dports 80,8880 -j ACCEPT

so far, so good... but connection is not established. tcpdump says that
initiator sends sync packets but nothing is sent back from cluster.

Probably I am missing something in my configuration but I have no idea
what. This works fine for non clustered ips, but when CLUSTERIP target
is used - it doesn't work.

-- 
Kuba Zakrzewski
