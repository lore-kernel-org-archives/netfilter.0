From: Guillaume Marcais <guillaume.marcais@free.fr>
Subject: Child proofing...
Date: Thu, 7 Nov 2002 14:53:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B0000532307@smtp.rapiddsl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We have remote routers that we access with ssh. Sometime, I am 
not careful enough and I enter stupid routing information that not only 
leaves our clients connectionless but also prevents me from accessing the 
router. Then truck roll, long downtimes and angry customers... I am really a 
child sometimes :)

The idea was to be able to have access to ssh (almost) no matter what I do to 
the main routing table. Even something like: ip route del default. I thought 
of doing it with policy routing with something like the following:

(Let's assume the router has eth0 with 192.168.0.2/24 as its main gateway 
interface).

ip rule add fwmark 1 table sshtable
ip route add 192.168.0.0/24 dev eth0 table sshtable
ip route add default via 192.168.0.1 dev eth0 table sshtable
iptables -I PREROUTING -t mangle -p tcp -d 192.168.0.2 --destination-port ssh 
-j MARK --set-mark 1
iptables -I OUTPUT -t mangle -p tcp -s 192.168.0.2 --source-port ssh -j MARK 
--set-mark 1

Basically, the traffic to/from the ssh daemon uses a separate routing table, 
which I won't tamper with on a regurlar basis.

Alas, it doesn't work. If I do the following: 

ip route del 192.168.0.0/24 dev eth0

I cannot access ssh anymore. The netfilter Hacking howto tells us that: "The 
NF_IP_LOCAL_OUT [5] hook is called for packets that are created locally. Here 
you can see that routing occurs after this hook is called: in fact, the 
routing code is called first [...]". So the routing is called first, which 
fails with the main table and the packet is drop before being marked by 
netfilter and routed according to the sshtable...

Anybody has any idea on how to work aroung this?

Guillaume.

PS: in all fairness, the howto suggest to " alter the `skb->dst' field 
yourself, as is done in the NAT code". But I would like to avoid to write a 
kernel module if possible.

