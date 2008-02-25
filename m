From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: NETFILTER_XT_MATCH_TIME never matches
Date: Mon, 25 Feb 2008 12:25:30 -0500
Message-ID: <srt5s39vrkkafaaplm2thi2bljal801pdc@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I've been successfully using IP_NF_MATCH_TIME via patch-o-matic for quite a
while, up through iptables 1.3.8.  With iptables 1.4.0 and kernel 2.6.24, I saw
that IP_NF_MATCH_TIME had been replaced by NETFILTER_XT_MATCH_TIME native in the
kernel, so I switched to that.

Unfortunately, XT_MATCH_TIME seems never to match, with the effect that all of
my traffic is blocked.  Is this a known bug?  Anyone else encountered it?  I
can't find a mention of it on the list.

Thanks,
Andrew.

-
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
