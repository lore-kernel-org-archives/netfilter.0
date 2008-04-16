From: Fabio De Paolis <fabiodepaolis@naxe.it>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Wed, 16 Apr 2008 15:54:50 +0200
Message-ID: <4806052A.6020301@naxe.it>
References: <480479E8.3040904@naxe.it> <4804C25C.7020608@riverviewtech.net> <4804D643.2090101@naxe.it> <4804DBB9.7030307@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4804DBB9.7030307@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: netfilter@vger.kernel.org

Grant Taylor ha scritto:
> On 04/15/08 11:22, Fabio De Paolis wrote:
>> Absoluttely CORRECT, your description is very very good.
>
> *nod*  Now I know that I am on track and that it is safe to go down 
> the path that I was thinking about.
>
>> Another goal should be to minimize traffic on C for service running 
>> on D.
>
> Hum.  This new goal may be problematic.  The problem is that A is 
> DNATing traffic to C that you now want to be re-directed elsewhere.  
> So with out re-configuring A, the traffic is going to continue to be 
> DNATed to C.  What is better in the long run is to have A DNAT the 
> traffic to B which will then DNAT the traffic in to D.
>
> How much control do you have over B?
>
I have total control on B, even if fewer changes is good.

> Can you request changes be made to A on your behalf?
A is black box, it is from my service provider, I can change nothing, 
also request will be discarded at 99%

>
> I recently helped someone else on this list with a similar scenario. 
> However in their scenario both C and D were directly connected to the 
> internet via different providers and there was a VPN between C and D. 
> The goal was to port forward connections originally to C over to D and 
> have the replies go back through C and out to the original client.  We 
> ended up getting things to work exactly as they needed to.  However 
> all the traffic for the forwarded service was still passing through C 
> on its way to D, which you are now wanting to avoid.
>
Yes on my knowledge I know that it can't be done without doubling the 
traffic on the net. I was wondering if at yuor knowledge the was another 
way.
Of course if I could nat a port from A to B it would be easy and the 
traffic will me at minimum, but it cant be done.
I was wondering if there was a way to use C only for initial handshake 
and not for all packets, but it seems no.


Actually I'm with this iptables rules

iptables -nL -t nat

PREROUTING
DNAT       tcp  --  0.0.0.0/0            192.168.0.11        tcp 
spts:1024:65535 dpts:8080 flags:0x17/0x02 state NEW to:192.168.0.2

POSTROUTING
SNAT       tcp  --  0.0.0.0/0            192.168.0.2         tcp 
spts:1024:65535 dpts:8080 flags:0x17/0x02 state NEW to:192.168.0.11

It seems to work but this is the traffic I see on the net for a single 
packet
#, Source IP(Source MAC), Destination IP(Destionation MAC), Protocol, Info
1, 192.168.0.01(Cisco1), 192.168.0.11(HPpro1), TCP, 1234 > 8080 [SYN]
2, 192.168.0.11(HPpro1), 192.168.0.02(Cisco2), TCP, 1234 > 8080 [SYN]
3, 192.168.0.02(Cisco2), 192.168.0.11(Cisco2), TCP, 8080 > 1234 [SYN, ACK]
4, 192.168.0.11(HPpro1), 192.168.0.01(Cisco1), TCP, 8080 > 1234 [SYN, ACK]
and so on...


This is technically a Bounce. Let me know if this setup is correct, thanks!
