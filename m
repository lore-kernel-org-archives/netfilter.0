Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5D24A08
	for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729260697; cv=none; b=eBnTD7puwi11fIp6Y8+34IodUf7pwqJKvpyHLsxnnR/bc65vJKa17D2Xe3Srh7umJyDmb1+4BwScbEI6IOALKSHtr/G/X9w0IEXwDFVE86QrU+rzCsQbaSD9WGA2PfQDnu3meeaMG4Wei8hVfjgWLCx3cfI+6AaOXawRnQaeBfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729260697; c=relaxed/simple;
	bh=dYlVdmZ02ONJT2RCVVlevlWkSlMyRji9FppTubOG+W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiBwKZ/w/4q8ibTMp//8YsptWbzaxzvx2qkWCyM/JllHTm52anPGpK1ZYj7DtMQcYL6YuEYZc3U9ILYguisd2UP/h6QIb8esUCs2ps9uMTz/O/+PcRQXLG6HbbAWK/wuFqUWLiL86gjl/1BcEu/azkWAdrNsyvcw/5sqNicjsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kU/icWoR; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kU/icWoR"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a3b4663e40so9163895ab.2
        for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729260694; x=1729865494; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=syTnWiwtBUgQI4KTvalkITnM+ziXlOnrVmpEfiLdQnE=;
        b=kU/icWoRGLLBylCHyVhZtLWGRLLoRNkkCNnAR9MyL2jPmSbqRi0oohdhWtuz5l2cSb
         PoiG/hmM/Y6Ttbx7RGV4dToMelRg0mWtBW+C+/2yvpjyfXqCc0q8zQ7rNJXu5NpHAuOg
         SrnEYvte6VPQ1gL26rylqTd3nxaPdHaFu9QVbAghl4WjX9QVVrDIT8Mhi/eKFaZJDz9o
         ni1J0kSGbQ0LipK6+KhG/Jc5NpMWH4DvG3Rb3k5F3RUdhjfUJ1H/YGq/NYx0mpIGjHxl
         4vsW+T29yN4iCjzJpYzGmno4yncFoID19KxfAJ0vmVLTEyVYp1Zw49BOH32xVXVUovaN
         9hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729260694; x=1729865494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syTnWiwtBUgQI4KTvalkITnM+ziXlOnrVmpEfiLdQnE=;
        b=qXNseqzd8/Ur6hKEe1y1b38Jp2EX8lyRqyDSpwE0B04sFtU2g8ux8avpcr9c4S0DDc
         VZ3UsGRzRsIMtdjn+RFgVFMoYTum3lin6FtTbx6ffCM25gnIAkmdOxyYQ+rBuCKNJj3G
         uSJzmY9IyDlI/51HwRPoUw7spmzOMR0iNtusJVtVhuSifOITGP4RzDDEW/zqv1H3cjvG
         BiLSkQIBZNwhblGUavkfgsjwsJ/L9BHiQoh9WiDNuo2rHOE8gEJ8puYTAJHoErBcOccX
         1V5iiYXxu9i4JZGFebk0b3SkuTwpWS3v+skFderf5z+v7fGNd18+vUd2J+tqYADKcKJe
         i5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1FnF6+mbq5kLIh22uplPWYTfwiRSlRy2U81/mUYUCc8LlD8O7ibZNuiL2ULoKTLxvbs7sRK/3REA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzapiZGJ58i8v/+TGG1zNKrF5xGMWbuxts595WtLxp8MV9S/A2D
	cSZO2Z7FoWLo7YhnjDji8kn6iw8mlHHUYcQqY7NwTwLgJ/aljohd6BhtGoWHPz4HrZit69lRfaD
	3rly6JtrvjOZgaYDY/Mns7Pc80rQ=
X-Google-Smtp-Source: AGHT+IG8mMc4jsCE9woUj9pMA+aVzbdCWqwSxPJ1BTpHQ80bYVAjJfPIQ/gPPt7XyE8m3OH2tkRIH1poeD47OSH2ogI=
X-Received: by 2002:a92:c565:0:b0:3a3:68bc:a16d with SMTP id
 e9e14a558f8ab-3a3f409f0bcmr25149385ab.18.1729260694283; Fri, 18 Oct 2024
 07:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc> <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <20241017233031.GA3675@breakpoint.cc> <CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
 <20241018113318.GA28324@breakpoint.cc>
