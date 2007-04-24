From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: connlimit with fc6
Date: Tue, 24 Apr 2007 14:36:45 +0200
Message-ID: <1814bfe70704240536i3c244e04s36ada9cc56459c9f@mail.gmail.com>
References: <2104.213.253.216.2.1177418608.squirrel@webmail.zhnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=VfSS7yYwJfMfNk1tiWNqzSIcCZhCbaOIWvxlyIBaJdfbCXRSznJYee42sGgMd9EB8Nxed0o03ylMp5WoVqt9+fXVYvV+rlebmZDnr/bUxLxY5CDo1VftGpemW6NQp8TgV8mVl7l5CiIsYeOHKWoOSU63Kdftqd4EZe1XZ1p7+9U=
In-Reply-To: <2104.213.253.216.2.1177418608.squirrel@webmail.zhnet.hu>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "kako@zhnet.hu" <kako@zhnet.hu>
Cc: netfilter@lists.netfilter.org

Hi,
maybe you can try explanation you can find at

http://forum.openwrt.org/viewtopic.php?pid=10114
of course you should to patch your kernel and iptables in order to
support conlimit feature.

Regards

Elvir Kuric

On 4/24/07, kako@zhnet.hu <kako@zhnet.hu> wrote:
> Hi,
>
> I'd like to use the connlimit feature.
> I found it is available by patch-o-matic, and this is the problem, never
> used it, and don't know, how to start.
> I've tried to patch but didn't succeded.
>
> could anybody help?
> there is a newly installed fc6, with 2.6.20-1.2944 kernel, kernel-devel,
> kernel-headers, iptables-devel-1.3.5-1.2.1, iptables-1.3.5-1.2.1 packages
> installed.
>
> how to start?
>
>
> thanks
>
> Istvan Kassai
>
>
>

