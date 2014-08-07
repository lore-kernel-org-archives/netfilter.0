From: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: Re: Match EUI64 in IPv6 Address
Date: Thu, 07 Aug 2014 23:30:40 +0200
Message-ID: <53E3F000.2030004@dupond.be>
References: <53E3E6B5.4000300@dupond.be> <4E5779AD88B2F040B8A7E83ECF544D1A538AA5@SJCPEX01CL02.citrite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dupond.be; s=mail;
	t=1407447043; bh=lho7oHU/9p8oyqIPU4s50o6ZfprKWek1iiohImt5+3Q=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=SLdIuloMl73UNS9PvMMuuDMM3/z4ACBRyW8UCmaQRnmfRzfxcroSfbkJQIr1PW/L1
	 8z53IVJD1wlOYWEc1gLUfTBWaqOZkkq8oT2lePrEDw1bGIzsJRHZroN5dfc3yKr0nS
	 pdWkQqMekWeg1LqLGjAMAb2Zq/WM4fjAGD4YSMBk=
In-Reply-To: <4E5779AD88B2F040B8A7E83ECF544D1A538AA5@SJCPEX01CL02.citrite.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Haran <Jeff.Haran@citrix.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Op 07-08-14 om 23:14 schreef Jeff Haran:
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Jean-Louis Dupond
>> Sent: Thursday, August 07, 2014 1:51 PM
>> To: netfilter@vger.kernel.org
>> Subject: Match EUI64 in IPv6 Address
>>
>> Hi,
>>
>> I'm in the following situation.
>> My ISP gives me native IPv6 connectivity, a /56 range.
>>
>> The only thing is, the prefix is dynamic, it changes every 96hours.
>>
>> Now my router announces this range to my clients, and everything works fine.
>> But then comes the issue.
>>
>> I firewall my LAN on my router, so there is no need for a firewall on al
>> the clients.
>> But as the prefix is dynamic, I can't just fix this in a clean way.
>>
>> Every time the prefix changes, I need to adjust my ip6tables rules.
>>
>> So my question: Is there a way to make an ip6tables rule that only
>> matches the last 64 bits (the EUI64)?
>> This would solve the issue that i've got.
>>
>> Thanks
>> Jean-Louis
> The ip6tables man page states that one can following the IPv6 address in a -s or -d match with a mask.
>
> So presumably something like this should work:
>
> ip6tables ... -s ::<EUI64>/::ffff:ffff:ffff:ffff ...
>
> Though I admit, I've never tried this myself.
>
> Jeff Haran
>

Thanks alot! This seems to work fine indeed.

Thx
Jean-Louis
