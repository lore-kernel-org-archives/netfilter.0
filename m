From: Frank Gruellich <frank@der-frank.org>
Subject: Re: bad tcp packets
Date: Tue, 23 Nov 2004 14:59:10 +0100
Message-ID: <20041123135910.GT21819@der-frank.org>
References: <web-23112413@infinito.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <web-23112413@infinito.it>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* hamals@infinito.it <hamals@infinito.it> 23. Nov 04:
> Hello to everyone

Hi,

> I'm reading "Iptables Tutorial 1.1.19" by Oskar 
> Andreasoon, and I cant understand these bad packets rules

Well choosen.  Please, don't wrap commands.  I'll fix in quoting.

> $IPTABLES -N bad_tcp_packets
> #
> #
> # bad_tcp_packets chain
> #
> $IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \
> -m state --state NEW -j REJECT --reject-with tcp-reset

Conntrack treats a packet as state NEW, if it hits netfilter the first
time.  The first packet of a TCP stream will never have set both of SYN
and ACK.  This is the correct answer after a connection request (SYN)
from your network, but then it wouldn't be the first packet in stream.

> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \
> --log-prefix "New not syn:"

Same goes here: NEW in conntrack, but synflag not set should never
occure.  So LOG...

> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

... and DROP it.

> someone could explain me why that are bad tcp packets?

HTH,
 regards, Frank.
-- 
Sigmentation fault

