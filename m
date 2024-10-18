Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4436A204F7A
	for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249580; cv=none; b=cVLqmOAQE2xnP57VPKwmVGUwdqvqoZnjvUPtB1uIeJJvHFJUeDmMSMHDLnLabym+02PK6cdUDUQcn3XtYDIOsfjOWNni3C8DBLnNClov9BCV6EyPHSsafNF0u435ZcYQCFvsDs6U+JGtjhqhAPdJwyOwpQT6+9XpnnxcoNG4Rh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249580; c=relaxed/simple;
	bh=mpDbui9jioOT2Q1/Ic1ClIzsRz8KyKl2cTqWyUTIIUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GY803Fb6Icwpy4neohEfE/jEBooCp4d8vQmqdPziF9Aie0Q0rwcjAUZ6kpvshYvZKuhtJ8EmKFstjTvMXzcKUc1aCnft2lnsqv/HeE0oKpdOJQKQ/IsbISLKkoo1eAiRszi+dWaZg6T4A8qld029uIbWa3UgjIh0O532a8bo8tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKtvJqGX; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKtvJqGX"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a3b67cd89dso9626795ab.0
        for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729249577; x=1729854377; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WfPmDad6pHaaustzfMh4SsAMIyG8GAoq6gbW0sQ1z/M=;
        b=eKtvJqGXY5UJ9W9kBegKBUTO/GIJt2UW19vctatyAV2SNUV1mbRztHhjLGq3c2X8nI
         gu/LqeQC5N7x7QJTIBjZPw7zJCrnfbGZ9q4blGaMSOZeUrqSb253cglsmDkprofLok6F
         5Zl8M7PGeM23n6WVmLXbrIBKTs2TMFUpb2GUhgZ4ZHmIbcAXM8rTRJf8jmSnvuipVZcG
         1pqQJ5PrlCnpyXBI56Xnga9ij9cNZvH2WQeG1WxpYJgmh9iwKGMrX5F3GQEOdHMxizps
         Pfj6EAJiATW/JOHuJpauPof5nW6vyPgvOKwrrppfyG4Y9tdjGVLrD1gQFLVlapwoGjks
         3Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729249577; x=1729854377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfPmDad6pHaaustzfMh4SsAMIyG8GAoq6gbW0sQ1z/M=;
        b=r4eiIkTi/09GudQxYsCHq9nUSpw1Jdu/l5rAJACRwjWBy6VZgZwV8v6r3k9lsF4ow3
         SwXd5K/hHuPq66Vz+r2ocI1XXqaS7g4MH7oiR0IH1WsOUQVwKrsOJEmaX3DKXwJ6TY2u
         SoeJaog6u+0BhPPoIyfoImDMCUBfmErJgySNDqsJUC8zCo/qOUx9gp5ccNNNAi0on9ad
         +AJkg9D/G8GVPXrtYZHvt9M3etycibG87BozFhRF7e3Z4DN+zc1XXeSMSUIxyrB7dN3J
         vbZJmfiAsOTMTOWTPuD85pSOisfdMdJc76ta0MF2jmHo1+8FgUnNvUiDDzcbyQKugXvm
         iGsg==
X-Forwarded-Encrypted: i=1; AJvYcCXnYLgCfsSgdFYokabGAkPiEs16bS7hlEInBftw0kNYabxeTuJTrBrFnpGuzTGmbXf9WBIhnIc/3MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8NEvvkZnNjagY2PX9Go3cQ7qie7+z0vP6PlAmueiV3Y3uCIAu
	1P3W9UQ4RM1+89MHXbY8zqJD0h33jVermCN7+x0FoKwYDOs/e/C48UK64kEyWS2FSa7iTM3dmz8
	8amI8gPDfOvNANylZJdgDnJo5nZBIfAbtTNVFGw==
X-Google-Smtp-Source: AGHT+IGJvJJkaQwiv4Ie4y8HuX7aAMcGfjhAZ8DncBSK0xKIH0S6WgammluDftiE05xqkkzgtTwx9vmGP8NYLCR8dj8=
X-Received: by 2002:a05:6e02:1fef:b0:3a0:8e7c:b4ae with SMTP id
 e9e14a558f8ab-3a3f4177949mr11237795ab.2.1729249577218; Fri, 18 Oct 2024
 04:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc> <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com> <20241017233031.GA3675@breakpoint.cc>
