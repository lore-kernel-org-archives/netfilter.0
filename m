From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fwd: question about using conntrack to change the mark
Date: Mon, 21 Aug 2023 12:29:15 +0200
Message-ID: <ZOM8e8u+BK3jBNrE@calendula>
References: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
 <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony He <huangya90@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Aug 21, 2023 at 03:44:54PM +0800, Tony He wrote:
> Hi,
> 
> I am using Openwrt. The version is:
> root@OpenWrt:/# cat /etc/openwrt_release
> DISTRIB_ID='OpenWrt'
> DISTRIB_RELEASE='23.05.0-rc2'
> DISTRIB_REVISION='r23228-cd17d8df2a'
> DISTRIB_TARGET='ipq806x/generic'
> DISTRIB_ARCH='arm_cortex-a15_neon-vfpv4'
> DISTRIB_DESCRIPTION='OpenWrt 23.05.0-rc2 r23228-cd17d8df2a'
> DISTRIB_TAINTS=''
> 
> And kernel is:
> root@OpenWrt:/# uname -a
> Linux OpenWrt 5.15.118 #0 SMP Mon Jun 26 11:20:39 2023 armv7l GNU/Linux
> 
> 
> Seems that I can not use command " conntrack -U -p tcp -m 1" to change the mark.
> root@OpenWrt:/# conntrack  -L  -p tcp |grep mark=0 |wc -l
> conntrack v1.4.7 (conntrack-tools): 302 flow entries have been shown.
> 302
> root@OpenWrt:/# conntrack -U -p tcp -m 1
> Operation failed: Not supported
> conntrack v1.4.7 (conntrack-tools): Operation failed: Not supported

Please, try this patch:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821101751.4083-1-pablo@netfilter.org/

> I need to add option "-f ipv4", but not all entries can be updated
> successfully. "Protocol error" is reported.

EPROTO means netlink sequence numbers are not fine, which might refer
to another userspace bug.

I made another patch, error handling was not robust in the -U case (no
exit_error was used, instead printf).

Also try this patch on of the previous patch.

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821102739.4893-1-pablo@netfilter.org/

Thanks for reporting.
