From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: [ANNOUNCE] libnetfilter_conntrack 0.0.98 release
Date: Sun, 30 Nov 2008 10:46:46 +0100
Message-ID: <20081130094646.GE9523@bla.fasel.org>
References: <49313A4F.6090904@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=uBtwOXKGbho4CcuXDmh//hID0aY=; b=gp2lLMwUsR
	f8r4+hNJKiX7vCXFfw+29PoXQUqqILOYMYyVekUVX3doRsOcdyJyErjpNQy9Pmoe
	PrfDAF334sRt7+kvjvc2N3d/wg7v1JfPqutFsyYNms4N9AhllCGqHDPwCZlYk6DG
	eH/jWcS17gJxm2se7CdF6XSXnNYvvzC4M=
Content-Disposition: inline
In-Reply-To: <49313A4F.6090904@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

* Pablo Neira Ayuso <pablo@netfilter.org> [2008-11-29 13:49]:
> Hi!

Hey :)

> The netfilter project proudly presents libnetfilter_conntrack-0.0.98.

After upgrading to 0.0.98 and restarting conntrackd, I constantly
get such messages on the backup firewall, even after restarting
conntrackd on both firewalls once again:

2008-11-30 10:40:08 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038103 before expected seq=1228039271
2008-11-30 10:40:09 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038104 before expected seq=1228039271
2008-11-30 10:40:10 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038105 before expected seq=1228039273
2008-11-30 10:40:11 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038106 before expected seq=1228039274

The numbers look kinda confusing to me.

What's wrong? :)
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
