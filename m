From: a.ledvinka@promon.cz
Subject: Re: Iptables Problems
Date: Thu, 2 Dec 2004 09:30:19 +0100
Message-ID: <OFA53C47CF.3AB952B6-ONC1256F5E.002C2238-C1256F5E.002EB88E@promon.cz>
References: <008201c4d835$eff08480$0200a8c0@etpi>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008201c4d835$eff08480$0200a8c0@etpi>
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
Content-Transfer-Encoding: 7bit
To: testmail <testmail@peterpaul.com.ph>
Cc: Netfilter <netfilter@lists.netfilter.org>

as i read through i noticed you miss one realy important thing.
the chain traversal of incoming and outgoing packets.
http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-6.html
that will teach you where you should add your rules.

don't use MASQUERADE but SNAT if your ip is static.

try to start your forward chain with following rules:
iptables -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--clamp-mss-to-pmtu
iptables -t filter -A FORWARD -p icmp -m state --state RELATED,ESTABLISHED 
-j ACCEPT
### next rule drops icmp source quench which is not too god idea
### comsider adding rule like 
### iptables -t filter -A FORWARD -p icmp --icmp-type source-quench -j 
ACCEPT
### before next rule and also consider not to do it
iptables -t filter -A FORWARD -m state --state INVALID -j LOGDROP

and try to start your input chain with (same for output in case of drop 
policy):
iptables -t filter -A INPUT -p icmp -m state --state ESTABLISHED,RELATED 
-j ACCEPT

(don't forget to enable ip packets forwarding after you have set up your 
firewall. add line like:
net/ipv4/ip_forward = 1
into /etc/sysctl.conf and run "sysctl -p" 
)


