From: Greg Stark <gsstark@mit.edu>
Subject: Re: NAT PPPOE & MTU problems
Date: 12 Jun 2003 00:49:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <877k7roq6m.fsf@stark.dyndns.tv>
References: <000801c325de$f89fde60$1800a8c0@ckznak.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c325de$f89fde60$1800a8c0@ckznak.pl>
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
Content-Transfer-Encoding: 7bit
To: s <xperience@interia.pl>
Cc: netfilter@lists.netfilter.org

"s" <xperience@interia.pl> writes:

> I've got a problem with NAT connections on PPPOE.
> My box is connected to internet via DSL, and I have some computers behind NAT. 
> I changed MTU on internal interfaces to 1492 and configured iptables with:
> 
> iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
> 
> also I have squid cache installed for local workstations. When I surfing net
> without squid everything works fine, no timeouts or something. Is good. But
> when I use squid as a cache sometimes when squid uses POST method with huge
> amount of parameters, connection hangs. On tcpdump I see that one packet is
> repeated few times (5) and I got timeout message. What's wrong ? Repeated
> packet has 1492 bytes lenght. But there's no answer from www server.

You might try smaller MTUs. 1492 should work with PPPOE in theory, but some
PPPOE based DSL providers seem to have internal networks that impose
additional constraints. I find my own packets don't seem to get out if they're
over 1480 or so (it seems to vary).

Also, does your provider have a transparent proxy? One transparent proxy I've
seen misbehaved in precisely the manner you're describing. There was no way
around the bug, and people complained incessantly on the support newsgroups.
I eventually just switched providers.

-- 
greg


