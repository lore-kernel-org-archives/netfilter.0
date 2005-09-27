From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 17:18:41 +0200
Message-ID: <433962D1.6010107@mnemon.de>
References: <20050927145748.68181.qmail@web54701.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050927145748.68181.qmail@web54701.mail.yahoo.com>
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

Alaios wrote:
> Hi plz take a look at the following example
> 
> The laptop has 2 ethernet interfaces
> To eth1 comes traffic from src 143.233.222.253
> The eth0 has ip address 10.2.4.2 and it is connected
> back to back with eth1 of other pc with ip address
> 10.2.4.1
> I want to forward the traffic with src 143.233.222.253
> to the 10.2.4.1 pc 

[SNIP]

> i have also set the
> /proc/sys/net/ipv4/ip_forward to 1

Ok.

[SNIP]

> I have also tested this one
> iptables -t nat -A PREROUTING -p tcp -d 143.233.222.77
> (laptop eth1 card) --dport 22453 (i have cheched dst
> port with tcpdump) 00 -j DNAT --to-destination
> 10.2.4.1
> this still doesnt work
> Every time i try to apply a new rule i use first
> the iptables -F
> iptables -t nat -F command


Your PREROUTING rule is probably ok, provided that 143.233.222.77 is the 
IP of eth1. But I think, if the simple approach doesn't work you 
shouldn't it make more complicated. Keep it small and simple and when 
you understand all the details, you may go deeper. So, may be you would 
like to start like this:

## Rewrite destination address
iptables -t nat -A PREROUTING -i eth1 -s 143.233.222.253 \
          -j DNAT --to 10.2.4.1

## Allow packets to pass FORWARD
iptables -A FORWARD -m state --state ESTABLISHED,RELATED \
          -j ACCEPT
iptables -A FORWARD -i eth1 -s 143.233.222.253 \
          -j ACCEPT

## Now, SNAT outgoing packets
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 143.233.222.77

If this is a dial-up connection replace the SNAT part with MASQUERADE. 
BTW, you only need the FORWARD rules if your FORWARD policy is DROP or 
REJECT. And if you have other policies in filter table set to DROP or 
REJECT enable loopback. And finally, set all policies in nat and mangle 
to ACCEPT (and in raw, if you have that). This should get you started.

HTH,

Joerg


