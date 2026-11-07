Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794039028;
	b=W/83vxn+nH5Cbz1BE30ruFGZMre1fQUwd5Y3eLjka7TvTBV5RYX/HNepvFjKImpXZtTI
	 9VYCmaQ+OLHc3zJcQev6JB9i64+hLcvPHz4YjPkAOA3ApX/EO1bOwvvZQyTkCWb1FX5pf
	 BtklhYr+NW58KvOEfUWu9H3y9QJgKhzMec+yJ9p//+Vo7F/mZDYZLvisTQSF2bnm9lCzX
	 MAayJPR7yE5cb+yDW0WQ5JpdqUpkN5gaP+TaDqJ2LACToJA8Ha/FTANW31LTUCGasb4Ow
	 5TPu+tZrjy68ARIxu8nHhUFACS36iT64XVi4dxkMR9Hathi+TyHYX9B2p5LMY4eaHHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=wBSODoVPC1XYRFzroa5N9XheldTXpknQkN3SDk2JtHI=;
	b=I4ewTEqb5a1153/qKi/VD2EAh9Hlx03AlX45mCEUfawtQRLCmIuwXYgiGGjW4z8IJRk5
	 ObRVwLjUDINMRxPSyFVgt/RpRcNluNnF7woztk4V3cJ+j70fwblzhky2P8yxVQLoEPD5q
	 3kvocEM4/fYRZF4xknKfDfyG4bio4tyTgSEoVcLZ2POngG/se3ZV+Mr038QM98VG9AE68
	 KoQglBRdZLlerLEjnvJygIjDPy8S9xGlZJ7CObr83GcK3hZ9xVRHuEUIVYdou+8Et7UcH
	 J01LSH7ZuQ3M3qlempDM7nkPJ7YT0jw5fQgvvhAcHY7/RJ7bU5mgGWqB/CAk2EyMx1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kzv0d2Oc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC3B606A326
	for <netfilter@vger.kernel.org>; Sat,  7 Nov 2026 08:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kzv0d2Oc
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c434376dbebso65485566b.1
        for <netfilter@vger.kernel.org>; Sat, 07 Nov 2026 00:10:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794039026; cv=none;
        d=google.com; s=arc-20260327;
        b=apPFJ1EcLjWx5UggR9mlZQqXNKjXr3yGCSKFYTsfnQQUDKcVowGQslSanXDGxHcSR9
         Q2M3kU1oP07QuenYmAPno1FrCerk3ZTE+i076JuvgyXVhptyPRHbpYjSVeo41QJmLHcU
         whGOhi+VwhqGdkwjg1hzOYtdknZjH2RE6No6rv7kxJhboV6Hx4uyhwuQSyWYik/JqCGH
         LySrk/xKnU1QYo2zi+wqDScgDdUWbWw1S54jIho7p6kBo5o4CaIj5fHXvt0o+OQwDH4x
         T2ktL6vKrCe/gGkn4PXVyQy47/LLaO5krPqq2kc+iyQB8OK4CVgA92sd66NSs80seTEl
         XWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=wBSODoVPC1XYRFzroa5N9XheldTXpknQkN3SDk2JtHI=;
        fh=0+UgUWrY1xdq2B+zm+DlJ883g7+2NiW8GXYOy1B3rKM=;
        b=FjnbLXIYiA6071arIqNzwLg5sHHuv1Si1VGGJ447wqTt//DL7HFsy/DbUloFogXLeL
         g3BavPg6+G06VE79BDo8+d2z5EvZzb0McFk+L/v0qXJ4JzRbs30UYDtwe9NqzvuoRIXW
         fkVS24Bywt7AJc3qZ82MQBiwWWgCWqIDWcRK91Q305tS/fwd1Nf2alsKSLzToyDEIFig
         3S7/oYybjaMaU4X/3YQV00l0Rt7pQtzMHeYDxogwW36bc8YjCeeHnkRvuxQB57YUlhm9
         l2NPKnyLOfLYp+iDgQU5W9TIERvaiopl+/GfxSlEyDmuxBWNWaaJHm6CqWR+xjMeHlYh
         gkOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039026; x=1794643826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wBSODoVPC1XYRFzroa5N9XheldTXpknQkN3SDk2JtHI=;
        b=Kzv0d2OcwMiQOBNNM/4qt54F3DzSKZIicW+7q51z6pAX8aOJ3bCORJHBE1HFUmxN4K
         tyZyUliG1KZWCfsrVnfjI6zm8Sa0kqwZ1WlOg2hMTK+CIJgdbemsItNGNFJIth39D9QM
         T6IAtkjs8VeC+C76wc0ZHA4WxL3sjl3L7Is+g3nH2WtXVkAmdh5viaj9uHN/sC03//Lq
         BjiFdBRrm/rvHHRMEweExlFKSQ976DIWpZMvBVWBpptolQLDB7XYktrdWrb/Ddn1c8zm
         LT0gfp7/YOLy5cSy8IzP2QGKbbwy3O7YsBlyurTFTNVJ752lPbzqFjBBwPEq4i/OzLoS
         sG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039026; x=1794643826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBSODoVPC1XYRFzroa5N9XheldTXpknQkN3SDk2JtHI=;
        b=EZWd81xFgF/Va1Qa8S6d+DFeLyjQoDMlhAqPhRRxwzE/i/trUySCk4vibM9ZFY/VD4
         xJH+NKC+2NMdBawU4GJA61uFAI6Z/tM0XrqGpczTGRZ6URf1dkiPNPrWaWJiJil4qkA/
         6iNS6yi2EHCTR7XVbW/IqEjl+SPCndxiSAxw13yBZJKGMN9upKgbDMn92qhdgtzZH51o
         B+vgsFyt4EIz1dZ92q7jL3LsorGyJAzAHc6FdRerIMU4BWGRMVYg5v8pO/2AoUIQKve3
         lvIIkwVqzpwQC9NcEv//GP04EQPR2+CFu7Ebnfc1u1XBLi99udoazBTdv2GDjAtZcKFs
         PAMw==
