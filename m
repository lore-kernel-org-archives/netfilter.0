From: Patrick McHardy <kaber@trash.net>
Subject: Re: [PATCH 1/1] netfilter: ip{,6}t_policy.h should include xp_policy.h
Date: Wed, 19 Nov 2008 19:08:17 +0100
Message-ID: <49245611.1080905@trash.net>
References: <1227111682-14073-1-git-send-email-apw@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1227111682-14073-1-git-send-email-apw@canonical.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andy Whitcroft <apw@canonical.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

Andy Whitcroft wrote:
> It seems that all of the include/netfilter_{ipv4,ipv6}/{ipt,ip6t}_*.h which
> share constants include the corresponding include/netfilter/xp_*.h files.
> Neither ipt_policy.h not ip6t_policy.h do.  Make these consistant with
> the norm.

Does this actually fix a bug, or is it just for added consistency?
