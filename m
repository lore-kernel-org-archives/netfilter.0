From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: skip other iptables marking if packet is already marked
Date: Mon, 31 May 2004 16:41:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <029101c446eb$024bfdd0$0100a8c0@newlife>
References: <020701c446e0$44e95ee0$0100a8c0@newlife> <1085991395.26732.12.camel@anduril.intranet.cartel-securite.net>
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


> 
> Why don't you just match the mark the packet has been given ?
> 
> iptables -t mangle -A PREROUTING ..... -j MARK --set-mark 1
> iptables -t mangle -A PREROUTING -m MARK --mark 1 -j ACCEPT
> iptables -t mangle -A PREROUTING ..... -j MARK --set-mark 2
> iptables -t mangle -A PREROUTING -m MARK --mark 2 -j ACCEPT

Understand, but what if I have something on top :-

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark

I don't know what is the mark value, but i want to return as soon as the 
mark has been restored.

> 
> I think your ruleset does not work because a packet without a mark will
> match your non-zero mark rule. I mean that no mark is different than 0,
> so all packets will match the first "-m mark ! --mark 0" rule.
> 

No, it does not work because the syntax is rejected ! I tried with
"-m mark --mark ! 0" ,  it is alway rejected.

> 
> > My next question is should I use -j ACCEPT or -j RETURN ?
> 
> RETURN should not be use within builtin chains. Moreover, both have the
> same effect if used in builtin chain.
> 

Point taken.

Thanks.






