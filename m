From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: recently confused about setting a chain policy
Date: Wed, 30 Oct 2002 09:13:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021030091310.DJZA459.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210291846470.18730-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210291846470.18730-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Wednesday 30 October 2002 12:29 am, Robert P. J. Day wrote:

> ok, based on Antony's response, there's a *bunch* of things i want
> to make sure i understand:

I've provided my answers below, but anyone else who understands this stuff 
please feel free to jump in and back me up, or put forward a different point 
of view...

> 1) i know that, for most "iptables" commands, if you don't specify a
>    table, the "filter" table is the default.  i didn't realize that
>    this also referred to setting a policy as well.  although, when
>    you think about it, since policies are used predominantly for
>    the filter table chains, it's not surprising you never see them
>    being used for any of the other tables.
>
> 2) what other policy targets can i set for the filter table chains?
>    sure, everyone uses DROP or ACCEPT, but is it legal (or even
>    meaningful) to set another target?

man iptables says that valid targets for chain policies are ACCEPT DROP QUEUE 
and RETURN.

Obviously most people use one of the first two.

>  can i do
>
>    # iptables -P INPUT REJECT
>
>    since REJECT is a valid filtering target?

No, rather surprisingly.   I expected to be able to do this to some time ago, 
but it turns out that REJECT is not a valid policy target.

>    or LOG?

No, LOG is not a valid policy target either, mainly becuase it doesn't 
actually do anything as far as the fate of the packet is concerned.   Yes, it 
logs the fact that "a packet went past this rule", but it doesn't tell 
netfilter what to actually do with the packet.

> 3) how is it even meaningful to have a policy of DROP on a chain
>    in the nat or mangle table?

Depends on your definition of meaningful :-)

You can DROP packets in the nat table if you want to.   It's just that most 
things will break (specifically connection tracking) if you try to.

>    doesn't this imply that DROP is a valid target for a nat or mangle table
>    rule?

Yes, it is :-)

>    i was not aware that you could even *have* a target of DROP on a nat
>    rule.   what does that mean?

It means the packet will be dropped.   That's all.

If you create a rule in your nat table with a DROP target then packets which 
match the rule will be dropped.   It's not the recommended way of doing 
things, and you have to be careful what rules you apply it to, but it can be 
done.

If you set a default policy of DROP on your nat table then most likely 
netfilter simply won't work.   You will find it DROPs all sorts of packets 
you would expect it to pass through, specifically any replies matched by the 
connection tracking code as part of an ESTABLISHED or RELATED connection.   
These packets are automagically handled in the background of the nat table - 
there are no explicit rules for them (ever thought about that ?), but they 
are subject to the default policy on the table.

At this point it might be worth remembering that with computers, not 
everything that is possible is sensible...
 

Hope this helps ?
 

Antony.

-- 

This email was created using 100% recycled electrons.

