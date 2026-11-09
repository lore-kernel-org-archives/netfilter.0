Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242708;
	b=Uawzqnz+43l1Dkwwzlp4SeVDAuuAB99SYFsg/VGZP3QO5/LNVPvIo83paqUldAoG7RoB
	 mqrB0VtSEJRwVw35Jyvj6cknKJjEJpUA8+tK7aHD/KNa4NT8W9vuaCCzsamFlsJ9gRtwp
	 c+83fJ5Q4e89AVMnlbWDIUzfhat2pcyB2ewwTzMgCr3skuutIR0NuD4wz5/l1TPeMavLs
	 uNf9/oFMn2F5lhTXAga6AbElKXuLt6mwNwP55XtqDl9OQ9t/RWMO+FF/zgWE9cI1yIcLw
	 3/c9MBF0AmjLkTdeNizF4Ewh5ZgRs4cDKyHdvyqtTurcxW3hf8NRzxKp0ZlCz8KGr6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=vdSA0nvvn6HacDbbABj5AZq7vF2ZT5eS8YpIQE8nchc=;
	b=hoeWljlgm/GpqvFqkZucput67TttG5WVC9CFWJO6BiOoqIZB23To+MyF1uIV+hmQKoFK
	 xorUHRmDdKWhgk+TUA0PTnFLTm/WGmtDUQTrTEJf6ylxMAcIWxoIMq2YZoOWXBXoMfh18
	 Ep7qZOUa4GUSZSc91xbVp8gkXSSN5vZSfr5sXBF2BqCVht2N7voxMIoPP7/BrehTS4i6f
	 lwLIZNGZiusn8L0zvsHjfPboP0mIuaiytr/Fdo7/Fs2Le8lifNCyA3o2Vq+dwwU8yjE4A
	 OkRM2GIrUhOB86fmH74Bp5MVG8yBiXIVmgnmW4hJx8vxIjvwquxDkh+iN+oGreOmycg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bT0R/sZ0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D47606EEB3
	for <netfilter@vger.kernel.org>; Mon,  9 Nov 2026 16:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D47606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bT0R/sZ0
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c450ab1483cso176749266b.3
        for <netfilter@vger.kernel.org>; Mon, 09 Nov 2026 08:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794242706; cv=none;
        d=google.com; s=arc-20260327;
        b=JhvM7eLBT6sam18Lnb0YcCGHqqLVlGuhy+gC6deYE6Bv9gld8ytU+qmsL8zTqAkkSS
         7IZ4Vjze+j34nuB6NoHMi6vEFvb1QPVsXv3rkXLEgBFUVeela2EHrVPks+YPXopP8ob6
         lyslaXrzuEHn8eK92KnXRYnEV7zWST9eOAzSWi/dF5OJPEYLyJ0+fNeYmMQ7xWPcrxhW
         s8/S8RXA8VfoWUhnSKu1918wu1Dvcv74plrzfZV4uKF+cP+y/LCU/YHDaCuW/AJVeVn/
         iFnu1GAHkdugNWZf9boB8+FvVvEmYp7v1h5adJauctOqxRf3ROJ3/Kds97He7A5nSIac
         brBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vdSA0nvvn6HacDbbABj5AZq7vF2ZT5eS8YpIQE8nchc=;
        fh=Z4d4/AUN76mK238x9qSkgzqWd/Ow+0yx8b46HJI7st8=;
        b=D70bCAi0GynfJVKSUc+xQbcqsaADn2F8exiVrm0O9wgYsS9qalPcfKRhyEOWTOvh6e
         lWtOkzZmp33ZaSHrOiwth+IMBH47wf+irvJtWc9TwVdjyWjAbbjq0QGPtN5txKkwRZ1e
         xWw4N66xnkvmqMbaczy1gf0ZlO07mcCNQ6/QuwZHLvKN+EC+YN8FZ6cdGryH/0JLhc0K
         LNR5ubFeteHEYsZFlr42LD2cfpl13wJeWka7vKQeZklWkDbiSQ5xDYgh2BsVouiVOka3
         uIAVogEGCQUUgR3ZN2Y+Xf1NkI63PfOVEZtYYw5nGB347fO07tfIl4ZQBmUrpMmid99m
         oAAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242706; x=1794847506; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdSA0nvvn6HacDbbABj5AZq7vF2ZT5eS8YpIQE8nchc=;
        b=bT0R/sZ0ZWUCHAXghZHLYgvCNJNHwh+a1YywPxuJQvxMbqAvl8j2xwAapA40PNMMYw
         fkemwtgUPQpZUR6ihJrjL4WHur1uelGahM92vPB1qrTuPxVkcmmpS5rltdo8lZRI5iG8
         51C+w/ex9Ui42eKLEcwJ/WsTag2Pb7HHvsJq7haFdPRjW76AshrnysBMn50ouBNFVeMO
         lJGdCeU6bWSGLR1Z573cP6Vt376RYtTlQF89JsdQlORlLlT581D7mXDNQDHSeJOjnoW5
         zb4XgGODh1TYPFA1aDlMj/s+xOQhAPWOH6TnCQ7Cw6lOBYdXsOh1PeLh3c/ofBkwye7P
         85mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242706; x=1794847506;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdSA0nvvn6HacDbbABj5AZq7vF2ZT5eS8YpIQE8nchc=;
        b=bsMZGMh567syufAapomUzMBVOeU5gThF14+EiBOsZ6cHz1c8BlWVgsZlMetUMO6Ff4
         rDYHq5aZascx5xLDOjy+dqoJBT8giHtH683b5ONIMVpIHZdztL+2VlNiYD9Rdvx/t2S5
         xhS1Pj0U5V03iE3yyXW62hVWTqjaM0m11JozV9hZq7lRpyY8K3MyTLaI4cp2stS9thx3
         ZhAPU3yt6ARHrJotnHTkIXBHOBx4Qxf+xzOkaBUcA1auzTAlmVVFn2mv/gaCnMV3SxT4
         AJtmIDMruM6HmxwDXAjB10bG9ix42sdSNrPC97Y6v2HhKnhLi1NZ4MTiSrUDjuMQoL9r
         cM2g==
