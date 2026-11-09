Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.245.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241195;
	b=w7/vpQ4iGHgkaRzVGTwhnLvjI9jBviDlvYKxYCc4QJVOoing64+3KGybtz9Oi7/qhlgB
	 fFEsHP2Uq8un0K8JNIBV9kSQF9m/sjC8sdFxCyPTUHWjKfWUHCFiERU2/Yzhnip7RFV+H
	 mHpOh5NKoiG3Bv4d3wrN2g4eIj9D8orVw1q+44I+g6+twxb6rpBaz14TUYocl3uGV12kC
	 0EYBsajPZF4i9K6DaoGofTeHkhMoWMr+3v7vPynBdlM8Lfc5tSFaK//spjvwgFalooiNk
	 syzeQVYoXXPoUjMGxv+jboD/KYRPwKrr8CA4kcZqbwcYqFTF5mEayCvk95cxyEUvJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241195;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2OeHeFlfs4YxpccQrMpCnHHef63uRfb5dEkKMM+MQ0E=;
	b=oRxFxtvj5jl2AMXYjr/MaMAA+rhChR/vFUPH3ej9yEspiAYYTsPR5uWSyL0z/u0tO4Oj
	 G5OuTirSmzRY1Q5DDkV0OqvhIXbtPPfDNQl/MhDFIuIxhvZcj+k07vxG7eSYhyH2NvCE9
	 2TiXjAPAMZ9qmElG15hDkCQ5K2Jz3xKSbVsmmH6c7eKefdRQ8NIOy+bUmwCI1YrfZnprw
	 eGJTvADJRgbLCYVaRSRBVkwCt+CwI4NSS5V8HcfuE6znvaga8XwDjp4kAu7ujN8IGo9a5
	 hB6SzoEY57nu7+4HfEIYAJYoVIq1XyuZO/fw8S76C794fqIzEzLd86JyflVZh6QRwZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=strlen.de;
	spf=pass smtp.mailfrom=strlen.de;
	arc=none smtp.remote-ip=91.216.245.30
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48A3606A321
	for <netfilter@vger.kernel.org>; Mon,  9 Nov 2026 16:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 6663360342; Mon, 09 Nov 2026 17:19:52 +0100 (CET)
Date: Mon, 9 Nov 2026 17:19:49 +0100
From: Florian Westphal <fw@strlen.de>
To: allfox wy <allfoxwy@gmail.com>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [regression] Completely editing packet should be allowed.
Message-ID: <avHypYjkEAozX214@strlen.de>
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
 <au1gtHLku32CeSVC@strlen.de>
 <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
 <avHWYRPcjP0ITv8b@strlen.de>
 <CAPH4NY2McTHB7GTugjOMnO0-b4GqponsebLDOjuWG7OCCjC9nQ@mail.gmail.com>
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPH4NY2McTHB7GTugjOMnO0-b4GqponsebLDOjuWG7OCCjC9nQ@mail.gmail.com>

allfox wy <allfoxwy@gmail.com> wrote:
> Florian Westphal wrote:
> > The NAT dispatch uses the l4proto value from the tuple to decide
> > what to do.
> >
> > So as far as I can see NAT postrouting will write updated tcp/udp
> > port to the packet, which is no longer udp/tcp - corrupting
> > the l4 header.
> 
> Excuse me for that I should be more clear about this part.
> The scheme is working by IP-in-IP encapsulation. The layer 4 protocol
> is another IP and it does not have a port number. TCP/UDP is in layer
> 5 in this scheme.

Yes, but kernel doesn't know that.

static bool l4proto_manip_pkt(struct sk_buff *skb,
                              unsigned int iphdroff, unsigned int hdroff,
                              const struct nf_conntrack_tuple *tuple,
                              enum nf_nat_manip_type maniptype)
{
        switch (tuple->dst.protonum) {  <- from BEFORE nfqueue rewrite 
        case IPPROTO_TCP:
                return tcp_manip_pkt(skb, iphdroff, hdroff,
                                     tuple, maniptype);
        case IPPROTO_UDP:
                return udp_manip_pkt(skb, iphdroff, hdroff,
                                     tuple, maniptype);

so, when the conntrack entry is subject to a port translation, the
nat engine will now write into the 2nd ip header that follows the
first one, this will corrupt ip->ihl, version, tos and/or tot_len
fields.

> The design:
> Incoming packets => got deciphered in PREROUTING of RAW => CONNTRACK
> see real contents => all the normal
> Outgoing packets => CONNTRACK see real contents => enciphered in
> POSTROUTING of MANGLE => MASQUERADE based on earlier CONNTRACK
> information
> 
> The problem:
> I can no longer change L4-protocol number in layer 3 IP header during
> encipher/decipher process because of Kernel commit 112e447

Yes.  Not yet sure how to make this work.  Changing this part of
NAT engine isn't sufficient either, conntrack entry could have
a helper attached, and those do not re-validate tcp header sizes
or ip options.

Maybe best we can do is to relax the check for initial user
namespace (or just init_net).  But it would still allow
CAP_NET_ADMIN process to re-gain all other capabilities...
