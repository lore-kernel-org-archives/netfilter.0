From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [PATCH 1/1] netfilter: ip{,6}t_policy.h should include
 xp_policy.h
Date: Wed, 19 Nov 2008 19:27:37 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0811191926590.4486@fbirervta.pbzchgretzou.qr>
References: <1227111682-14073-1-git-send-email-apw@canonical.com> <49245611.1080905@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <49245611.1080905@trash.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Andy Whitcroft <apw@canonical.com>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org


On Wednesday 2008-11-19 19:08, Patrick McHardy wrote:

> Andy Whitcroft wrote:
>> It seems that all of the include/netfilter_{ipv4,ipv6}/{ipt,ip6t}_*.h which
>> share constants include the corresponding include/netfilter/xp_*.h files.
>> Neither ipt_policy.h not ip6t_policy.h do.  Make these consistant with
>> the norm.
>
> Does this actually fix a bug, or is it just for added consistency?

This can only be consistency, because every compile error would
be easy to fix by inclusion of xt_policy.h in the corresponding
.c file.
Which reminds me, when can we get rid of the ipt_*h files?