X-Gm-Message-State: APuU4Z/aDWTrm4KePOVae9qnXNZNeFPo1iceb4fHOhqTPEmgD5gkDfnv
	Avz5IH1DLPWNDJg0zWAc6JN12POpgntUISPPph4ZLKqxR+8YqLhbrN6yw8pn6rN3mp3oMawVHgi
	FIV3qh+Hlce/a7MyD+5MZxg0mBTvuDeJlBdQhPE89SA==
X-Gm-Gg: AYBFou1BqoGd67nZgsVoPw+RlXhPG1mQxSQWiTrZKZgS5ftsf+uqTru47gME/jCfbOG
	JBbcfQZ6lyJNHE4cuN/fNDuEcQhQZ+nWOwUn+B6uYb1Bx8+2EDIkaz18SgnYIX50rwzUf+owZT/
	PHVSozTENhGvUXYIgdnLrZkF8mQR3Go2ZSOB8qxOZG8jDMyyCQ8fZspD5H4ThoiP1YY4gKcpZ6o
	dVcjS2HUqPKwUaj6w7OWN0M/Up/VlRKQ450e8xLoXQy6HKKbcbbNG2Wm7q4FDNWVwGrDawCQ3Sz
	0EmA+J8wcrLm/Qeqv1MDYMIl+uCxahVpyIxEET2ZOKEmqd/mxIaLDztjNcR/PTAd0+I2DanR9FZ
	wVQ9iyyhADSTIG2JKaBbhTm3HXVM4e/1hB/qk4v8=
X-Received: by 2002:a17:907:96ab:b0:c2e:4b90:3c53 with SMTP id
 a640c23a62f3a-c4d6d99453fmr399216666b.1.1794242706213; Mon, 09 Nov 2026
 08:45:06 -0800 (PST)
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
 <au1gtHLku32CeSVC@strlen.de> <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
 <avHWYRPcjP0ITv8b@strlen.de> <CAPH4NY2McTHB7GTugjOMnO0-b4GqponsebLDOjuWG7OCCjC9nQ@mail.gmail.com>
 <avHypYjkEAozX214@strlen.de>
In-Reply-To: <avHypYjkEAozX214@strlen.de>
Reply-To: allfoxwy@gmail.com
From: allfox wy <allfoxwy@gmail.com>
Date: Tue, 10 Nov 2026 00:44:53 +0800
X-Gm-Features: AclHuK_RbZLJvkDSrVyDrOe7pZYpAgjl35ozAU5HQqAG1TwIq4Jd4iAwat9XcB8
Message-ID: <CAPH4NY0NHdZSRP_aa3wPG0+yof5cmfJDLwNGTN+Dar5mZM-XXA@mail.gmail.com>
Subject: Re: [regression] Completely editing packet should be allowed.
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"

Florian Westphal wrote:
> Yes, but kernel doesn't know that.
>
> static bool l4proto_manip_pkt(struct sk_buff *skb,
>                               unsigned int iphdroff, unsigned int hdroff,
>                               const struct nf_conntrack_tuple *tuple,
>                               enum nf_nat_manip_type maniptype)
> {
>         switch (tuple->dst.protonum) {  <- from BEFORE nfqueue rewrite
>         case IPPROTO_TCP:
>                 return tcp_manip_pkt(skb, iphdroff, hdroff,
>                                      tuple, maniptype);
>         case IPPROTO_UDP:
>                 return udp_manip_pkt(skb, iphdroff, hdroff,
>                                      tuple, maniptype);
>
> so, when the conntrack entry is subject to a port translation, the
> nat engine will now write into the 2nd ip header that follows the
> first one, this will corrupt ip->ihl, version, tos and/or tot_len
> fields.

I think it would be fine. Before nfqueue rewrite, layer 3 header would
have a number 4 as L4-protocol, which would fall out of the switch
statement to the last
> /* If we don't know protocol -- no error, pass it unmodified. */
> return true;

The IPIP interface knows the remote address, it does not need NAT to
fill in daddr, the device would do it. And I'm _guessing_ that saddr
would be filled in by routing decision.



> Yes.  Not yet sure how to make this work.  Changing this part of
> NAT engine isn't sufficient either, conntrack entry could have
> a helper attached, and those do not re-validate tcp header sizes
> or ip options.
>
> Maybe best we can do is to relax the check for initial user
> namespace (or just init_net).  But it would still allow
> CAP_NET_ADMIN process to re-gain all other capabilities...

Thank you but I think there is no need to relax security line because
of a homebrew. It's all fine as I could cook another pie with
something different than NFQUEUE.
Also I could maybe expose the real protocol number in layer 3 so
CONNTRACK would always see a 4 there.
All fine if the security calls the change. I could try some different
framework / infrastructure to carry out the design.
