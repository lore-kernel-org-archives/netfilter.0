Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794038703;
	b=Ri0kJLuPGnnaf2rdLMiwAOyZjGTPVoF3vAwgNX5XgTK0lL72yIqPac/ja503q+nBOxrk
	 XmGpEm5MsUSwqZQi3zNcd+IE4txeqTOyI8wxKTPcad9Gr1FD2kD6mfrgc1UQuZX4LdDDO
	 7tK/Qa2v+1vDRfKWhR1k55wuQahZUKPQjb+G7ovwYpEGrY81ZAvr/3FBSeOH3RAaZYSIs
	 9P0GRPQfdlvJ6oruCEeuj3mWv5Gsm30wtGcYxL1O08cNkpkacOaHNnre1y6r3PyUKqPYG
	 jvXzkkujv/FId2Aamx2AUZ54tbygW4WVidkxyaZP8kF1QoetJP3RbyYuw8TjJjk2fRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3KnUoDljf82zcw4Rz/TKp5gn6m/ypnKub/S8b/uBo+I=;
	b=o1x0KcNlEv45khJgjRlR8rdWZVnmUycf4pJo0nOIXoCL8xUdznrhYvnCKs+wK2ynkn6U
	 8hEnhAAhvseDeiZrTCzigJjAoXzkV0Y/vwtex59gBXgPKJBd1gMm67BmP0Im1mwMZsltf
	 10BfuCb3LwS7u2dINqD+5FlqJS+l5R2mgJ3tJo1DxLlwrMWMw0roum/DCtIsThKswXuYf
	 ugDexbMHsJpaaaf3dt3clkPI5VJdw1zOE4K644jbzAglx2pzGOOfcbUkd/DOeNqgzrauG
	 bOaWpwzaSYnq5/TUYmB/iauYThG7JWoU9jK2V4GPnaR0233+5vvPQABPzIDfexFKkcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrNbmiEq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4F606A326
	for <netfilter@vger.kernel.org>; Sat,  7 Nov 2026 08:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B4F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrNbmiEq
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4550d8ab15so178867566b.2
        for <netfilter@vger.kernel.org>; Sat, 07 Nov 2026 00:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794038701; cv=none;
        d=google.com; s=arc-20260327;
        b=bULsXazEmNY9ZEfvRKP6QTDn7aac2USc2seI++qwjNETBoOD9hWePaOdHDV1PhX5FR
         kVJ0Bwkodt7xHGA4OhfjJFGPBH+gSFw+nVbmUuo8XVK5gmW0kVBx2awoqRn20nl8dZUZ
         kN7jPkl6X2yTN/vf5tTc51xFJXPuzpn21DU5Y4cZp/Rfowrn/dvUTgM3exUzlipOfrJw
         dJ07NpqaAdONHs98glVdfybpuMtfQMzIPAdtP4BCR6zzadSSQAKc3JuFCzBVDrzDC35+
         61e3sr+NzVegxSsSjKQYydvbH5DW5Ze0k2IR4pXdXOhU8Bnx6vcx5/h7FSpszmPCO/5u
         DstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=3KnUoDljf82zcw4Rz/TKp5gn6m/ypnKub/S8b/uBo+I=;
        fh=0+UgUWrY1xdq2B+zm+DlJ883g7+2NiW8GXYOy1B3rKM=;
        b=cc8F71KFOAF2ubQQTojVb0iUnyoXwaWg8HYF4yHSeDLdmnM5aH2M4ju6+asB9/WfDC
         Ddi7NHw41/mftuE32yjj/Y2TOVssD+QLOZnNxg1RzRD+LEKH5sbk+6j9EhtAVLfo+naJ
         o5MpFQEJTrq6SnL7UNBAgNHNjwoqCtN8Wbk49wYqEffeuna2WZW201MMxlBgeKoaHwiS
         JmKjqTFw+UgWxpW4Eaklwtsmq4Z5WbAVmlHKdESRLRL1fNFBqJu+zV/guLwK8XB+PS9W
         mRoNY5GMrlP35e1kf9SJ2GebxfDyO6rQMiAUPlYbDqBqyLB9qXTUzqziycX6HF4hBv3f
         TVzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794038701; x=1794643501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3KnUoDljf82zcw4Rz/TKp5gn6m/ypnKub/S8b/uBo+I=;
        b=QrNbmiEq/4caIyzWP0PjjZdfvKsSezoUB7bJe6xpmILTCPtmq2+wA5TqR1QT8xUMur
         nnR67aOEeSPJqaMOyGqHawPpG20EAzNocDNqVQXNyjNR2Y6csySn0am0RljvLf71R373
         Bi4uB0sES3k5ApU7STapQOSMQoCjhpVOpiiGIYJRGHVNudvJPsTX5YdK+3djDEK2++QP
         Upurnz+z3XKNhvaW3wS5m4/sNQXGGIivaK3SZM7XOpNhbTiq/1RzxospnQihLC9rMw2B
         APVw+DZyMGJbh5WL5adQafV+8ExTDbfqB87NkZ4WhU9aJ8Op18EQsSjHOpJy1S3tHywC
         P3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038701; x=1794643501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KnUoDljf82zcw4Rz/TKp5gn6m/ypnKub/S8b/uBo+I=;
        b=vZ1dtvkZhKJhVEHSGnj76MFaTtiDBrfFKZdj0ZbynA64TrTMLKiUIvVAQjvc5Lt+cx
         VGB2GOGXXxIo09OJkd3ofy1zppJ8JzwFKE6D7NkEXY4hkklASvNGtI0XmXu11oApUyGH
         U+jf/ATxykyGECnbdujO9aTyr5Iv/zo9OuZDGMjKvimDJM9RBH7hmzXHwXKnZ9gJQKZk
         zoLVKugK/aZlk5vSG8BsOqoVS2SHas113TiTUJddhUHX/CMxbOboYNG6aiHn8AnB97X4
         4OaOc5pQeqoH54PBYaBLxE7AWTbO79koQKA12jzyerrcg4PI9SLIaz9/B+IK6LdpzqkJ
         BrZw==
