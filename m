From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptables scripts
Date: Fri, 31 Oct 2003 08:54:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310310854.34327.Alistair@nerdnet.ca>
References: <Pine.LNX.4.44.0310310819220.6460-100000@localhost.localdomain>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310310819220.6460-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>, Chris Brenton <cbrenton@chrisbrenton.org>
Cc: Gilles Yue <gyue@novelgmt.intnet.mu>, iptables mailing list <netfilter@lists.netfilter.org>

On October 31, 2003 08:22 am, Robert P. J. Day wrote:
> On 31 Oct 2003, Chris Brenton wrote:
> > On Fri, 2003-10-31 at 07:26, Robert P. J. Day wrote:
> > > for the iptables tutorial i was talking about that i'm giving on
> > > monday, here's the first part of my script, just to show folks what
> > > they can do:
> >
> > This is *totally* cool. Thank you for sharing this with the list! :)
> >
> > The only thing I would add would be:
> > iptables -F INPUT
> > iptables -F OUTPUT
> > iptables -F FORWARD
> > iptables --table nat --flush
> >
> > or what ever you need. This way you can run it from the command line and
> > clear out all existing rules before you write everything back in.
>
> ah, grasshopper, i didn't show you the other two scripts i'm going
> to demo.  first, there's the lockdown script, to be run if you realize
> you've been hacked:





	You might NOT want to run this from ssh sessions!!!
              *grin* ... sure to most of us this is obvious....not 
	however to everyone ... 

> ---------------------------------------------------------
> #!/bin/sh
>
> # PANIC!  Lock the machine down.
>
> IPT="/sbin/iptables"
>
> # Flush all chains.
>
> $IPT -F			# by default filter
> $IPT -t nat -F
> $IPT -t mangle -F
>
> # Delete all user-defined chains.
>
> for table in filter nat mangle ; do
> 	$IPT -t $table -X
> done
>
> # Reset all policies to DROP.
>
> for chain in INPUT OUTPUT FORWARD ; do
> 	$IPT -P $chain DROP
> done
>
> echo "System totally locked down."
> -----------------------------------------------------------
>
>   and then there's the "clear all" script, which you would run
> if you made a total mess of your rules and just want to clear
> them out:
>
> ----------------------------------------------------------
> #!/bin/sh
>
> # PANIC!  We've screwed up our tables.
>
> IPT="/sbin/iptables"
>
> # Flush all chains.
>
> $IPT -F
> $IPT -t nat -F
> $IPT -t mangle -F
>
> # Delete all user-defined chains.
>
> for table in filter nat mangle ; do
> 	$IPT -t $table -X
> done
>
> # Reset all policies to ACCEPT.
>
> for chain in INPUT OUTPUT FORWARD ; do
> 	$IPT -P $chain ACCEPT
> done
>
> echo "System totally open, you are now fair game."
> -------------------------------------------------
>
>   the tutorial will suggest that users can incorporate
> the above in their main script any way they want.
>
> rday

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

