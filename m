From: "Jens =?iso-8859-15?q?Lechtenb=F6rger?=" <lechten@wi.uni-muenster.de>
Subject: Re: NEW vs INVALID
Date: 30 Sep 2002 17:50:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m23crr4gu0.fsf@pcwi1068.uni-muenster.de>
References: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de>
	<1033399610.1633.38.camel@elendil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1033399610.1633.38.camel@elendil>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher <blancher@cartel-securite.fr> writes:

> States a completly different concept than TCP connection, for it must
> also apply to UDP, or other layer 4 protocols, which can be
> connectionless.
> 
> A NEW packet is a packet for which Netfilter cannot find an existing
> state in conntrack table. This packet, if TCP, can be SYN, as it should,
> but also ACK, or any flag combination you want. This packet, if allowed,
> create a state that will match following packets.
> 
> An INVALID packet is a packet for which Netfilter cannot guess its
> state. Most of the time, it is ICMP errors that cannot be associated
> (i.e. RELATED) to an existing connection. You can also have ressources
> lack or bugs.

Thank you very much for this explanation!

> [...]
> 
> To be strict, your iptables command should be :
> 
> 	iptables -A INPUT  -m state --state NEW -p TCP --dport 22 --syn -j LOG --log-level 5 --log-prefix "IPTABLES: Legal NEW TCP: "
> 

In fact, I had a similar command, but this again allows
SYN+FIN-packets.

What I am doing now is
 
 "--state NEW --tcp-flags SYN,ACK,FIN,RST SYN"...

I was just wondering about the meaning of INVALID, which you
explained above.

Thanks again,

Jens