X-Gm-Message-State: APuU4Z/k2yisjhtLhWqY3Jd68EJ5msAGWbthuxShk/rpYofnxZkXxLgt
	9FD6lz8lujiUSax63BYEhbWPvc0gWFKxFfLw0XdNadhFNXLJ91yzQ1huvmwP436QvWI1RfK54oS
	QOGQK9UuzFD6zzNVxL2c2uJDnar0ERb/5W283sYA=
X-Gm-Gg: AYBFou1Jh5Nme7QAL71oAWYvLud5jVqIG99U2e6ephV1WL1za3owMCiFr8L//YKAIuv
	q7hJAoSwt6KzXxsH8vOoYzfNXBDi0BExz8Q1mmdgQYm7UjbOEkdJeZcAJQEKfnaCCHrb1madJzt
	lhRx2nehfYXRCGM/oubJdpg7ycL0sQFuCUijqMEXULf8yXVodUgJJHaaquzCx7gQ9NkugwqMOX0
	9D1TlWZJvKo96J8deJNxGCvNJ3kCUlkVGMyp1ScrsmxSMsH/QO2wApAc8Z2hZKg8GKM+jEyIX9Q
	cOZjMaQDnE6N8MO+Sj5hXsv4TWH9+iVFd4lV9+3OQZZOk9iSuRq5nmN36h77KF0LhngzOwGoR+4
	x7nZyf26QEd3DRH4OyVlPuQy1Np80MpqiQsUFW7w=
X-Received: by 2002:a17:907:801:b0:c4c:bff4:202a with SMTP id
 a640c23a62f3a-c4d34cdc5e0mr380553366b.49.1794038701083; Sat, 07 Nov 2026
 00:05:01 -0800 (PST)
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
 <au1gtHLku32CeSVC@strlen.de>
In-Reply-To: <au1gtHLku32CeSVC@strlen.de>
Reply-To: allfoxwy@gmail.com
From: allfox wy <allfoxwy@gmail.com>
Date: Sat, 7 Nov 2026 16:04:49 +0800
X-Gm-Features: AclHuK_En5gGbLgKNGwdRjgN6EZG5zev2GSDaGIbRUaQmMRBc8Y-qjU9JqD6SA4
Message-ID: <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
Subject: Re: [regression] Completely editing packet should be allowed.
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for explanation. I did a test. It is indeed the protocol
number change in homebrew causing the block.

However, calling nf_reset_ct(e->skb) would still result in packet
being dropped. I didn't do a precise diagnose to find out where it got
dropped. But replacing nf_reset_ct(e->skb) with "return true" would
result in a working system.

My deduction: in the system's NAT table there is MASQUERADE in
POSTROUTING. As my understanding, MASQUERADE requires CONNTRACK
information to work. When the outgoing packet going through MANGLE
table and got nf_reset_ct(e->skb), later MASQUERADE in NAT table might
dropped it.

Is there a function that recalculate the CONNTRACK info rather than
deleting it please?

On Fri, Nov 6, 2026 at 1:08=E2=80=AFPM Florian Westphal <fw@strlen.de> wrot=
e:
>
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
> > - What is the rule of validation? What can be edited and what can't be =
touched?
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
> diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_qu=
eue.c
> index 90d887546f7d..d2f83004e156 100644
> --- a/net/netfilter/nfnetlink_queue.c
> +++ b/net/netfilter/nfnetlink_queue.c
> @@ -1229,10 +1229,8 @@ static bool nfqnl_validate_l4(const u8 *data, unsi=
gned int data_len,
>         const struct nf_conn *ct;
>
>         ct =3D nf_ct_get(e->skb, &ctinfo);
> -       if (ct && !nf_ct_is_template(ct)) {
> -               if (fragment || nf_ct_protonum(ct) !=3D proto)
> -                       return false;
> -       }
> +       if (ct && nf_ct_protonum(ct) !=3D proto)
> +               nf_reset_ct(e->skb);
>  #endif
>
> If that doesn't help, can you either see if you can figure out where the
> validation fails, or, alternatively, describe what header modifications
> your userspace program is doing?
