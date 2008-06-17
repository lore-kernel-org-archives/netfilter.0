From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: rule is ignored for the localhost
Date: Tue, 17 Jun 2008 09:16:31 -0500
Message-ID: <4857C73F.1090406@riverviewtech.net>
References: <86ff9a9a0806161241r65b5a734o2b0ebc8e2ef0c4fe@mail.gmail.com> <4856D1DB.9050107@riverviewtech.net> <4857C443.8080502@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4857C443.8080502@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/17/08 09:03, Pascal Hambourg wrote:
> I beg to differ. AFAIK packets routed through the loopback interface 
> don't go through the nat/PREROUTING chain, so the latter rule will never 
> match any packet. My understanding is that only packets creating a new 
> yet unconfirmed connection go through the nat chains, and the connection 
> is confirmed right after the POSTROUTING chains, before the packet is 
> looped back into the PREROUTING chains. I have the feeling that 
> conntrack and NAT on loopback is somehow dodgy.
> 
> So the rule must be added to the OUTPUT chain :
> 
> iptables -t nat -I OUTPUT -o lo -p tcp --dport 30099 -j DNAT --to 
> 192.168.10.119:22

I'll mostly agree with you (based on my (mis)understandings) on the 
OUTPUT verses PREROUTING chain and the fact that only the first packet 
in a connection pass through the nat table.

However I believe the dodyness is at least partially do to the kernel 
treating the loopback subnet special.  If I were to bind 192.0.2.1 to 
the loopback or dummy interface and try to NAT them, I'd need to use the 
OUTPUT chain for locally generated traffic.



Grant. . . .
