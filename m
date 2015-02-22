From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] net: Remove state argument from skb_find_text()
Date: Sun, 22 Feb 2015 16:01:34 -0500 (EST)
Message-ID: <20150222.160134.1858529175720867561.davem@davemloft.net>
References: <1424601995-17318-1-git-send-email-prtvar.b@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1424601995-17318-1-git-send-email-prtvar.b@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: prtvar.b@gmail.com
Cc: netdev@vger.kernel.org, tgraf@suug.ch, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, dan.carpenter@oracle.com

From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Sun, 22 Feb 2015 11:46:35 +0100

> Although it is clear that textsearch state is intentionally passed to
> skb_find_text() as uninitialized argument, it was never used by the
> callers. Therefore, we can simplify skb_find_text() by making it
> local variable.
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
> v2: Rebased against current linux-next

Applied, thanks.
