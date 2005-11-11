From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: DNAT query
Date: Fri, 11 Nov 2005 13:20:13 +0100
Message-ID: <43748C7D.7060206@mnemon.de>
References: <20051111103020.GB18203@tranquility.scriptkitchen.com>
	<437478FE.8000804@mnemon.de>
	<20051111114120.GA22915@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051111114120.GA22915@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Payal Rathod schrieb:
> On Fri, Nov 11, 2005 at 11:57:02AM +0100, J?rg Harmuth wrote:
> 
>>Some time ago I had a similar problem with SLES8 and nat/OUTPUT. The
>>reason was, that is was the _only_ netfilter optio, that wasn't compiled
>>into the kernel :) I generally don't work with SuSE, so I don't know.
>>Bur maybe they still don't compile it as a kernel module.
> 
> 
> So what do you suggest? How do I use it now? Do I have to recomiple te 
> kernel for that? I never done that before.
> With warm regards,
> -Payal

It depends. But as Robs solution works for you, it looks like you only
need to redirect/forward connections (roughly: PREROUTING -> FORWARD ->
POSTROUTING). You only need nat/OUTPUT for packets, generated on the
firewall itself (roughly: local process -> OUTPUT -> POSTROUTING). If
you need to redirect locally generated packets *and* nat/OUTPUT isn't
compiled - well, yes then you have to compile the module from the kernel
sources (which in this case is simple, because you only have to enable
one option).

HTH,

Joerg

