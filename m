From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP Connections ...
Date: Tue, 24 Aug 2004 22:05:15 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408242205.16243.Antony@Soft-Solutions.co.uk>
References: <20040824133610.80037.qmail@web14926.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040824133610.80037.qmail@web14926.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 24 August 2004 2:36 pm, Chetan Nagaraja wrote:

> Dear All,
> First of all, let me introduce as a total newbie in filtering and iptables.
>
> To ping a host in a different network, I have configured a dual homed[ two
> network interfaces] linux system to act as NAT router. I have add a rule in
> the NAT table of iptables, to achieve the following. If the Linux system
> recieves a icmp packet from a particular host in NETWORK A addressed to a
> particular HOST in NETWORK B , perform SNAT of the ICMP packet to that of
> the Linux System, so that the icmp replies reaches the Linux system.

I think you probably mean DNAT?

> The above is working very fine. The ICMP requests are reaching the expected
> destination. But I'am unable to understand the fact that the ICMP replies
> are reaching the host in NETWORK A which had generated the requests,
> without adding a DNAT rule for the same. How is this possible, does
> iptables automatically redirect ICMP replies ?

Yes, and not just ICMP.   Netfilter automatically applies reverse-nat to reply 
packets in accordance with the forward nat rules you specify for the original 
packets.

> And How to avoid the same.

What do you mean?

Regards,

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


