From: "Karthik V" <karthikv.vk@gmail.com>
Subject: Re: Error when IPRANGE used on 2.4 Kernel
Date: Thu, 6 Nov 2008 20:34:42 +0530
Message-ID: <13c27d00811060704p70f36b48hfb87dbaeaddbf717@mail.gmail.com>
References: <13c27d00811060625v7da1b917t37b0dd8a84c58f71@mail.gmail.com>
	 <alpine.DEB.2.00.0811061552340.29399@aurora.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=n1umFhe2QvdEEm9qvQdu0o+fNqRQtcUD32qqnhsXoIs=;
        b=f0xxyV2PyxasVLAlneEWzyYD9gicBOEm/hQVEKq5e3y7shWo5KwuxFH9JcgVhBfPJs
         CDR76IZ9EiPyUJ8/WLU7ItmNe4X5lJPAJjkpqFDjxWyvsVAuvBspD5RI3ZjBN7Ne0kJS
         Tlq7zCrh854G5mSDLBTO/qaciy2sRoXze+nTo=
In-Reply-To: <alpine.DEB.2.00.0811061552340.29399@aurora.sdinet.de>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: netfilter@vger.kernel.org

I agree with the stupid IP part...it was just for the mail. I did try
quite a few IP addresses.

But on the comment about it not being part of 2.4. I assumed that
iprange is patched when I received the following message:
Error: iprange: Bad IP Address ..... Pretty sure it entered
libipt_iprange: parse_iprange function.

-Karthik

On Thu, Nov 6, 2008 at 8:24 PM, Sven-Haegar Koch <haegar@sdinet.de> wrote:
> On Thu, 6 Nov 2008, Karthik V wrote:
>
>> I am faced with a weird error for IPTABLES version 1.2.9 on 2.4
>> kernel. The following command:
>>
>> iptables -A INPUT -m iprange --src-range 192.168.0.0-192.168.0.0 -j ACCEPT
>>
>> - fails on 2.4 Kernel with Error: No chain/target/match by that name.
>>
>> - But the same command is working on other systems with 2.6 kernel
>> viz., Fedora Core 6 Desktop and OpenWRT router.
>
> I think kernel 2.4 just does not support -m iprange at all, unless you
> patched it to your kernel tree yourself.
>
> Also the range '192.168.0.0-192.168.0.0' looks quite stupid to me, as
> this is just one address.
>
> c'ya
> sven
>
> --
>
> The Internet treats censorship as a routing problem, and routes around
> it. (John Gilmore on http://www.cygnus.com/~gnu/)
>



-- 

Bill Vaughan  - "The tax collector must love poor people, he's
creating so many of them."
