From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] netfilter: remove CONFIG_NF_CT_ACCT
Date: Tue, 27 Oct 2009 13:39:17 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0910271337120.19847@wotan.suse.de>
References: <alpine.LSU.2.00.0910221615360.8582@wotan.suse.de>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.00.0910221615360.8582@wotan.suse.de>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Piotr Oledzki <ole@ans.pl>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>
Cc: linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

On Thu, 22 Oct 2009, Jiri Kosina wrote:

> I can see several issues with CONFIG_NF_CT_ACCT and I think it should be 
> removed for the following reasons:
> 
> 1) the netlink seems broken for the (CONFIG_NF_CT_ACCT unset && 
>    net.netfilter.nf_conntrack_acct set) scenario. In such case, 
>    ctnetlink_nlmsg_size() seems to miscompute the size of the message, as 
>    the CTA_COUNTERS_* are not counted in at all. Seems quite serious on a 
>    first glance.
> 2) It has been marked as deprecated for quite some time, and was supposed 
>    to be removed in 2.6.29, but is apparently still with us.
> 3) Spits confusing warnings into dmesg.
> 
> All this since commit 584015727a3b ("netfilter: accounting rework: 
> ct_extend + 64bit counters (v4)").
> 
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> --- 
>  Documentation/feature-removal-schedule.txt |    9 ---------
>  Documentation/kernel-parameters.txt        |    3 +--
>  net/netfilter/Kconfig                      |   22 ----------------------
>  net/netfilter/nf_conntrack_acct.c          |   10 ----------
>  net/netfilter/nf_conntrack_netlink.c       |    2 --
>  5 files changed, 1 insertions(+), 45 deletions(-)

Has this one been lost? (aka "ping").

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
