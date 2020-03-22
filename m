From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 10:47:34 -0400
Message-ID: <e4b0dac3-78a3-c515-975d-5d8410e4e720@fhmtech.com>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <c3cba3e7-4cbb-13f5-7104-e1129416b5e0@fhmtech.com>
 <161865440.26652.1584887186397@ox93.mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=TrC5IouaU0kJFF/9HOwNF9i5lgbEc61cz5JvMBi5gFg=;
        b=QIqnLCHDDNbDTQb3JxzBu0i0Uc6YkAebSU3FVQvlT2h0RKFDkIL+XR1VYhVuIxRaJlmHIBs8p5N9N5anEcTUmkFtuCwnWtRmKpVDvm5Gs3fkXWb/Nss7MPgGPcisVlH2mOuhBL03n0HnPVRZfTw+mVWY0B2MYMOykZ6Fm2vWYss=;
In-Reply-To: <161865440.26652.1584887186397@ox93.mailbox.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/22 10:26, Darius wrote:
> Great Frank that helps!
> I had another idea of mark tcp and udp packets with the same mare in prerouting and then use mark in the rule. Any downsides with this solution compared to payload expression?

I think your packet-marking method would work. But then you'd need 2 
rules in prerouting as well as a rule in filter...right? Plus complexity 
of remembering which mark you're using for what. I'd prefer to avoid 
that if possible.

Best regards,
Frank
