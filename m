From: Mohan Khurana <mkhurana@andrew.cmu.edu>
Subject: Re: SNAT matching question
Date: Sun, 29 Sep 2002 12:26:37 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44L-027.0209291222490.1180-100000@unix4.andrew.cmu.edu>
References: <20020929151220.BHYV6699.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929151220.BHYV6699.mta01-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Incoming connections does pose a problem.  So I assume that the problem is
that a packet comes in to a locally hosted server, this is no problem.
The problem occurs when packets are flowing back out, since they may go
over the wrong interface due to the equalize nexthop.

right?

thanks again for your help,
mohan

On Sun, 29 Sep 2002, Antony Stone wrote:

> iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to $pubIP1
> iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to $pubIP2
>
> (Note that PubIP1 is not 1.2.3.4 - that address is on router 1.   Similarly
> PubIP2 is not 5.6.7.8 - that address is on router 2.)
>
> Then when the replies come back in again (they will come through the same ISP
> as the outbound packet left, because that's the way PubIP1 and PubIP2 are
> routed), they will reach the netfilter box, which can do the reverse NAT, and
> send the packets on to the original source somewhere inside your LAN.
>
> Just don't ask about how to do this for incoming connections (ie servers on
> your network instead of clients).
>
> Antony.
>
> --
>
> It is also possible that putting the birds in a laboratory setting
> inadvertently renders them relatively incompetent.
>
>  - Daniel C Dennett
>
>
>