In-Reply-To: <20241017233031.GA3675@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Fri, 18 Oct 2024 12:05:40 +0100
Message-ID: <CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
Subject: Re: Most optimal method to dump UDP conntrack entries
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 00:30, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > We are not worried about being slow in the order of seconds, the
> > system is eventually consistent so there can always be a reasonable
> > latency.
> > Since we only care about UDP, losing packets during that period is not
> > desirable but is assumable.
> > My main concern is if constantly dumping all the entries via netlink
> > can cause any issue or increase resources consumption.
>
> It doesn't need lots of extra memory on kernel side, just for the
> some internal tracking ("where were we") and temporary netlink
> buffer to assemble the dump chunks returned to userspace.
>
> > > > Also both proc and netlink dumps can miss entries (albeit its rare),
> > > > if parallel insertions/deletes happen (which is normal on busy system).
> >
> > That is one of the reasons we want to implement this reconcile loop,
> > so it can be resilient to this kind of errors, we keep the state on
> > the API in the control plane, so we can always rebuild the state in
> > the dataplane (recreating nftables rules and delete conntrack entries
> > that does not match the current state)
>
> OK, but wouldn't it be better to not need this at all?
>

Absolutely, that will be awesome

> The UDP tracker is old and refreshs the timeout for every packet, but
> who says it needs to stay that way?
>
> With very simple patch to only refresh in 'reply' dir:
>
>     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> [DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
>     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> [DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
>     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
>
> This is with a unidirectional UDP stream.
>
> diff --git a/net/netfilter/nf_conntrack_proto_udp.c b/net/netfilter/nf_conntrack_proto_udp.c
> --- a/net/netfilter/nf_conntrack_proto_udp.c
> +++ b/net/netfilter/nf_conntrack_proto_udp.c
> @@ -17,6 +17,7 @@
>  #include <linux/netfilter.h>
>  #include <linux/netfilter_ipv4.h>
>  #include <linux/netfilter_ipv6.h>
> +#include <net/netfilter/nf_conntrack_acct.h>
>  #include <net/netfilter/nf_conntrack_l4proto.h>
>  #include <net/netfilter/nf_conntrack_ecache.h>
>  #include <net/netfilter/nf_conntrack_timeout.h>
> @@ -80,6 +81,35 @@ static bool udp_error(struct sk_buff *skb,
>         return false;
>  }
>
> +static void nf_ct_refresh_udp(struct nf_conn *ct,
> +                             enum ip_conntrack_dir dir,
> +                             u32 len, u32 extra_jiffies)
> +{
> +       /* Only update if this is not a fixed timeout */
> +       if (test_bit(IPS_FIXED_TIMEOUT_BIT, &ct->status))
> +               return nf_ct_acct_update(ct, dir, len);
> +
> +       switch (dir) {
> +       case IP_CT_DIR_ORIGINAL:
> +               /* do not refresh in original dir, else stale dnat mapping
> +                * can be kept alive indefinitely.
> +                */
> +               if (nf_ct_is_confirmed(ct))
> +                       return nf_ct_acct_update(ct, dir, len);
> +               break;
> +       case IP_CT_DIR_REPLY:
> +               extra_jiffies += nfct_time_stamp;
> +               break;
> +       case IP_CT_DIR_MAX: /* silence warning wrt. unhandled enum */
> +               break;
> +       }
> +
> +       if (READ_ONCE(ct->timeout) != extra_jiffies)
> +               WRITE_ONCE(ct->timeout, extra_jiffies);
> +
> +       nf_ct_acct_update(ct, dir, len);
> +}
> +
>  /* Returns verdict for packet, and may modify conntracktype */
>  int nf_conntrack_udp_packet(struct nf_conn *ct,
>                             struct sk_buff *skb,
> @@ -114,7 +144,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
>                         stream = (status & IPS_ASSURED) == 0;
>                 }
>
> -               nf_ct_refresh_acct(ct, ctinfo, skb, extra);
> +               nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, extra);
>
>                 /* never set ASSURED for IPS_NAT_CLASH, they time out soon */
>                 if (unlikely((status & IPS_NAT_CLASH)))
> @@ -124,7 +154,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
>                 if (stream && !test_and_set_bit(IPS_ASSURED_BIT, &ct->status))
>                         nf_conntrack_event_cache(IPCT_ASSURED, ct);
>         } else {
> -               nf_ct_refresh_acct(ct, ctinfo, skb, timeouts[UDP_CT_UNREPLIED]);
> +               nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, timeouts[UDP_CT_UNREPLIED]);
>         }
>         return NF_ACCEPT;
>  }
>
> The obvious counter-argument is "but what if its the reply side that is
> sending, and we have a stale SNAT mapping?".
>
> Solution would be to track timestamp of last packet seen per direction,
> and then stop refreshing the timeout if one side ceases sending.
>
> I think thats much better than what we have now and there would be no
> need to actively zap UDP flows, they would timeout automatically once
> one side ceases to transmit.

If I understand correctly this will have some visible effects, before
this change the same tuple will only hit the same destination because
the conntrack entry will prevail, and after this patch the packet will
be spread out randomly to the number of backends.
I'm aware of some requests to have this behavior in kubernetes for UDP
service, but I'm scared that there can be some people relying on this
behavior ... and all the possible edge cases this will open, what
happens if we have two UDP packets in one direction before the first
reply is seen?
