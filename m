From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: NAT PPPOE & MTU problems
Date: Sat, 14 Jun 2003 21:36:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EEB7950.5000000@gmx.de>
References: <000801c325de$f89fde60$1800a8c0@ckznak.pl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: s <xperience@interia.pl>
Cc: netfilter@lists.netfilter.org



s wrote:

> I've got a problem with NAT connections on PPPOE.
> My box is connected to internet via DSL, and I have some computers 
> behind NAT.
> I changed MTU on internal interfaces to 1492 and configured iptables with:
>  
> iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS 
> --clamp-mss-to-pmtu
> also I have squid cache installed for local workstations.
> When I surfing net without squid everything works fine, no timeouts or 
> something. Is good.
> But when I use squid as a cache sometimes when squid uses POST method 
> with huge amount of parameters, connection hangs. On tcpdump I see 
> that one packet is repeated few times (5) and I got timeout message.
> What's wrong ? Repeated packet has 1492 bytes lenght. But there's no 
> answer from www server.
>  
> Pozdraviam
> Przemyslaw Borkowski

I think the problem here is that squid will establish a connection
locally from your box. So when your computers on the internal
net surf directly, the MSS will be clamped to PMTU via your
FORWARD rule. When your clients surf via your squid proxy,
the SYN pakets MSS aren't clamped to PMTU.

So, you'll need the same rule to clamp the MSS for your OUTPUT
rule.

Hope this helps

Sven