In-Reply-To: <20241018113318.GA28324@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Fri, 18 Oct 2024 16:10:57 +0200
Message-ID: <CABhP=tZronr5azSE9mrr+hTKWFVb41jYQ2FzoWDahwVf1Zt4zQ@mail.gmail.com>
Subject: Re: Most optimal method to dump UDP conntrack entries
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 13:33, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > > The UDP tracker is old and refreshs the timeout for every packet, but
> > > who says it needs to stay that way?
> > >
> > > With very simple patch to only refresh in 'reply' dir:
> > >
> > >     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> > > [DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> > >     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> > > [DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> > >     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> > >
> > > This is with a unidirectional UDP stream.
> > >
> > > diff --git a/net/netfilter/nf_conntrack_proto_udp.c b/net/netfilter/nf_conntrack_proto_udp.c
> > > --- a/net/netfilter/nf_conntrack_proto_udp.c
> > > +++ b/net/netfilter/nf_conntrack_proto_udp.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/netfilter.h>
> > >  #include <linux/netfilter_ipv4.h>
> > >  #include <linux/netfilter_ipv6.h>
> > > +#include <net/netfilter/nf_conntrack_acct.h>
> > >  #include <net/netfilter/nf_conntrack_l4proto.h>
> > >  #include <net/netfilter/nf_conntrack_ecache.h>
> > >  #include <net/netfilter/nf_conntrack_timeout.h>
> > > @@ -80,6 +81,35 @@ static bool udp_error(struct sk_buff *skb,
> > >         return false;
> > >  }
> > >
> > > +static void nf_ct_refresh_udp(struct nf_conn *ct,
> > > +                             enum ip_conntrack_dir dir,
> > > +                             u32 len, u32 extra_jiffies)
> > > +{
> > > +       /* Only update if this is not a fixed timeout */
> > > +       if (test_bit(IPS_FIXED_TIMEOUT_BIT, &ct->status))
> > > +               return nf_ct_acct_update(ct, dir, len);
> > > +
> > > +       switch (dir) {
> > > +       case IP_CT_DIR_ORIGINAL:
> > > +               /* do not refresh in original dir, else stale dnat mapping
> > > +                * can be kept alive indefinitely.
> > > +                */
> > > +               if (nf_ct_is_confirmed(ct))
> > > +                       return nf_ct_acct_update(ct, dir, len);
> > > +               break;
> > > +       case IP_CT_DIR_REPLY:
> > > +               extra_jiffies += nfct_time_stamp;
> > > +               break;
> > > +       case IP_CT_DIR_MAX: /* silence warning wrt. unhandled enum */
> > > +               break;
> > > +       }
> > > +
> > > +       if (READ_ONCE(ct->timeout) != extra_jiffies)
> > > +               WRITE_ONCE(ct->timeout, extra_jiffies);
> > > +
> > > +       nf_ct_acct_update(ct, dir, len);
> > > +}
> > > +
> > >  /* Returns verdict for packet, and may modify conntracktype */
> > >  int nf_conntrack_udp_packet(struct nf_conn *ct,
> > >                             struct sk_buff *skb,
> > > @@ -114,7 +144,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
> > >                         stream = (status & IPS_ASSURED) == 0;
> > >                 }
> > >
> > > -               nf_ct_refresh_acct(ct, ctinfo, skb, extra);
> > > +               nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, extra);
> > >
> > >                 /* never set ASSURED for IPS_NAT_CLASH, they time out soon */
> > >                 if (unlikely((status & IPS_NAT_CLASH)))
> > > @@ -124,7 +154,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
> > >                 if (stream && !test_and_set_bit(IPS_ASSURED_BIT, &ct->status))
> > >                         nf_conntrack_event_cache(IPCT_ASSURED, ct);
> > >         } else {
> > > -               nf_ct_refresh_acct(ct, ctinfo, skb, timeouts[UDP_CT_UNREPLIED]);
> > > +               nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, timeouts[UDP_CT_UNREPLIED]);
> > >         }
> > >         return NF_ACCEPT;
> > >  }
> > >
> > > The obvious counter-argument is "but what if its the reply side that is
> > > sending, and we have a stale SNAT mapping?".
> > >
> > > Solution would be to track timestamp of last packet seen per direction,
> > > and then stop refreshing the timeout if one side ceases sending.
> > >
> > > I think thats much better than what we have now and there would be no
> > > need to actively zap UDP flows, they would timeout automatically once
> > > one side ceases to transmit.
> >
> > If I understand correctly this will have some visible effects, before
> > this change the same tuple will only hit the same destination because
> > the conntrack entry will prevail, and after this patch the packet will
> > be spread out randomly to the number of backends.
>
> Nothing changes unless flow is 100% uni-directional (no
> return traffic OR only reply traffic after initial packet).
>
> Old behavior:
>
> Packet   Direction
>      1   Origin                 # create entry with 30s timeout, save current time
>      2   Reply                  # flag entry assured (cannot be fast-removed
>                                 # if conntrack table is full), refresh timeout to 30s
>      3  Origin                  # refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past
>      4  Origin                  # refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past
>      ...
>      5  Origin                  # refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past
>
>
> Thus, once DNAT mapping changes, conntrack entry remains alive for as
> long as origin sends more packets.
>
> After change:
>
> Packet   Direction
>      1   Origin                 # create entry with 30s timeout, save current time
>      2   Reply                  # flag entry assured (cannot be fast-removed
>                                 # if conntrack table is full), refresh timeout to 30s
>      3  Origin                  # do not refresh timeout
>      4  Origin                  # do not refresh timeout
>      ...
>      5  Origin                  # do not refresh timeout
>
> Once 30s have elapsed, this entry will expire, even if packets are seen.
> Next packet will create a new conntrack, and a new NAT mapping could be
> chosen.
>
>
> If there is reply traffic, nothing changes:
>
> Packet   Direction
>      1   Origin                 # create entry with 30s timeout, save current time
>      2   Reply                  # flag entry assured (cannot be fast-removed
>                                 # if conntrack table is full), refresh timeout to 30s
>      3  Origin                  # do not refresh timeout
>      4  Reply                   # refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past
>      ...
>      5  Origin                  # do not refresh timeout
>
> Thats the general idea anyway.
> I'll try to make this more robust and also let it timeout if we have
> only reply traffic without any origin packets.
>
> > I'm aware of some requests to have this behavior in kubernetes for UDP
> > service, but I'm scared that there can be some people relying on this
> > behavior ... and all the possible edge cases this will open, what
> > happens if we have two UDP packets in one direction before the first
> > reply is seen?
>
> Same as what happens now, 2nd packet follows NAT mapping of first one.

This looks like the way to go ... if you can send me a patch I can do
some testing next week and report back
