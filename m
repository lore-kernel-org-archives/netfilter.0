From: "Jeremy Davis" <jeremy@slicenet.net>
Subject: stupid redirect question
Date: Sat, 6 Sep 2003 00:10:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GKEILLINGDHHPJJGKJDIEEBCCBAA.jeremy@slicenet.net>
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
To: Netfilter List <netfilter@lists.netfilter.org>

Ok my problem is when I add a port redirection in the prerouting chain so
that port 80 traffic goes to a certain box.  I used this rule

iptables -t nat -I PREROUTING -i ppp0 -p tcp --dport 80 -j DNAT --to
192.168.0.5:80

but this kills all lan http traffic from getting back in to the
workstations.  What am I missing?

Jeremy




Here is my nat table

Chain PREROUTING (policy ACCEPT 11624 packets, 749K bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DNAT       tcp  --  any    any     anywhere             anywhere
tcp dpt:dnsix to:192.168.0.5:80
    0     0 DNAT       tcp  --  any    any     anywhere             anywhere
tcp dpt:cadlock to:192.168.0.5:1000
    2   120 DNAT       tcp  --  ppp0   any     anywhere             anywhere
tcp dpt:ftp to:192.168.0.5:21
    3   144 DNAT       tcp  --  any    any     anywhere             anywhere
tcp dpt:telnet to:192.168.0.5:23

Chain POSTROUTING (policy ACCEPT 12 packets, 780 bytes)
 pkts bytes target     prot opt in     out     source
destination
 9770  490K MASQUERADE  all  --  any    ppp0    anywhere
anywhere

Chain OUTPUT (policy ACCEPT 43 packets, 2737 bytes)
 pkts bytes target     prot opt in     out     source
destination



Here is my filter table

Chain INPUT (policy ACCEPT 5427 packets, 393K bytes)
 pkts bytes target     prot opt in     out     source
destination
  823 75341 ACCEPT     icmp --  ppp0   any     anywhere             anywhere
  423 52420 ACCEPT     all  --  ppp0   any     anywhere             anywhere
state RELATED,ESTABLISHED
    0     0 ACCEPT     tcp  --  ppp0   any     anywhere             anywhere
tcp dpt:ssh
  348 59851 LOG        all  --  ppp0   any     anywhere             anywhere
LOG level warning
  348 59851 REJECT     all  --  ppp0   any     anywhere             anywhere
reject-with icmp-port-unreachable

Chain FORWARD (policy DROP 80 packets, 3840 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
tcp dpt:cadlock
    0     0 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
tcp dpt:http
   18  1001 ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
tcp dpt:ftp
 3444  140K ACCEPT     tcp  --  ppp0   eth1    anywhere             anywhere
tcp dpt:telnet
 113K   19M ACCEPT     all  --  eth1   ppp0    anywhere             anywhere
 126K   94M ACCEPT     all  --  ppp0   eth1    anywhere             anywhere
state RELATED,ESTABLISHED


