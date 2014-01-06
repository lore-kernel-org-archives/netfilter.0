From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH] netfilter: nf_conntrack: release conntrack from rcu
  callback
Date: Mon, 6 Jan 2014 22:09:33 +0400
Message-ID: <20140106180933.GB2360@moon>
References: <1389023672-14351-1-git-send-email-avagin@openvz.org>
 <20140106170235.GJ28854@breakpoint.cc>
 <20140106172130.GA2360@moon>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=TEo5KuKtE6CkvNzp/O84amlPdHSDuU9MFV0K4U3NWhI=;
        b=y9NTKWSMKdA90t53CG/s4cI5Mijq6XMCpbSbUns1Fcbr0eSpTVu6VTAFmSfJaQXXLC
         CszyWJN30ODXkFav0hGKanzHa3+kGpg6l+R1UoPk0OnQ5K8ATXHPniems4DYR0aCYvtK
         5/UPcgxHgK2oGyhicDpT//9oAY1gGt5Lla+N5zozI9cBB97iBwH/EutVV6WwZRHU1Hq1
         o2Pjdd0/Db6K3hAOkStrZlLufk7pfWhsKwvuO59rP/VgkcqN+lqCxcge7mWHDVfeQvmz
         n6bc+gOdoI0mgT17x3DRA0cFP9k3iMUWfRNBjNhOQuqY3ve76F0oOPy4XmCzqyHpOl3S
         CvPg==
Content-Disposition: inline
In-Reply-To: <20140106172130.GA2360@moon>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Andrey Vagin <avagin@openvz.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, vvs@openvz.org, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>

On Mon, Jan 06, 2014 at 09:21:30PM +0400, Cyrill Gorcunov wrote:
> 
> No? Or there something obvious I'm missing?

Drop my assumption, it can't happen (iow either dying bit is set,
either it clean but tuple can't match then).
