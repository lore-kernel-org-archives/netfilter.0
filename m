From: Unknown <unknown@unknown.invalid>
Subject: Re: iptables 1.2.9 and kernel 2.6.0 -- interesting problem
Date: Thu, 25 Dec 2003 16:29:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <17673.1291380294$1072751350@news.gmane.org>
References: <200312240159.57376.Alistair Tonner <>>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

On December 24, 2003 01:59 am, Alistair Tonner wrote:
> 	One thing I've noted whilst playing with moving to 2.6.0 with iptables
> 1.2.9 -- for some reason
> 	iptables -A POSTROUTING -t nat -o ppp0 -j SNAT --to-source xx.yy.zz.qq
> 	(my outside ip address) just plain doesn't work.  -- in my

	<< snippage for brevity >>

>
> 	it rather looks like iptables command is trying to parse what to do with
> --to-source rather than passing it to libipt_SNAT.so ....
> 	Am I just in need of some patching here ... or do I need to rebuilt
> userspace stuff with the new kernel?
>

	To answer my own question, Yes.

	Rebuilt 1.2.9 iptables userspace under new kernel and things now work.

	Alistair Tonner

