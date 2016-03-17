From: AllKind <AllKind@fastest.cc>
Subject: Re: [ANNOUNCE] ipset 6.29 released
Date: Thu, 17 Mar 2016 06:45:06 +0100
Message-ID: <56EA4462.6010106@fastest.cc>
References: <alpine.DEB.2.10.1603162136130.7414@blackhole.kfki.hu>
Reply-To: AllKind@fastest.cc
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastest.cc; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=rWJnVdc88/bDWQGiY3z2eQeBdmg
	=; b=PR9qzuyMm5Zg8Os340gHdUL9DXzWdw7+7iuneyAT6OfUGdA0WODitOcYsr5
	zEafKjLStfozj+oaOez7lrA5nZkCaLtqbuJvRlWPMVTfGtR5EPVDgHObltYb5ne/
	sU1PXM/MhmJHD4rOyNyhrgH7VWcP/o379BpvLADLfv9lzeDc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=rWJnVd
	c88/bDWQGiY3z2eQeBdmg=; b=SOv2QsMub9maan6pi7WOU9ui/Z9xFdkc4i2N2h
	btK7u1LEoosT304i+E2rcgW3grpSa2Pqe0j3/lbb5pBbp6WWmHvKU8xXsZUDg5TX
	agsAQ5skKYitUhYZS43/mWxc566Lrx3EN7U7SZ//mLb4cp7xe/YG2MiYaYtOYmHZ
	Lzev0=
In-Reply-To: <alpine.DEB.2.10.1603162136130.7414@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On 16.03.2016 21:40, Jozsef Kadlecsik wrote:
> Hi,
>
> ipset 6.29 is released, because the configure script was broken and a
> race condition was fixed in concurrent save-swap and then delete
> operations.
[...]

No more utils update? why?

