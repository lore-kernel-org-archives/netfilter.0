From: Achim Dreyer <adreyer@math.uni-paderborn.de>
Subject: Re: iptables scripts
Date: Fri, 31 Oct 2003 14:56:24 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310311452490.24507-100000@kepler.uni-paderborn.de>
References: <Pine.LNX.4.44.0310310819220.6460-100000@localhost.localdomain>
Reply-To: adreyer@math.uni-paderborn.de
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310310819220.6460-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Fri, 31 Oct 2003, Robert P. J. Day wrote:

[..]
> ah, grasshopper, i didn't show you the other two scripts i'm going
> to demo.  first, there's the lockdown script, to be run if you realize
> you've been hacked:
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


I shurely would set the default lockdown policy _before_ flushing the 
tables as there is no matching rule forcing a drop of packets between
the flush and the policy set ->  packets could slip through!



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


in this case it doesn't matter as the end result will open all gates ;-)





Regards,
Achim Dreyer
--
A. Dreyer, Senior SysAdmin (UNIX&Network) / Internet Security Consultant


