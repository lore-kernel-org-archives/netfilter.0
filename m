From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables + nat problem in large network
Date: Thu, 26 Sep 2002 23:26:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020926222610.VSGU13996.mta05-svc.ntlworld.com@there>
References: <20020926204651.GB3801@alucicrazy.tacnet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020926204651.GB3801@alucicrazy.tacnet.com.br>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 26 September 2002 9:46 pm, bueno wrote:

> Hello all,
> 	        I have had problems with iptables nat with some servers.
>         Is strange, because the nat works during some time...
>
>         I have a machine with 3 interfaces...
>         eth0 - 200.xxx.xxx.163
>         eth1 - 10.1.2.1
>         eth2 - 10.0.0.1
>                10.0.0.65
>                10.0.1.1
>                10.0.1.65
>                10.0.2.1
>                10.0.2.65
>                10.0.3.1
>                10.0.3.65
>                10.0.4.1
>                10.0.5.1
>                10.0.5.65
>                10.0.5.129
>                10.0.5.194
>                10.0.6.1
>
>         I have the following rules for MASQUERADE:
>         iptables -t nat -A POSTROUTING -s 10.1.2.0/25 -j MASQUERADE
>         iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -j MASQUERADE

These two rules will masquerade packets from eth1 to the outside world (seems 
sensible) and from eth2 to the outside world (ditto), but also from eth1 to 
eth2, and from eth2 to eth1.

Do you really want packets between eth1 and eth2 to be masqueraded ?   Surely 
they can be normally routed with the original source address left intact ?   
I'd have thought a better rule than the two above would be the single:

iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE

<snip long quote of tcpdump / ping showing strange things...>

> it remains thus during long time, more than 1 hour
> note that, 1 second later eth1 stops to answer, eth2 starts...

I would check two things:

1. How many concurrent connections do you have on your machine, and what size 
is your connection tracking table ?

wc -l /proc/net/ip_conntrack
cat /proc/sys/net/ipv4/ip_conntrack_max

2. Is your ARP table behaving sensibly ?

On the firewall machine, try

arp -an

when the ping is working as it should, and again when it is not, and see if 
the entry for machine 10.1.2.17 is different ?

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

