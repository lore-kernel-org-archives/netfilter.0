From: "Mindaugas" <mind@bi.lt>
Subject: How to simplify iptables rules
Date: Wed, 20 Sep 2006 17:19:28 +0300
Message-ID: <029a01c6dcbf$c9db3b10$f20214ac@bite.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org


  Hello,

  How to configure restrictive NAT firewall with different rules?

  For example I want to NAT packets from net 10.0.0.0/8 to tcp ports 25 and 
80. Also I want to NAT packets from host 192.168.1.1.
  Now I understand that I need the following rules:

iptables -A FORWARD -s 10.0.0.0/8 -i eth0 -o eth1 -m multiport --dports 
25,80 -j ACCEPT
iptables -A FORWARD -d 10.0.0.0/8 -i eth1 -o eth0 -m multiport --sports 
25,80 -j ACCEPT
iptables -A FORWARD -s 192.168.1.1 -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -d 192.168.1.1 -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -j DROP
iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o eth1 -m multiport --dports 
25,80 -j SNAT --to-source=1.1.1.1
iptables -t nat -A POSTROUTING -s 192.168.1.1 -o eth1 -j 
SNAT --to-source=2.2.2.2

  So there are 3 rules for every host - forward out, forward back in, NAT. 
Maybe it is possible to simplify rules? E.g. will this work for forwarding 
packets back:

-A FORWARD -i eth1 -o eth0 -m conntrack --ctstate SNAT -j ACCEPT

  If I would have simple SNAT I then could also mark packets in PREROUTING 
and simply let marked packets to forward and SNAT. But as one can notice I 
need to SNAT them to different source addresses.

  Thanks,

  Mindaugas


