From: Yury Bokhoncovich <byg@center-f1.ru>
Subject: Re: Is DIVERT w/o forwarding feasible? (fwd)
Date: Wed, 11 Sep 2002 09:02:54 +0700 (NOVST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209110839230.13349-100000@panda.center-f1.ru>
References: <200209101253.g8ACrsv06951@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209101253.g8ACrsv06951@vulcan.rissington.net>
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

Hello!

On Tue, 10 Sep 2002, Antony Stone wrote:

> > unwanted packets from outside by forwarding set OFF.
>
> Sounds like a proxy firewall to me, not a packet filter :-)

The best is to combine both, IMHO.=)
In fact I just need a secure way to unite our LANs in different districts
of the city (i.e., divert ALL traffic from a host 1A from location A to a
host 2B from location B and vice versa).

>
> > Let's not discuss the reasons to disable kernel forwarding and to have
> > "transparent" diverting! Just give me a clue if you can!
> > I didn't catch purpose of PREROUTING target, can it help in my issue?
> > IIRC, there was a patch for FBSD's ipfw some time ago to make diverting
> > w/o forwarind enabled. I'm looking for something alike but for Pingo.:-)
>
> The PREROUTING chain is for changing the destination address (in the nat
> table) or otherwise mucking about with the packet headers (in the mangle
> table) before the kernel routing system gets to look at it.

Mmm...in other words, can I use the chain to deliver a packet to a
special kernel module or a userland program (e.g., stunnel, ssh, etc. :-)
before the kernel routing touch this?8)

>
> I don't see that it would help you get packets to go through the machine if
> kernel forwarding is turned off, because the kernel will simply not send
> packets between interfaces in this situation.

Mmm...in other words, can I use the chain

>
> I notice you said above that "The best known firewall in my practice is
> complete denying of unwanted packets from outside by forwarding set OFF."
>
> Since it is packets from the outside that you want to block, why do you say
> that the following two rules at the top of the ruleset will not work
> effectively ?
>
> iptables -A FORWARD -i $extIF -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i $extIF -j DROP

These rules will work if they will be here.;)

-- 
WBR, Yury Bokhoncovich, Senior System Administrator, NOC of F1 Group.
Phone: +7 (3832) 106228, ext.140, E-mail: byg@center-f1.ru.
Unix is like a wigwam -- no Gates, no Windows, and an Apache inside.



