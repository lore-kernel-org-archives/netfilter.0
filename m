From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: How to send all packets to a router
Date: Mon, 24 Feb 2003 13:10:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302241310.52400.Alistair@nerdnet.ca>
References: <3C792059.865B267B@acabtu.com.mx>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3C792059.865B267B@acabtu.com.mx>
Content-Disposition: inline
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
To: Karina <kgs@acabtu.com.mx>, netfilter@lists.netfilter.org

On February 24, 2002 12:18 pm, Karina wrote:
> Hi, i have this problem..
>
> I have an iptables-box, that is the default gateway for all my internal
> addresses, after this box all the packets are sending to my main router.
> But now, I need to send one of my internal Class C to another router
> instead of the main one.
>
> I try with this line:
>
> $IPTABLES -T NAT -a PREROUTING -i eth0 -s $THISCLASS -j DNAT --to
> other.router.ip
>
> but it seems this is not working.
>
> If i setup a computer and i put as gateway directly the new router ip
> all works. But , if i setup this same comptuer and i put as gateway my
> iptables-box (all the computers have this settings) this doesn't work.
> The packets sent by my other ip addresses are going to main router as
> usual, but the other class is not going to the alternate router.
>
> Any ideas ?

	Perhaps you have the order of the NAT rules incorrect?
	This rule should occurr in the table *before* the default one
	that routes the rest of your network.

	Alistair

