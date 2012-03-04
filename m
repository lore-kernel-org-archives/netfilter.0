From: jonetsu <jonetsu@teksavvy.com>
Subject: ICMP packets seeping through a DROP policy - security concern
Date: Sun, 4 Mar 2012 17:25:06 -0500
Message-ID: <20120304172506.2e79468a@mistral.stie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all,

I have observed that there is a change of behaviour from kernel 2.6.26
and kernel 3.0 regarding the INPUT chain and ICMP traffic going
through it.  Kernel 2.6.26 will stop ICMP traffic as soon as the rules
below are applied whereas kernel 3.0 will not.  In both cases an
existing TCP connection (ssh) will be terminated, but the ICMP packets
will be allowed when kernel 3.0 is used, even though a very square
policy of INPUT DROP is applied.

As far as I can see, a policy of INPUT DROP should stop all traffic.
That the ICMP packets are still passing through is not expected and
can be considered as a security breach.

The setup is:

unit1  <--> eth4  unit3  eth1 <--> unit2

unit1 is continuously pinging unit2 via unit3. Rules are applied
on unit3.

1) Test passes

kernel: 2.6.26
iptables: 1.3.6.0

cat /proc/sys/net/ipv4/netfilter/ip_conntrack_icmp_timeout
30

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-> continuous ping immediately stops

2) Test fails

kernel: 3.0.0
iptables: 1.4.8-3

cat /proc/sys/net/ipv4/netfilter/ip_conntrack_icmp_timeout
30

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-> continuous ping does not stop


If a ip_conntrack_icmp_timeout of 1 is used, the ICMP packets will be
stopped when the rules are applied.  But that means modifying the
default ICMP conntrack timeout when establishing a firewal and putting
it back to default when the firewall is up, but moreover, it still
does not fix the basic problem of having a INPUT DROP policy and ICMP
packets seeping through.  A value of 2 will not work and will let ICMP
packets go through.

Would it be possible to confirm that there is a problem with the
handling of ICMP packets in this case or, if the tests that I'm doing
are not right ?

Thanks.
