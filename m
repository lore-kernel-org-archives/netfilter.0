From: David Miller <davem@davemloft.net>
Subject: Re: netfilter: remove unused #include <version.h>
Date: Sun, 12 Oct 2008 21:08:42 -0700 (PDT)
Message-ID: <20081012.210842.148758498.davem@davemloft.net>
References: <20081012231045.E7EC.WEIYI.HUANG@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20081012231045.E7EC.WEIYI.HUANG@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: weiyi.huang@gmail.com
Cc: kaber@trash.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

From: Huang Weiyi <weiyi.huang@gmail.com>
Date: Sun, 12 Oct 2008 23:12:51 +0800

> The file(s) below do not use LINUX_VERSION_CODE nor KERNEL_VERSION.
>   net/netfilter/nf_tproxy_core.c
> 
> This patch removes the said #include <version.h>.
> 
> Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

Applied, thank you.