X-Gm-Message-State: APuU4Z+Eyn56qJ0vvLDYo9E9ACQNCkvfRzVHivdRmdhyzG/aGASQlKCr
	lPVA736OSGmrO37Z8PwBlso9ThTi8rciSVrZtyG61VbFzo6l5niIVyC7/lyky1UxIXixaCBgvvn
	hAJukNW+BNXLs4u9bHhtWohK+7sTLQYopDswOu4U=
X-Gm-Gg: AYBFou2Cj7bhUqnMHLMlxZWxdaDYa0LwPnxbDS8RM7wz8xIcPcP9Zd+6nOd8OsMvm3I
	0YqFbgy5OU1IOKv6p7AX3ZF50kDzRt6/n1wYJGvyhDl8BbHSt3bCJCGPLb4OndxHy/qRtD4EBzq
	h/23b9BWTca7FysBpVEuTXpRzwWlZiwPB83D1G+zZDVJ1Q7Ekqd7G/pMYHv1U43cRPTpAanqA42
	GdaietpTDki/lDI8c4UacOkZ/m3gtZkWnzWe4wJ1M7ZxwplnhRBNz4rSWxRbroL6r6uylIyDNxY
	m9Uwz2t9zRw+i8X56JC0EbEL3oPBgCFtEDMIsJHTnHcwploSKYqcGcdn/noo/+/+WwHxEx1hCgv
	slVo/sfWsrDsokKUOb40FVO+rURk2v70PCCJN3Cha9XnydQiAhWnlCqIWmRS8
