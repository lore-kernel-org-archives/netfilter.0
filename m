From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: [ANNOUNCE] libnetfilter_conntrack 0.0.98 release
Date: Sun, 30 Nov 2008 11:03:14 +0100
Message-ID: <20081130100314.GF9523@bla.fasel.org>
References: <49313A4F.6090904@netfilter.org> <20081130094646.GE9523@bla.fasel.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=K6SICXYL5olzvY9Fj1cVk6c80iM=; b=NnPRMT2PNS
	VYcLFn7PJTyeMV4jUhpxxo9fK6BoiVUmUFtEmemm63uGfmyNKKXDMWLmmUV2xR0U
	0we/nb45cs/1HJ+aDWENlcw6TKNLluVOKGZLFNGq5RV9WijJPN5EFj4bmZqU5dqv
	N/VU+8j7ZBIx/heJKWxHWgFh86hCaeRDA=
Content-Disposition: inline
In-Reply-To: <20081130094646.GE9523@bla.fasel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

* Wolfram Schlich <lists@wolfram.schlich.org> [2008-11-30 10:47]:
> After upgrading to 0.0.98 and restarting conntrackd, I constantly
> get such messages on the backup firewall, even after restarting
> conntrackd on both firewalls once again:
> 
> 2008-11-30 10:40:08 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038103 before expected seq=1228039271
> 2008-11-30 10:40:09 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038104 before expected seq=1228039271
> 2008-11-30 10:40:10 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038105 before expected seq=1228039273
> 2008-11-30 10:40:11 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038106 before expected seq=1228039274
> 
> The numbers look kinda confusing to me.
> 
> What's wrong? :)

Interesting... it went away after rebooting both machines at once.
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
