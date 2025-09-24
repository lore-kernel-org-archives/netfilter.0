Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0BB1922F6
	for <netfilter@vger.kernel.org>; Wed, 24 Sep 2025 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716243; cv=none; b=ltequFdI/z2Q8Cp+8FY5Y4Ybn4WQN39Y7Cc4FjPEJmLpibHQhMMF3GRuW+/tAsy7JlSGQd1MF+rvT5T7eGhU5hl5563OThXrt+x09OpEJ4zcHBfWe4cYRRSPKRBTZk+XlZ4SY2n/kLrAETcPI/LPB4j/t0jpFsmrd/K3RgJNxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716243; c=relaxed/simple;
	bh=9NjwYtDa4fCf2MM8+BTKTg8k6e50OQhlIOya58xT6wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajFsd81GJofX5jRFq4NYJPVtHgqid9xoYNDa1g/EqNyD0DXQZhYymKWl4StqpXNsAfaL47B+Hk84y2Sih6pxm83EEtwIag7zUyH1b2/SC49FltLC+Jb5oBD3tgpjGUyk69zWrE4q+c9uQvIDPFUYaGWxQL+cBSszzh+i6tiOzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 8B1D9601A6; Wed, 24 Sep 2025 14:17:11 +0200 (CEST)
Date: Wed, 24 Sep 2025 14:17:11 +0200
From: Florian Westphal <fw@strlen.de>
To: Christoph Anton Mitterer <calestyo@scientia.org>
Cc: netfilter@vger.kernel.org
Subject: Re: some questions on nft
Message-ID: <aNPhP63SyX2ofE92@strlen.de>
References: <5a7d4a11bdeb50123e68df16726c4d1b461d2fd7.camel@scientia.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a7d4a11bdeb50123e68df16726c4d1b461d2fd7.camel@scientia.org>

Christoph Anton Mitterer <calestyo@scientia.org> wrote:
> 1) I there any difference between e.g
>       ct state established,related accept

You can use nft --netlink=debug, that should explain the difference.
This is a bit-test, matches if either flag is set.

>    and
>       ct state {established,related} accept

matches when established is set but not related and vice versa.
Given established and related are mutually exclusive, both do the
same thing but the former is a bit faster.

>       add rule inet my_table my_input meta l4proto '{ icmp, ipv6-icmp }' accept
>       add rule inet my_table my_input meta l4proto udp ct state new jump my_udp_chain
>       add rule inet filter output meta l4proto tcp
>       add rule filter input meta l4proto { tcp, udp }  th dport 53  counter packets 0 bytes 0  accept  comment \"accept DNS\"
> 
>    Am I correct, that l4proto has to be used in these, simply because
>    the respective protos are matches as a whole, and e.g. the tcp/udp
>    header expression cannot be used because one would need to add
>    something like dport?

'udp dport 53' would not match tcp (it internally adds l4proto udp).

>    But as soon as one does want to do that anyway (e.g. using
>    tcp/udp dport or some icmp icmpv6 type), is there any difference or
>    disadvantage when leaving out the meta l4proto match and just doing
>      tcp ..
>      udp ..
>      icmp
>      icmpv6 ..
>    ?
>    AFAIU, tcp/udp would just work in both v4 and v6 while icmp would
>    only apply to v4 and icmpv6 only to v6 packets automatically.
>    So an obscure ICMPv6 over IPv4 wouldn't be matched, right?

No, would not be matched.  You can check --netlink=debug to reveal
the internal dependencies that nft will insert to prevent false matches
on random packets.

> 3) I've seen examples like:
>       ct state vmap { established : accept, related : accept, invalid : drop } 
>    where a vmap is used, which is a nice way of writing it down.
> 
>    But is this slower (when it internally uses some hash or so) than
>    e.g. two rules:
>        ct state established,related accept
>        ct state invalid accept

Heavily depends on the circumstances, IIRC the set lookup costs are more
expensive than a single rule only doing payload checks. but its faster
when replacing at least 3 rules.

> 4) In principle I prefer the syntax as returned by nft list over the
>    one using single commands, like:
>      add rule ...
>    is there any documentation on how the block based syntax is
>    merged when using include? Or is that even officially supported?

Its expected to work, yes.  Not aware of any documentation.

>    But no idea how his would be done with sets, etc.?
>    Or is this simply a: don't do such stupid things?

Well, its always a good idea to NOT do stupid things :)

> 5) Many examples use:
>      iif lo
>    or
>      iifname lo
> 
>    Now first, if I'd bring down lo and bring it up again (like it may
>    actually happen with eth0/wlan0 and others)... would it get a
>    different id, and thus no longer be matched by iif?

No, lo is always 1.  For other devices, yes, might get different id.

>    In particular for lo, wouldn't it anyway better to use
>      iiftype loopback
>    (which would simply match all loopbacks, regardless of their name)
>    or is there any disadvantage I can't see?)

Hmm, why would anyone add another loopback device?

> 6) Probably not possible, but can one match v4 and v6 addrs in one rule
>    (when being in the inet family)?
>    Like in:
>       ??? daddr @addrs tcp dport 22 accept
>    with @addrs containing v4 and v6

No.

> 7) Also not possible, AFAICS, but was it ever considered to allow
>    using sets within (v)maps or even other sets?

No idea. I don't like it because it slows things down (need to
iterate and then query several sets).
