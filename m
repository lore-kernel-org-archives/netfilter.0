From: "michel banguerski" <banguerski+nfdev@gmail.com>
Subject: Re: ipset performance question
Date: Tue, 21 Aug 2007 16:48:28 +0200
Message-ID: <cba9bb580708210748x382b06a2v1a9d1a1bc94a9ce7@mail.gmail.com>
References: <cba9bb580708201630q7f8b1691naccd6cbd3422ce88@mail.gmail.com>
	<Pine.LNX.4.64.0708211428300.28106@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=abMVJJbC/yIX5/vt5awaGvGHSLokTCl39FSn2zCnTlMnYPgFsZnoadU/O2BJfcqcQhS1N6tEf9sTfEa2pnVfcX+XDfo/X3HVIaAhe6giwQ7pXsYbGiHMEcYnPcRb0aZZ6p8uiJZus0kAXNPu3IF8zozRRRp7gLnjPMIJ75Blw98=
In-Reply-To: <Pine.LNX.4.64.0708211428300.28106@blackhole.kfki.hu>
Content-Disposition: inline
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
content-type: text/plain
To: kadlec@blackhole.kfki.hu
Cc: netfilter@lists.netfilter.org

Thank You for the answer Jozsef.
[...]
> > - is this worth doing at all ?
> > we may have one rule with four matches (three if we resort to binding
> > but it seems obsolete):
> >  iptables -A A_CHAIN -m set --set snh src \! --set siph src --set dnh
> > dst \! --set diph dst -j A_TARGET
> > instead of four rules with one match each (see example above).
>
> Hard to say much. From ipset point of view, iff there are identical number
> of set lookups, then it does not matter, but ipmap types are faster than
> hashes. From iptables point of view, due to the implicit internal
> checkings (src/dst IP addresses and interfaces) you should minimize the
> number of the iptables rules.

As I understand it, here's the choice:

a) 4 rules; 2 ipmap and 2 nethash tests with hope to skip nethash(s)
and 1(2) rules if the address(es) of inspected packet are in ipmap(s)
b) 1 rule; 2 ipmap and 2 nethash tests with no hope to skip any of them

To recap I'd say it depends of the ratio <number of subnets>/<number of IPs>
if the ratio is high and most packets are probably going through
nethash test anyway, choice (b) makes sense. Otherwise stick with (a)


>
> > - wouldn't it be more efficient to use ipmap instead of iphash ? (I think yes)
>
> Yes.
>
> > - what about multiple ipmap sets if {C\B} is too sparse ?
>
> That'd involve multiple iptables rules as you cannot express OR matches in
> one rule, just AND ones (and there is no "union" set type yet).
True, "OR" is our enemy here.
But since we need ~{C\B} actually, it becomes an AND:
~{C1\B} AND ... AND ~{Cn\B} = ~({C1\B} OR .. OR {Cn\B})
so it's OK.
The question here is: how N*ipmap (used in the same rule) compares to 1*iphash?
What are the values of N when one iphash is faster?

>
> > - using similar tricks sometimes it may be possible to use in the same
> > rule two nethash sets of total size smaller than the size of the
> > original one nethash could it be efficient?
>
> Real testing could answer it best.
>
> But please take into account how much resource you use to compute the
> "best" set/rule combination. Does it worth if you cannot gain really much
> or if you loose the possibility to quickly add or delete IP addresses from
> anywhere?
Yes, this is an issue I am aware of.
In my case sets will be treated as read-only.

The fact is that I deal with hierarchical groups and later I will add
intersections subtractions between them.
Any change to the original rule-base/groups will lead to a
recompilation of a new iptables/ipset configuration.
This means that I could not take advantage of some cool features like
changing sets from rules or swap them for faster configurations.
To make things even worse I plan to generate in the future a BDD
structure of chains that will "refine" the packet before applying only
a subset of real rules, making the whole mess totally unreadable and
unmodifiable by a human (a single IP change could lead to a whole new
BDD).

To cope with limitations above, my compiler generates versioned chains
subtrees that could coexist in the same table allowing an instant
roll-out and roll-back and even to process a packet by multiple
rule-bases.
In addition this approach leaves room for independent uses of iptables
where ipset could be fully exploited.

In this perspective, resources needed to generate required sets are to
estimate on another scale (I'd say that for a complex ruleset
1-2minutes to compile are perfectly acceptable).

BTW I saw it is planned to replace binding with something else, is it
possible to have some insight on what it will look like?
>
> Best regards,
> Jozsef
[...]

Thank You
Best regards,
Michel

