From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Sun, 09 May 2010 14:35:16 +0200
Message-ID: <4BE6AC04.5000504@tana.it>
References: <4BE5B9CA.5090606@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1273408455; bh=fnrX3ndCSGhcKb2Ga80PdY3p0tWxbJAOCx+1mg6wDOY=;
	l=1005;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=dydkJF9Xh1LwJfJfBUnvy8rcdmxmEzbPwxOSrLV8QhDmb5TdfpG/Z+evFe01NDoLh
	 ssi9UdoQ3Yu2ZNAshPyFwg1i7RXRgL6uPwl6w/Yo1sdSpoBibfN7uF8c7AR0W0Vp21
	 UeYI2beybNcTTIPuXZfZ7YJMRaseex6TLEhR6QKQ=
In-Reply-To: <4BE5B9CA.5090606@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David F <netfilter@meta-dynamic.com>
Cc: netfilter <netfilter@vger.kernel.org>

David F wrote:
>  I changed my 
> code to use htonl() on the mark-value prior to calling 
> nfq_set_verdict_mark(), and it all suddenly started working.

Since it is not documented, everyone rediscovers it anew. See e.g. 
http://www.gossamer-threads.com/lists/iptables/devel/62591


> I had a quick look through the source code of libnetfilter_queue and 
> libnfnetlink_queue and didn't see any obvious byte-order conversion 
> prior to sending to the kernel, so I wonder if anyone could help me 
> understand,
> * Is the mark value _supposed_ to be supplied in network byte order or 
> is something else going on here;
> and if so,
> * Since the mark never hits the wire, why would it ever be kept in 
> network byte order?

The latter is an issue in kernel programming, where all code in a 
given set assumes an established byte order. In facts, it is not 
uncommon to have the same word byteswapped multiple times on the 
same machine for the sake of obeying conventions.

HTH
