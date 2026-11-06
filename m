Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.245.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941688;
	b=o7dfY04nriNdXkABkAgl11yaC2+rrPYM4s8+Pq8JprGuAuAKYhFnFLwh+VQzgnH/yZIv
	 JjdUca1Q/tp6kFnQ+8UsIgODLlCJgVkdcENfVFLN5Ae0IaedK/ntYqZPbNmf8q6iu7kNV
	 Q4Jr5M3+Bd91YrKtl7iiVtiTjNhkKx1jvmfRdQt/1chvr4RTXu20rYGQdJtSvXoH6BU9z
	 kY7T6TRdzi2CTjQ2BpiBWCZzmsRGHf2Dl0hEAo8CZMbVA7cMgZfzANN5ze6EYFRc2vCVO
	 E3UZJR6DvsCzNywdAFlMxY0SAw/CJucXSiPGDo+jn/9XgyyRJwIwqTD5hhVUULJow7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941688;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YIaMdEuHDL5pqnrolfi/hPC6rCciyV7Plo+Bsa4EnB8=;
	b=xShUxh4IJ/IlQk+F8YBtz6DpKhRnJhCelyA4zPeFsN8Va49fD6yh4+bw+oh1oNXiUEDm
	 6Lr+C/Pnv6GX0YhU0cymuSEs3U1rwWlsDNJLMQHLDHCnoZO60ZAAz1GTGgIE2T45QUdtx
	 sIkzZP6kCE4CMrwnl5BkBVt/iMYzKb0otK07lduXcWAzu4co51H3E0y0B7qQrGeimQ1s3
	 Ko4LIG6A00Iw5fGMMgO6ybADtAqkD4AU/40RvUAoV+EfQqLsBHTys7hKqeMnV+030ZrzZ
	 O87NsxQsz9ssWkLCqX6tNXR9P0zqtefhGCRRuDlbJXpHkHYlrppUnzMtlTZbqghyyYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=strlen.de;
	spf=pass smtp.mailfrom=strlen.de;
	arc=none smtp.remote-ip=91.216.245.30
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F9606A326
	for <netfilter@vger.kernel.org>; Fri,  6 Nov 2026 05:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id EE4116060B; Fri, 06 Nov 2026 06:08:04 +0100 (CET)
Date: Fri, 6 Nov 2026 06:08:04 +0100
From: Florian Westphal <fw@strlen.de>
To: allfox wy <allfoxwy@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: [regression] Completely editing packet should be allowed.
Message-ID: <au1gtHLku32CeSVC@strlen.de>
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
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
In-Reply-To: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>

allfox wy <allfoxwy@gmail.com> wrote:
> I have a homebrew cipher program using libnetfilter_queue, which would
> intercept certain IP in IP packets via iptables' NFQUEUE target, edit
> them ( completely ) then put them back to OS for further processing.
> 
> Received packets would be redirected via RAW table ( which would
> happen before CONNTRACK ) , while sending packets would be redirected
> via MANGLE table POSTROUTING chain ( they are leaving the host, no
> longer need to be CONTRACKed ).
>
> The edit is to transform the entire inner packet with a cipher. By
> entire, I mean including the inner header hidden and the original
> length would change.
> The receiving host would decipher it back to normal IP in IP packet in
> RAW table.
> 
> This would form a transparent tunnel and had worked for years.
> 
> However recently I tried to switch from Linux 6.18 LTS to 7.4-rc1 ( in
> favour of tcp_roccet ), my homebrew stopped working.
> There is no error message anywhere, all libnetfilter_queue functions
> return success, I could see the packet, I could edit it, I could send
> the verdict. Just after my edit, the packet would fade into void
> somehow. Like the host never had it.
> 
> So I did a bisect, it comes to
> 112e447d17f78d08485b3076a8baa1dfb9794bd8 is the first bad commit:
> - netfilter: validate L4 headers after userspace packet writes.
>
> I don't really get the idea of the situation here:
> - Freestyle packet via libnetfilter_queue is no longer supported?

It has to be restricted.

> - What is the rule of validation? What can be edited and what can't be touched?

ATM: ip saddr/daddr can change, l4 port numbers can change.
No insertion of extension headers or add/removal of IP options.

Could be supported but requires recomputations of internal data in the
kernel.

> I still feel making a cipher should be a valid use case for
> libnetfilter_queue. ( Which would replace the entire inner packet of
> IP in IP encapsulation, so any validation on the inner content would
> fail )
> The whole point of libnetfilter_queue is giving userspace a way to
> inspect/edit the packet. When all function calls success and the
> userspace say "verdict, allow" then the system silently dropping the
> packet into void does not sound very logical to me.
> 
> So that
> - I vote for reverting 112e447d . As in my view, it would kill a valid
> use case of libnetfilter_queue and NFQUEUE target.

We really can't, no restrictions allow kernel crash.  But its likely
your use case can be made to work again.

Wild guess: you're changing the l4 protocol number and the postrouting
hook reinject fails because of proto mismatch wrt. what conntrack picked
up?

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 90d887546f7d..d2f83004e156 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -1229,10 +1229,8 @@ static bool nfqnl_validate_l4(const u8 *data, unsigned int data_len,
        const struct nf_conn *ct;

        ct = nf_ct_get(e->skb, &ctinfo);
-       if (ct && !nf_ct_is_template(ct)) {
-               if (fragment || nf_ct_protonum(ct) != proto)
-                       return false;
-       }
+       if (ct && nf_ct_protonum(ct) != proto)
+               nf_reset_ct(e->skb);
 #endif

If that doesn't help, can you either see if you can figure out where the
validation fails, or, alternatively, describe what header modifications
your userspace program is doing?
