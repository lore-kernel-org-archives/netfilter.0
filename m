From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: NETFILTER_XT_MATCH_TIME never matches
Date: Wed, 27 Feb 2008 04:31:56 -0500
Message-ID: <bdbas35og2s9ed685gembios1quu474u23@4ax.com>
References: <srt5s39vrkkafaaplm2thi2bljal801pdc@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> Unfortunately, XT_MATCH_TIME seems never to match, with the effect that all of
> my traffic is blocked.

Not sure what was going on, but for the archives, I cleared out and rebuilt the
firewall and now the time matches are working again.

-
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
