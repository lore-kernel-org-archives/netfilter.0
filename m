From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: precedence and redundancy questions re ACCEPT vs NEW
Date: Wed, 24 May 2006 07:31:28 +0200
Message-ID: <000301c67ef3$4f0777c0$0101000a@sterenborg.info>
References: <4473a1a6.109.4e72.1299307770@lowell.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4473a1a6.109.4e72.1299307770@lowell.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Greetings:
> 
> If my firewall receives a packet from 1.2.3.4, which rule accepts it?
> 
> -A INPUT -s 1.2.3.4                       -j ACCEPT

This rule will accept all packets from IP 1.2.3.4

> -A INPUT -s 1.2.3.4 -m state --state NEW  -j ACCEPT

This rule will accept all packets in state NEW from IP 1.2.3.4

> -A INPUT -s 1.2.3.4 -p TCP   --syn        -j ACCEPT

This rule will accept all **tcp** packets with the SYN bit set from IP
1.2.3.4

To answer your question: all rules will accept "a" packet from IP
1.2.3.4, but not all rules will accept all packets from 1.2.3.4.
Example:
- The 2nd rule doesn't accept ESTABLISHED, RELATED or INVALID packets
but the 1st rule does.
- The 3rd rule will not accept any other packet than tcp with the SYN
bit set (which most likely is also NEW).

They're all different rules that only have the same effect when the
first **tcp** packet in a connection is matched. In all other cases they
don't behave the same.

That said, I read some time ago about cases where it's possible to have
a tcp packet that is regarded as NEW but doesn't have the SYN bit set so
that would be an exception, however I don't recall in what situation
that would be. Maybe someone else can shed a light on that.

> Does it matter if the packet is the first of a new
> connection?

You normally set the policy of a chain to DROP, match for NEW packets
and accept those.
Then, all other packets in that connection have state ESTABLISHED (or
RELATED) and you'd write a rule that accepts all ESTABLISHED packets in
that connection.

$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A INPUT -m state --state NEW -s 1.2.3.4 -j ACCEPT

Now, this is an example that doesn't seem so useful. But, when you also
set the OUTPUT policy to DROP, you will have to allow outgoing packets
(the "answer") that are part of the incoming connection.

$ipt -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

You can use this quite effectively in the FORWARD chain too.

Because you only match 1 packet with the NEW match, most packets will be
matched by the ESTABLISHED,RELATED rule, so you'd put that rule
somewhere on top of your rule-list for performance reasons: that way you
don't have to match for NEW packets first.

> Are these lines redundant in the sense they will all allow a
> first connection packet through?

The first rule matches all packets from IP 1.2.3.4 and the target is
ACCEPT wich is a definitive target, so no more matching is done. That
means the following 2 rules will never match.

> Are rules #2 and #3 the same?

No. Connection tracking is something Netfilter does. The SYN bit is part
of tcp's handshaking procedure. Other protocols don't have a SYN bit. A
udp or icmp packet would be matched by the 2nd rule, but not by the 3rd.

http://iptables-tutorial.frozentux.net/iptables-tutorial.html has some
good reading..


Gr,
Rob


