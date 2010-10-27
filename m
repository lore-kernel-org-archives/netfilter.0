From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: ipv6 tproxy / transparent proxy support?
Date: Wed, 27 Oct 2010 10:12:03 +0200
Message-ID: <4CC7DED3.2090701@wpkg.org>
References: <4CC71459.5020809@wpkg.org> <4CC7BEF9.6010906@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=default; bh=McRmPYbC3
	oTOlzR9emlb8mos9oA=; b=D/yIEp0Y9lPhi3YdnLgsU9HWUWX5yQv8CzTNUD+5H
	A8qS65C5KIV6w/hQ0qnH05rEWqjCwlGEPxN2js40uYUxl6NWfm/TPPrT9+EDxpLJ
	I1yJeL3RczZ1PCa2xuqBwK2693HEAvhbUS8zSB9fYmWxhyNNeledxoaQB6WttRvc
	fE=
In-Reply-To: <4CC7BEF9.6010906@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: netfilter@vger.kernel.org

On 27.10.2010 07:56, Amos Jeffries wrote:
> On 27/10/10 06:48, Tomasz Chmielewski wrote:
>> What is the state of tproxy / transparent proxying (i.e. with Squid)
>> with ipv6?
>
> The state?
>
> * kernel - pending release
> * iptables - patches queued for audit.
> * squid - supported in 3.1 production releases.
>
> I've just updated the squid wiki tproxy4 page with details and links to
> the bits you need as of today.

I see the page[1] contains command line iptables examples, but no 
ip6tables ones. Do you know the syntax for ip6tables, and if so, could 
you add an example to the squid wiki tproxy4 page as well?


[1] http://wiki.squid-cache.org/Features/Tproxy4


-- 
Tomasz Chmielewski
http://wpkg.org