X-Received: by 2002:a17:907:1b22:b0:c25:5159:6a25 with SMTP id
 a640c23a62f3a-c4d52579b9cmr67082766b.6.1794039025575; Sat, 07 Nov 2026
 00:10:25 -0800 (PST)
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
In-Reply-To: <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
Reply-To: allfoxwy@gmail.com
From: allfox wy <allfoxwy@gmail.com>
Date: Sat, 7 Nov 2026 16:10:14 +0800
X-Gm-Features: AclHuK-v5qWJBI93cZ3wEeEPTmEwVA45MZ9Z6NocHgc8eLwqXmnh36F_lJNeKCI
Message-ID: <CAPH4NY3g9Dsswmn_XnTsC_hmiDL-G7imm6jDORnQQW=rz4SAxw@mail.gmail.com>
Subject: Re: [regression] Completely editing packet should be allowed.
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 4:04=E2=80=AFPM allfox wy <allfoxwy@gmail.com> wrote=
:
>
> Thank you for explanation. I did a test. It is indeed the protocol
> number change in homebrew causing the block.
>
> However, calling nf_reset_ct(e->skb) would still result in packet
> being dropped. I didn't do a precise diagnose to find out where it got
> dropped. But replacing nf_reset_ct(e->skb) with "return true" would
> result in a working system.
>
> My deduction: in the system's NAT table there is MASQUERADE in
> POSTROUTING. As my understanding, MASQUERADE requires CONNTRACK
> information to work. When the outgoing packet going through MANGLE
> table and got nf_reset_ct(e->skb), later MASQUERADE in NAT table might
> dropped it.
>
> Is there a function that recalculate the CONNTRACK info rather than
> deleting it please?
>
> On Fri, Nov 6, 2026 at 1:08=E2=80=AFPM Florian Westphal <fw@strlen.de> wr=
ote:
> >
> > allfox wy <allfoxwy@gmail.com> wrote:
> > > I have a homebrew cipher program using libnetfilter_queue, which woul=
d
> > > intercept certain IP in IP packets via iptables' NFQUEUE target, edit
> > > them ( completely ) then put them back to OS for further processing.
> > >
> > > Received packets would be redirected via RAW table ( which would
> > > happen before CONNTRACK ) , while sending packets would be redirected
> > > via MANGLE table POSTROUTING chain ( they are leaving the host, no
> > > longer need to be CONTRACKed ).
> > >
> > > The edit is to transform the entire inner packet with a cipher. By
> > > entire, I mean including the inner header hidden and the original
> > > length would change.
> > > The receiving host would decipher it back to normal IP in IP packet i=
n
> > > RAW table.
> > >
> > > This would form a transparent tunnel and had worked for years.
> > >
> > > However recently I tried to switch from Linux 6.18 LTS to 7.4-rc1 ( i=
n
> > > favour of tcp_roccet ), my homebrew stopped working.
> > > There is no error message anywhere, all libnetfilter_queue functions
> > > return success, I could see the packet, I could edit it, I could send
> > > the verdict. Just after my edit, the packet would fade into void
> > > somehow. Like the host never had it.
> > >
> > > So I did a bisect, it comes to
> > > 112e447d17f78d08485b3076a8baa1dfb9794bd8 is the first bad commit:
> > > - netfilter: validate L4 headers after userspace packet writes.
> > >
> > > I don't really get the idea of the situation here:
> > > - Freestyle packet via libnetfilter_queue is no longer supported?
> >
> > It has to be restricted.
> >
> > > - What is the rule of validation? What can be edited and what can't b=
e touched?
> >
> > ATM: ip saddr/daddr can change, l4 port numbers can change.
> > No insertion of extension headers or add/removal of IP options.
> >
> > Could be supported but requires recomputations of internal data in the
> > kernel.
> >
> > > I still feel making a cipher should be a valid use case for
> > > libnetfilter_queue. ( Which would replace the entire inner packet of
> > > IP in IP encapsulation, so any validation on the inner content would
> > > fail )
> > > The whole point of libnetfilter_queue is giving userspace a way to
> > > inspect/edit the packet. When all function calls success and the
> > > userspace say "verdict, allow" then the system silently dropping the
> > > packet into void does not sound very logical to me.
> > >
> > > So that
> > > - I vote for reverting 112e447d . As in my view, it would kill a vali=
d
> > > use case of libnetfilter_queue and NFQUEUE target.
> >
> > We really can't, no restrictions allow kernel crash.  But its likely
> > your use case can be made to work again.
> >
> > Wild guess: you're changing the l4 protocol number and the postrouting
> > hook reinject fails because of proto mismatch wrt. what conntrack picke=
d
> > up?
> >
> > diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_=
queue.c
> > index 90d887546f7d..d2f83004e156 100644
> > --- a/net/netfilter/nfnetlink_queue.c
> > +++ b/net/netfilter/nfnetlink_queue.c
> > @@ -1229,10 +1229,8 @@ static bool nfqnl_validate_l4(const u8 *data, un=
signed int data_len,
> >         const struct nf_conn *ct;
> >
> >         ct =3D nf_ct_get(e->skb, &ctinfo);
> > -       if (ct && !nf_ct_is_template(ct)) {
> > -               if (fragment || nf_ct_protonum(ct) !=3D proto)
> > -                       return false;
> > -       }
> > +       if (ct && nf_ct_protonum(ct) !=3D proto)
> > +               nf_reset_ct(e->skb);
> >  #endif
> >
> > If that doesn't help, can you either see if you can figure out where th=
e
> > validation fails, or, alternatively, describe what header modifications
> > your userspace program is doing?

Excuse me for that I should have used interleaved style quoting.
