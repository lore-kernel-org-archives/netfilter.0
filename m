From: "LinuXKiD" <gregoriandres@yahoo.com.ar>
Subject: p2p: ARES
Date: Fri, 16 Sep 2005 22:55:54 -0300
Message-ID: <NHBBLNDNFKDMKNNKGOMMEEPMMFAA.gregoriandres@yahoo.com.ar>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>


Hi,

I've a linux as router nat + firewall
(POLICY DROP for INPUT OUTPUT and FORWARD)

but, I've put next rules for p2p software
on FORWARD chain

[... snip ... ]

iptables -F FORWARD
iptables -P FORWARD DROP


iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
[... snip ... ]

iptables -A FORWARD -m ipp2p --ipp2p -j ACCEPT
iptables -A FORWARD -m ipp2p --ares -j ACCEPT

[...]

Then... emule, kaazaa , edonkey and so on  works very good
but ARES can't connect.

I've 
	- iptables 1.3.3
	- kernel 2.4.28
	- ipp2p 0.8.0rc3

BUT, if I change policy

	iptables -P FORWARD ACCEPT

ARES works,  can connect.

I've tried to guess tcp/udp ports with tcpdump
without suceess.

I guess that ipp2p only can block p2p on a ACCEPT
policy firewall 

I must open some tcp/udp port ?
Can anybody helpme ?

bests
andres.











