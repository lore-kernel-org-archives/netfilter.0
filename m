From: Binarus <lists@binarus.de>
Subject: Re: Could somebody please explain priorities correctly and in an
 understandable way?
Date: Thu, 2 Mar 2023 08:58:04 +0100
Message-ID: <a8692a29-d289-6359-a66d-3c8b6d49946e@binarus.de>
References: <50521c01-3751-3882-1dd8-cd86be205d7b@binarus.de>
 <20230301160520.07ed6aa16c3f701035a8fc24@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=binarus.de; s=b201601;
        t=1677743885; bh=owfHqSoH7sESD9WvchB7lqZSomq6ywOS/gRg68mjs9Q=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Reply-To:
         Subject:Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:
         In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
         List-Subscribe:List-Post:List-Owner:List-Archive;
        b=LYGpvUetrGyTBx4A11W4LFuBi6OLpOQIAFYEv6aSq+1E1dkl6lDoVAz+QQU5gW/tH
         d9q71lX6kYhrBHO4+SsFQfl0FJASM0w3aIA/FaC3lY2muvakZQDfTRaKZE4pK4Urrw
         CCncIicrJkNVCVg24MfUT+MhE6VtvoWhesYMERrMoNAcmQz7LOXw0YcBmDiOmW/ztT
         LwDTB/YGx6kOjt583fZ6OgoT2/ftD9xKJW8qx1WbteWPLXve/lMq4NAcIfNzu83UMN
         JUiY4Gj200NZ0Z3pxIQtVrVTv2GoFNrscf4zHAE1zWCQQm/MOvpwCK4ZPBljDcudYv
         LyIKolHvUj5nBdRFPaUBdTMrVGtyDxDTR3W3XugpzZU0lTsiDAZ2YY/WMCjxXzeCMr
         U0k8K/ovu/wCFGc 
Content-Language: en-US
In-Reply-To: <20230301160520.07ed6aa16c3f701035a8fc24@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

At first, thank you very much for your long and detailed answer! At 
least I now know that I am not alone :-)

On 01.03.2023 17:05, Kerin Millar wrote:
> Indeed, this amounts to a very shoddy experience. Through experimentation, I discovered that the priority number is a signed 32-bit integer and that, for "type nat hook prerouting", the permissible range of priority values appears to be -199 through to 2147483647 (that is, 2 ^ 31 - 1). I consider this to be a bug, in so far as neither of these things or explained by - or can be discerned by - reading the nft(8) manual. At best, it states that "not all names make sense in every family with every hook", without explaining why or what the exact constraints are. The compatibility matrix beneath shows the symbolic names for various priority values, along with where they are conventionally used, yet leaves the reader none the wiser as to what, precisely, the constraints are.
> 
> In a sense, the real problem is that it's a leaky abstraction; it doesn't abstract away the requirement to understand Netfilter internals for the numeric values to be fully understood in turn. Take -300 ("raw") as an example. Assigning that to a prerouting hook will have its respective chain be traversed prior to connection tracking operations. But why? Presumably because it's below a certain threshold yet, even being an experienced nftables user, I find myself unable to explain. As concerns iptables, the consideration of priority values is fully abstracted by the requirement to make use of built-in chains, albeit at the cost of not being able to employ an equivalent hook more than once.

That's exactly what I think, too.

> For the time being, my advice would be to stick to using the symbolic names.

Usually I prefer symbolic names over hard-coded values. The problem here 
is that I don't know what name I should use in what situation.

For example, in the table you mentioned there are no less than eight 
rows for the ip family that contain the prerouting hook as "typical", 
each of them denoting a different priority. Five of these rows contain a 
symbolic name for the respective priority. It seems that we must read 
the "description" column in that table and must guess from it what row 
matches a certain tuple of family, chain type and hook (and possibly, 
rule actions) best.

Or, looking at it from the opposite perspective: For example, for what 
combination of family, chain type and hook would the keyword "raw" 
(priority -300) be appropriate? Does the answer to that question also 
depend on the actions the rules in the chain perform? That would be 
weird, because then most chains could only contain a very limited number 
of rules that perform "similar" (priority-wise) actions.

I even wouldn't be surprised any more if rules would misbehave because 
they are in a chain with wrong priority. For example, a rule dealing 
with fragmented packets (I don't know whether such a thing is possible, 
but let's assume it for a moment) probably must run with priority lower 
than -400. I can very well imagine that this rule would do nothing if 
it's in a chain with higher priority without letting you know; that is, 
without making nft throw errors when loading that rule. Of course, that 
would be catastrophic.

The more I think about it, the more worrying it becomes, and the less 
trust I have in nft.

> For instance, your hook could be written as "type nat hook prerouting dstnat". In the course of transitioning to nftables, you may find it useful to inspect how built-in iptables chains end up being translated.
> 
> # nft flush ruleset; iptables-nft -t nat -A PREROUTING; nft list ruleset
> table ip nat {
> 	chain PREROUTING {
> 		type nat hook prerouting priority dstnat; policy accept;
> 		counter packets 0 bytes 0
> 	}
> }
> # nft -n list ruleset
> table ip nat {
> 	chain PREROUTING {
> 		type nat hook prerouting priority -100; policy accept;
> 		counter packets 0 bytes 0
> 	}
> }

Thank you very much for that example. I am regularly using that method 
when trying to learn :-)

> 
> In the case that you require for multiple hooks of the same type, it's worth noting that priority values can be expressed in relative terms. For instance, "dstnat - 1" would translate as -101 and would be within range. As concerns the effects of relative priority values, I think that https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority constitutes the best material that is currently on offer.

I have seen that page, but it doesn't help with the basic problem.

Since nft is an undocumented black box, I currently can't use it. I 
can't accept the risk of unexpected behavior, given that nft is used to 
configure firewalls, which are typically the core of information 
security. Since your answer is still the only one, I have to assume that 
there indeed is no better documentation somewhere else.

We now have no other option than dropping the project and sticking with 
our current firewall scripts based on iptables. Too sad that we already 
have put substantial time in trying to learn nft ... we'll revisit it in 
one or two years and see whether the documentation has been improved then.

In every case, thanks a lot again, and best regards,

Binarus


