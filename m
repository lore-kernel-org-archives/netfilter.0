From: "David Ashwood" <david@inspiredthinking.co.uk>
Subject: RE: Log Problem
Date: Mon, 9 Aug 2004 19:11:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091311314.SM01376@Hope>
References: <200408091758.59638.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408091758.59638.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org


Thanks for responding Anthony,

1) Same problem as before ' iptables: No chain/target/match by that name'

2) User defined chains work - and I can put a drop rule without problems.

Kernel:
A new box just bought - I thought the kernel was old - but I had to demo a
product for a client - and wanted to get that done before I pester the VPS
hosts to upgrade the kernel.

I can see the libraries on the box for both logging and User Space Logging -
seeing if their being used is harder to establish.

I guess the kernel install didn't do a proper job of installing iptables.


David

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Monday, August 09, 2004 6:59 PM
To: netfilter@lists.netfilter.org
Subject: Re: Log Problem

On Monday 09 August 2004 5:40 pm, 'Me' wrote:

>  Hi,
> I'm having problems logging packets (IPTables: 1.2.8 Kernel: 2.4.8) with
> the following rule (from the  FAQ):
>
> iptables -N logdrop
> iptables -A logdrop -j LOG
> iptables -A logdrop -j DROP
>
> On the log line I get:
> iptables: No chain/target/match by that name
>
> I'm a little lost - any pointers?

It seems unlikely, but has your kernel been compiled without support for the

LOG target (and by the way, why are you using a three year old kernel 
anyway?)?

Test one thing at a time:

1. Can you use the LOG target?
iptables -A INPUT -j LOG

2. Can you put a rule into a user-defined chain?
iptables -N logdrop
iptables -A logdrop -j DROP

If both the above tests work, then there is no reason you shouldn't be able
to 
put a LOG target into your user-defined chain (so check very carefully the 
syntac of what you are typing when you get the error, etc).

If one of the above tests fails, you know where the problem is.

Just one last thing to check - you haven't compiled the userspace iptables 
tool without also recompiling the kernelspace netfilter part, have you?

If you do one of these, you should also do the other to match.

Regards,

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell

more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the
list;
                                                           please don't CC
me.






