From: Eric Leblond <eric@inl.fr>
Subject: Re: Expectation table size
Date: Fri, 10 Oct 2008 19:06:50 +0200
Message-ID: <20081010170650.GD11769@bayen.regit.org>
References: <48EF68D6.7020807@pisem.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48EF68D6.7020807@pisem.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yawhen Kasarzhewski <yevg@pisem.net>
Cc: netfilter@vger.kernel.org

Hi,

On Friday, 2008 October 10 at 17:38:14 +0300, Yawhen Kasarzhewski wrote:
> Hi,
>
> does any one know which is the default expectation table size and how to  
> enlarge it?
>
> I get lots of messages in dmegs like:
>
> nf_ct_q931: packet dropped
> __ratelimit: 129 messages suppressed
> nf_conntrack: expectation table full


You can try to use :
	/proc/sys/net/netfilter/nf_conntrack_expect_max

It should behave like /proc/sys/net/netfilter/nf_conntrack_max.

BR,
-- 
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
