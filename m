From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Tue, 19 Dec 2006 19:53:19 +0100
Message-ID: <4588351F.1040806@rtij.nl>
References: <45860240.2040102@riverviewtech.net>	
	<1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>	
	<4587B400.6080206@rtij.nl>
	<1166526302.12238.12.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1166526302.12238.12.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>, Grant Taylor <gtaylor@riverviewtech.net>

Cedric Blancher wrote:

>>It is possible netfilter does this to accomodate bridging setups. Anyone 
>>can comment on this? If this opens up the connection for any other ICMP 
>>traffic, I think that's a bug. But I cannot imagine netfilter does this, 
>>anyone know for sure?
>>    
>>
>
>We also have a protocol problem here. However, as Pascal stated before,
>you can explicitly deny ICMP redirects.
>
>As a more general matter, ICMP filtering is tricky:
>
>	. ICMP filtering can (and do) break connectivity: PPPoE users
>	  with broken PMTUD knows about it...
>	. ICMP messages authentication is weak.
>
>On one hand we have a protocol we have to implement because we need it
>for IP to work smoothly, and on the other hand, it's quite easy to
>abuse. And we have to cope with it.
>  
>

ICMP filtering is not tricky. Just remember the rules.
1) NEVER, EVER, EVER filter out fragmentation needed.
2) You may filter out ping, and the various destination unreachables, 
the consequences are yours.
3) Everything else can be filtered without consequences.

If you mean, it is hard for a firewall to filter malicious ICMPs but not 
beneign ICMPs, the we agree. I have not heard of an fragmentation needed 
attack yet, but I can imagine it happening (analogous to the zero 
windowsize attack).

But as Jozsef explained, iptables does check what it is possible, for 
the rest we mostly have to live with it.

M4


