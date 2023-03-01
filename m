From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Could somebody please explain priorities correctly and in an
 understandable way?
Date: Wed, 1 Mar 2023 16:05:20 +0000
Message-ID: <20230301160520.07ed6aa16c3f701035a8fc24@plushkava.net>
References: <50521c01-3751-3882-1dd8-cd86be205d7b@binarus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677686722; x=
        1677773122; bh=L4hGS8JIgobDfNmmYemUDsLwABeIfJiZ7530KJBYKdg=; b=t
        fC6QCN0TLk+VHngO7oxVoKTZAA8SMJagtDElIQkeSnLnuZN5K2+LBnv7MGd8eXoS
        vzoQthFFnlO6sHLS1e+O67xAfA5BE7TdqqfvvUatIMcelhs2AQ5DNpxjpHIwclg3
        UhNu905mxnioSz3RNYTPwFtCQ5ZHylYr+ki9MfqnIduuT3v+NAfBKi/AjzKLtmw1
        CVhBlMymPQK/8ig5qOdhVTTWjh9Z5NqvFqqRuTcYgLVzp/h5yQ13CcVuWWsJfda4
        pqGTcQTn8I6+zpLBnb+Vb1uvs3I3memMCui8mqza4QsZ83GbZ5sXgntmKeY+p1Qz
        X2Qrv8/NOkZ8SpjRgMjVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677686722; x=
        1677773122; bh=L4hGS8JIgobDfNmmYemUDsLwABeIfJiZ7530KJBYKdg=; b=L
        1k1pfOonUATA4VNoAE5kV8/qdLJX0oLnHrQR6dy9TYEEoX0CVAwgbokyK6eYsrXv
        O3+VTPi+qPIMgtMqcFuyI6u8bvgWdZuByz+mYUvuuR6PhOKMTPpbEIVo9XnGTUa8
        krRrCwgdQdIf2k8orvJGEyipgxUtxjHJbdkNHtxXqD8TuR+07Ntil5Wtweb1WQ90
        dxHnsRypuQgmLXgx+XfWcP8rWcxwuKPRXSMfBMew1k2s7D+nz/GJNQqaj7xlZ/K7
        ayPEa3kWkv8E8Sa9g5+fZx0WW5YbPFxfZTGa/S0nSZ6JizGFcNbDElpTl++3oy24
        UEx0fUyPfYs6yL37uiXOg==
In-Reply-To: <50521c01-3751-3882-1dd8-cd86be205d7b@binarus.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Binarus <lists@binarus.de>
Cc: netfilter@vger.kernel.org

On Wed, 1 Mar 2023 12:16:37 +0100
Binarus <lists@binarus.de> wrote:

> Dear all,
> 
> I am currently migrating our iptables-based firewall scripts to nft / netfilter, and I am having an extremely hard time with trying to understand priorities. Let's start with a citation from the manual (https://www.netfilter.org/projects/nftables/manpage.html):
> 
> "The priority parameter accepts a signed integer value or a standard priority name which specifies the order in which chains with same hook value are traversed. The ordering is ascending, i.e. lower priority values have precedence over higher ones."
> 
> Well, that should be clear so far. At least I thought.
> 
> My problems began when I had the following configuration file (nonsense of course, just for testing)
> 
> table ip t_IP {
>    chain nat-prerouting {
>      type nat hook prerouting priority -500; policy drop;
>      log prefix "foo: " drop;
>    }
> }
> 
> and tried to load it:
> 
> nft flush ruleset
> nft -f nftables.conf
> 
> Output:
> 
> nftables.conf ... Error: Could not process rule: Operation not supported
> nftables.conf ... Error: Could not process rule: No such file or directory
> 
> Because of respective hints in the netfilter wiki, I spent the next few hours with checking whether my kernel had all modules and with re-reading the documentation to verify that nat chains provide a prerouting hook. (Of course they do, and everything was OK with my kernel).
> 
> Several hours later I noticed by accident that no more errors occurred with a slight change in the test configuration:
> 
> table ip t_IP {
>    chain nat-prerouting {
>      type nat hook prerouting priority -200; policy drop;
>      log prefix "foo: " drop;
>    }
> }
> 
> So the reason for the errors was the wrong priority; that took me half a day to find out due to the misleading description of possible sources of that error in the wiki.

Indeed, this amounts to a very shoddy experience. Through experimentation, I discovered that the priority number is a signed 32-bit integer and that, for "type nat hook prerouting", the permissible range of priority values appears to be -199 through to 2147483647 (that is, 2 ^ 31 - 1). I consider this to be a bug, in so far as neither of these things or explained by - or can be discerned by - reading the nft(8) manual. At best, it states that "not all names make sense in every family with every hook", without explaining why or what the exact constraints are. The compatibility matrix beneath shows the symbolic names for various priority values, along with where they are conventionally used, yet leaves the reader none the wiser as to what, precisely, the constraints are.

In a sense, the real problem is that it's a leaky abstraction; it doesn't abstract away the requirement to understand Netfilter internals for the numeric values to be fully understood in turn. Take -300 ("raw") as an example. Assigning that to a prerouting hook will have its respective chain be traversed prior to connection tracking operations. But why? Presumably because it's below a certain threshold yet, even being an experienced nftables user, I find myself unable to explain. As concerns iptables, the consideration of priority values is fully abstracted by the requirement to make use of built-in chains, albeit at the cost of not being able to employ an equivalent hook more than once.

For the time being, my advice would be to stick to using the symbolic names. For instance, your hook could be written as "type nat hook prerouting dstnat". In the course of transitioning to nftables, you may find it useful to inspect how built-in iptables chains end up being translated.

# nft flush ruleset; iptables-nft -t nat -A PREROUTING; nft list ruleset
table ip nat {
	chain PREROUTING {
		type nat hook prerouting priority dstnat; policy accept;
		counter packets 0 bytes 0
	}
}
# nft -n list ruleset
table ip nat {
	chain PREROUTING {
		type nat hook prerouting priority -100; policy accept;
		counter packets 0 bytes 0
	}
}

In the case that you require for multiple hooks of the same type, it's worth noting that priority values can be expressed in relative terms. For instance, "dstnat - 1" would translate as -101 and would be within range. As concerns the effects of relative priority values, I think that https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority constitutes the best material that is currently on offer.

-- 
Kerin Millar
