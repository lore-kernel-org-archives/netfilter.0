From: Bgs <bgs@bgs.hu>
Subject: Re: Problem with SNAT
Date: Fri, 03 Sep 2004 19:00:55 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4138A347.7080204@bgs.hu>
References: <41376D0E.3070208@bgs.hu>
	<1094156271.1994.25.camel@wolfpack.ljm.dom>
Reply-To: bgs@bgs.hu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094156271.1994.25.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



>>A linux with two NICs. One with IP of 10.0.2.2 and one with 10.0.3.57.
>>I have DNAT-ed traffic coming in on the 10.0.2.2 that was originally 
>>sent to 10.0.2.1. (Another node doing the DNAT). I have problems on the 
>>route back so I decided to SNAT the backward udp traffic to  soource 
>>10.0.2.1 and send the SNATed packets back on another route.
>>
>>I added the line to nat postrouting (-d target_net -s 10.0.2.2 -p udp -j 
>>SNAT --to-source 10.0.2.1) but the packages don't even seem to hit the 
>>nat postrouting chain. Let alone my SNAT rule.
 >
> since i have to guess (hint:  post your rules [1] if you want us to find
> the problem for you)...
> 
> i would say that your filter rules drop the packet before they ever get
> to the POSTROUTING chain of the nat table.
> 
> -j
> 
> [1] - iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL
> 

  Greetings,

I don't have access right no to the box, but I dumped the traffic and 
the packets go out unSNATed :)
The boxes ruleset is completely empty, it has only this one rule...
Netmasks are 24bits.

Incoming packet to 10.0.2.2 (originally sent to 10.0.2.1). Outbound udp 
traffic from 10.0.2.2 should be SNATed back to 10.0.2.1.

Bye
Bgs



