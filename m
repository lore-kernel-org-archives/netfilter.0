From: Unknown <unknown@unknown.invalid>
Subject: Re: Strange logs...
Date: Sun, 11 Jan 2004 10:34:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <22941.5150512525$1073835434@news.gmane.org>
References: <002201c3d837$a6c70e90$1530a8c0@HUSH> <200401111340.27973.Antony@Soft-Solutions.co.uk> <004f01c3d84b$28d3c5a0$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <004f01c3d84b$28d3c5a0$1530a8c0@HUSH>
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
To: Carlos Fernandez Sanz <cfs-netfilter@nisupu.com>, netfilter <netfilter@lists.netfilter.org>

On January 11, 2004 08:59 am, Carlos Fernandez Sanz wrote:
> > That is just plain wrong.   You should not need a connection to your
>
> external
>
> > router in order to ping between two internal machines (assuming you are
> > pinging the real IP addresses, and not relying on a DNS lookup or
>
> something).
>
> Indeed....
>
> > Your IRQ/address etc setup looks fine to me, however there is clearly
> > something weird about the network hardware arrangement for you to get the
> > above-described ping behaviour.
>
> Such as the router and the switch being connected for no reason? I was
> obviously on crack when I set that up.... just found out that was the
> problem.... strange that everything would work perfectly for hours then
> stop working for minutes, etc... probably a table filling up in the switch
> or the router or both :-)
>
> Well, I made you waste a few minutes and wasted a nice sunday morning doing
> this instead of being with my girlfriend, on the bright side I got a spare
> network cable, give me your address if you want a slice :-)
>

	Getting outta bed late, I was about to suggest that there was an 802.11x interface on both the windersbox
	and the DSL router that was active ... *grin* -- but  yea extra wandering cable would certainly be the 
	problem.

	Just something to keep in mind -- I've seen it.

	Alistair.
> Thanks!

