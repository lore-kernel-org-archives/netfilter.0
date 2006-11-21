From: Danny <dineshg@hostway.com>
Subject: [Fwd: Re: load balancing multiple isp]
Date: Tue, 21 Nov 2006 16:07:31 +0530
Message-ID: <4562D6EB.1000302@hostway.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


Hi Arios,

Refer this 
http://lartc.org/howto/lartc.rpdb.multiple-links.html

People have used and tested this.

I was trying a similar one, but was trying for round robin distribution. 
But didnt quite work perfectly.

In the end I decided to use Mikrotik, which cost me 45$ [ which is fine 
for the amount of time I would have wasted with iptables ]

Infact, I was partially successful using nth match. But it didnt do a 
perfect round robin. Here is what I tried :
iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW   -m nth 
--every 2 --counter 2  --packet 0  -j CONNMARK  --set-mark 1
iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW   -m nth 
--every 2 --counter 2  --packet 1  -j CONNMARK  --set-mark 2
ip ro add table 10 default via 10.90.101.1 dev eth2
ip ru add fwmark 1 table 10
ip ro fl ca


ip ro add table 20 default via 10.90.102.1 dev eth3
ip ru add fwmark 2 table 20
ip ro fl ca


iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 10.90.101.2
iptables -t nat -A POSTROUTING -o eth3 -j SNAT --to 10.90.102.2

ip ro add default nexthop via 10.90.101.1  dev eth2 weight 1 nexthop via 
10.90.102.1 dev eth3 weight 1


EXT IF :eth2 and eth3
Debian Sarge 3.1  - kernel -2.4.27  [ patched with patch-o-matic XX ]



All the best.


- Danny



ArioS wrote:
> Dear,
>
> anyone have experience bout load balancing on multiple isp ? i have 3 
> connection from different isp (A = 64kb , B = 128kb , C = 128kb). 
> howto mix these 3 isp into 1 virtually.. so if bw on ISP A is lacked 
> then the connection will move to ISP B. currently i did manual route 
> for specific network to specific ISP... it really hard to balance it 
> with manual route. any clue ?
>
>



