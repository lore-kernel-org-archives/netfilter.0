Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.190.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965620;
	b=rS48q6Fs6p4qukl+TkzqIXnz43VCHLMi8NP/xjk8vrYxhKnQwmUy2MNn8sZfcPgsAJmr
	 L8EqLl+5OBY+uQfTSzh0rUaI/D6VHXIAVDMHDfGWkIZM6mfmQyWE487f+FUei2ed0dIWy
	 V49S3m3EB4rjAFUwH5HRtJqhVyGf9giFzHwmm7Ww0cwkIyB7OyL5Qv5sw8k5IrRgxdXH+
	 pwJXrMo1ymxq6uk/tNjA1ssuURR2vDX3+7vf25XBQEBNlcN4Klxm0v9duIeYLIJqaM1R7
	 +BZcREc7TpvPvuVo975u+VpiQ8ojjYg9k/qIv0nugLl/pISadJd0dXJOQjSbsQ5hYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965620;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Status:X-Spam-Checker-Version;
	bh=hzltBTinCjnpXIMLDm7BCoNokWpI5w7RvqA1Yw7dR70=;
	b=ZqbqdC2rHBNvcP5U58zxY5VACRu95Mje7kEzts2ofdJXRIojuN2jTs+q5CormhdCb938
	 /wLTRq+7F8ZzEnkeJn2dYAX/k5J0D50cgbjmSjyrIwzCZ61bQTp9zKvsCQL9tsfYxfleP
	 88gputtiUOZ8Jve3Whe5+ohFQmFKQbWAHwkgmY623SOvQTQoThfzxIqMiOhfu+SnDyU27
	 8r3KBzQRxT+r6Ap4zfXOKyBBld5OF/QGAXML3W0U4hTeWfFDPqCzEzPg9nfK94DOrtdv2
	 gL3t+KsvCYwtejBgro7TUT1ffLGfN+hkU23+bGFGxncNNUtCIg+0/UIbxa+pmtB0mEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=netfilter.org;
	spf=pass smtp.mailfrom=netfilter.org;
	dkim=pass header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=ZtqVaVAN;
	arc=none smtp.remote-ip=217.70.190.124
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 29FF0606A338
	for <netfilter@vger.kernel.org>; Fri,  6 Nov 2026 11:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FF0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=ZtqVaVAN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1793965618;
	bh=hzltBTinCjnpXIMLDm7BCoNokWpI5w7RvqA1Yw7dR70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtqVaVANmjqrW8OQncwQ3eeHHjSd04NPAcPOhQ7jqvM7M5hsjtJoJBCBtQXcRaUT2
	 usPn85+Uni53m74jP3c8HLSRqwdyFcsjeStPhN377DTBlYYGjbCVSsVq6FSn+fRgbx
	 Lk8OQdswKYLpa6iTibiKEqsAVoDmxMDovq2N0yD5qpYfwqLC7KFm/TC1mfdNnWhQ2T
	 ZglnAYZfPJOcjJMMmGdMUUWWpwN8lsA9QOpOXl3K5EBwDdr+Um/pLCf+TElGCBYR0g
	 /QOR51SwxDrx0pKiThGAh8s3y47N0OZDrP4Ni726ew+4xy1hSLhsnm0qUo2iOAwnQh
	 SpqJApgm7yVkQ==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 220FB60078;
	Fri,  6 Nov 2026 12:46:58 +0100 (CET)
Date: Fri, 6 Nov 2026 12:46:55 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: allfox wy <allfoxwy@gmail.com>, netfilter@vger.kernel.org
Subject: Re: [regression] Completely editing packet should be allowed.
Message-ID: <au2-LzjOKKSKIu6C@chamomile>
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
 <au1gtHLku32CeSVC@strlen.de>
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <au1gtHLku32CeSVC@strlen.de>

On Fri, Nov 06, 2026 at 06:08:04AM +0100, Florian Westphal wrote:
> allfox wy <allfoxwy@gmail.com> wrote:
> > I have a homebrew cipher program using libnetfilter_queue, which would
> > intercept certain IP in IP packets via iptables' NFQUEUE target, edit
> > them ( completely ) then put them back to OS for further processing.
> > 
> > Received packets would be redirected via RAW table ( which would
> > happen before CONNTRACK ) , while sending packets would be redirected
> > via MANGLE table POSTROUTING chain ( they are leaving the host, no
> > longer need to be CONTRACKed ).
> >
> > The edit is to transform the entire inner packet with a cipher. By
> > entire, I mean including the inner header hidden and the original
> > length would change.
> > The receiving host would decipher it back to normal IP in IP packet in
> > RAW table.
> > 
> > This would form a transparent tunnel and had worked for years.
> > 
> > However recently I tried to switch from Linux 6.18 LTS to 7.4-rc1 ( in
> > favour of tcp_roccet ), my homebrew stopped working.
> > There is no error message anywhere, all libnetfilter_queue functions
> > return success, I could see the packet, I could edit it, I could send
> > the verdict. Just after my edit, the packet would fade into void
> > somehow. Like the host never had it.
> > 
> > So I did a bisect, it comes to
> > 112e447d17f78d08485b3076a8baa1dfb9794bd8 is the first bad commit:
> > - netfilter: validate L4 headers after userspace packet writes.
> >
> > I don't really get the idea of the situation here:
> > - Freestyle packet via libnetfilter_queue is no longer supported?
> 
> It has to be restricted.
> 
> > - What is the rule of validation? What can be edited and what can't be touched?
> 
> ATM: ip saddr/daddr can change, l4 port numbers can change.
> No insertion of extension headers or add/removal of IP options.
> 
> Could be supported but requires recomputations of internal data in the
> kernel.
> 
> > I still feel making a cipher should be a valid use case for
> > libnetfilter_queue. ( Which would replace the entire inner packet of
> > IP in IP encapsulation, so any validation on the inner content would
> > fail )
> > The whole point of libnetfilter_queue is giving userspace a way to
> > inspect/edit the packet. When all function calls success and the
> > userspace say "verdict, allow" then the system silently dropping the
> > packet into void does not sound very logical to me.
> > 
> > So that
> > - I vote for reverting 112e447d . As in my view, it would kill a valid
> > use case of libnetfilter_queue and NFQUEUE target.
> 
> We really can't, no restrictions allow kernel crash.  But its likely
> your use case can be made to work again.
> 
> Wild guess: you're changing the l4 protocol number and the postrouting
> hook reinject fails because of proto mismatch wrt. what conntrack picked
> up?
> 
> diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
> index 90d887546f7d..d2f83004e156 100644
> --- a/net/netfilter/nfnetlink_queue.c
> +++ b/net/netfilter/nfnetlink_queue.c
> @@ -1229,10 +1229,8 @@ static bool nfqnl_validate_l4(const u8 *data, unsigned int data_len,
>         const struct nf_conn *ct;
> 
>         ct = nf_ct_get(e->skb, &ctinfo);
> -       if (ct && !nf_ct_is_template(ct)) {
> -               if (fragment || nf_ct_protonum(ct) != proto)
> -                       return false;
> -       }
> +       if (ct && nf_ct_protonum(ct) != proto)
> +               nf_reset_ct(e->skb);

I agree ct should be dropping in such a change, because this ct does
not represent this skb anymore.

>  #endif
> 
> If that doesn't help, can you either see if you can figure out where the
> validation fails, or, alternatively, describe what header modifications
> your userspace program is doing?
> 
