Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1728E17C8B
	for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729251203; cv=none; b=Vh1ImAz8xwLT5s8yxy9zW6Z0i4EiJq3mAYz6hBG6yhZuacqgokaJGtWqgBxcvNSaJ4ZImcK6GLXRyOV9TXFhV8x5L7yWT86pceUpOgLECYj5GH65Evf7AX+wkcjIAhQMBKXUbHoU9JDHE21eaj6B/POYqe5EwrvYYb0C8td3ocY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729251203; c=relaxed/simple;
	bh=twcyWjjpo0p7Y/vZ3wNnTQV4m9IDrkIlVD0I9mEzwvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvc7B/8gMYODg4ztK1B0ic+IT3RWdanjXa9ZTfRx99+4j0SiincV+iuQc9mpd+rU4evp3j4wDTj7Qibl1Wk17mK6lzG8LqAVAKFKMqgEVZTOXwwh5JmOSN7T0k9udLcygi1PIyeiDInMbOUfOlHrLYekbjLGdWkTwrerQ1MRbYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1t1lEM-0007SW-63; Fri, 18 Oct 2024 13:33:18 +0200
Date: Fri, 18 Oct 2024 13:33:18 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Florian Westphal <fw@strlen.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241018113318.GA28324@breakpoint.cc>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <20241017233031.GA3675@breakpoint.cc>
 <CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > The UDP tracker is old and refreshs the timeout for every packet, but
> > who says it needs to stay that way?
> >
> > With very simple patch to only refresh in 'reply' dir:
> >
> >     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> > [DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> >     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> > [DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> >     [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
> >
> > This is with a unidirectional UDP stream.
> >
> > diff --git a/net/netfilter/nf_conntrack_proto_udp.c b/net/netfilter/nf_conntrack_proto_udp.c
> > --- a/net/netfilter/nf_conntrack_proto_udp.c
> > +++ b/net/netfilter/nf_conntrack_proto_udp.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/netfilter.h>
> >  #include <linux/netfilter_ipv4.h>
> >  #include <linux/netfilter_ipv6.h>
> > +#include <net/netfilter/nf_conntrack_acct.h>
> >  #include <net/netfilter/nf_conntrack_l4proto.h>
> >  #include <net/netfilter/nf_conntrack_ecache.h>
> >  #include <net/netfilter/nf_conntrack_timeout.h>
> > @@ -80,6 +81,35 @@ static bool udp_error(struct sk_buff *skb,
> >         return false;
> >  }
> >
> > +static void nf_ct_refresh_udp(struct nf_conn *ct,
> > +                             enum ip_conntrack_dir dir,
> > +                             u32 len, u32 extra_jiffies)
> > +{
> > +       /* Only update if this is not a fixed timeout */
> > +       if (test_bit(IPS_FIXED_TIMEOUT_BIT, &ct->status))
> > +               return nf_ct_acct_update(ct, dir, len);
> > +
> > +       switch (dir) {
> > +       case IP_CT_DIR_ORIGINAL:
> > +               /* do not refresh in original dir, else stale dnat mapping
> > +                * can be kept alive indefinitely.
> > +                */
> > +               if (nf_ct_is_confirmed(ct))
> > +                       return nf_ct_acct_update(ct, dir, len);
> > +               break;
> > +       case IP_CT_DIR_REPLY:
> > +               extra_jiffies += nfct_time_stamp;
> > +               break;
> > +       case IP_CT_DIR_MAX: /* silence warning wrt. unhandled enum */
> > +               break;
> > +       }
> > +
> > +       if (READ_ONCE(ct->timeout) != extra_jiffies)
> > +               WRITE_ONCE(ct->timeout, extra_jiffies);
> > +
> > +       nf_ct_acct_update(ct, dir, len);
> > +}
> > +
> >  /* Returns verdict for packet, and may modify conntracktype */
> >  int nf_conntrack_udp_packet(struct nf_conn *ct,
> >                             struct sk_buff *skb,
> > @@ -114,7 +144,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
> >                         stream = (status & IPS_ASSURED) == 0;
> >                 }
> >
> > -               nf_ct_refresh_acct(ct, ctinfo, skb, extra);
> > +               nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, extra);
> >
> >                 /* never set ASSURED for IPS_NAT_CLASH, they time out soon */
> >                 if (unlikely((status & IPS_NAT_CLASH)))
> > @@ -124,7 +154,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
> >                 if (stream && !test_and_set_bit(IPS_ASSURED_BIT, &ct->status))
> >                         nf_conntrack_event_cache(IPCT_ASSURED, ct);
> >         } else {
> > -               nf_ct_refresh_acct(ct, ctinfo, skb, timeouts[UDP_CT_UNREPLIED]);
> > +               nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, timeouts[UDP_CT_UNREPLIED]);
> >         }
> >         return NF_ACCEPT;
> >  }
> >
> > The obvious counter-argument is "but what if its the reply side that is
> > sending, and we have a stale SNAT mapping?".
> >
> > Solution would be to track timestamp of last packet seen per direction,
> > and then stop refreshing the timeout if one side ceases sending.
> >
> > I think thats much better than what we have now and there would be no
> > need to actively zap UDP flows, they would timeout automatically once
> > one side ceases to transmit.
> 
> If I understand correctly this will have some visible effects, before
> this change the same tuple will only hit the same destination because
> the conntrack entry will prevail, and after this patch the packet will
> be spread out randomly to the number of backends.

Nothing changes unless flow is 100% uni-directional (no
return traffic OR only reply traffic after initial packet).

Old behavior:

Packet	 Direction
     1   Origin			# create entry with 30s timeout, save current time
     2   Reply			# flag entry assured (cannot be fast-removed
				# if conntrack table is full), refresh timeout to 30s
     3  Origin			# refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past
     4  Origin			# refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past
     ...
     5  Origin			# refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past


Thus, once DNAT mapping changes, conntrack entry remains alive for as
long as origin sends more packets.

After change:

Packet	 Direction
     1   Origin			# create entry with 30s timeout, save current time
     2   Reply			# flag entry assured (cannot be fast-removed
				# if conntrack table is full), refresh timeout to 30s
     3  Origin			# do not refresh timeout
     4  Origin			# do not refresh timeout
     ...
     5  Origin			# do not refresh timeout

Once 30s have elapsed, this entry will expire, even if packets are seen.
Next packet will create a new conntrack, and a new NAT mapping could be
chosen.


If there is reply traffic, nothing changes:

Packet	 Direction
     1   Origin			# create entry with 30s timeout, save current time
     2   Reply			# flag entry assured (cannot be fast-removed
				# if conntrack table is full), refresh timeout to 30s
     3  Origin			# do not refresh timeout
     4  Reply			# refresh timeout to 30s OR 2 Minutes, if current time is 2s in the past
     ...
     5  Origin			# do not refresh timeout

Thats the general idea anyway.
I'll try to make this more robust and also let it timeout if we have
only reply traffic without any origin packets.

> I'm aware of some requests to have this behavior in kubernetes for UDP
> service, but I'm scared that there can be some people relying on this
> behavior ... and all the possible edge cases this will open, what
> happens if we have two UDP packets in one direction before the first
> reply is seen?

Same as what happens now, 2nd packet follows NAT mapping of first one.
