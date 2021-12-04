From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Meaning of "." (dot) in netfilter
Date: Sat, 4 Dec 2021 04:36:40 -0500
Message-ID: <5568ea0e-474b-c417-1b35-ba70e5133d90@fhmtech.com>
References: <CAK3NTRAQE7UD9_0EuzyS0UGQ_s++Dg_hbZPXscHBrStnGJHGjw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=5Dc2G14A/VFrq5VazbaHR4RCD1N0KLw16+SNhdAWYQw=;
        b=Qqt7lllzEACPGk951DCOmQ3JDy3PNJOMkxFLQD9lJBLosLCH8+33hL8WM0maZICd55EQxWOHXszWcrVDCY9cUSE8gLVrARM7xRgsiFhjJ6PcYX4wSAf04NRGrXPJJdxD95iYhW3QJdrlrrdxg9wELMWEa/MPJf+OD/xXpeg4eAU=;
In-Reply-To: <CAK3NTRAQE7UD9_0EuzyS0UGQ_s++Dg_hbZPXscHBrStnGJHGjw@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ross Boylan <rossboylan@stanfordalumni.org>, netfilter@vger.kernel.org

On 2021/12/04 01:33, Ross Boylan wrote:
> https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_home_router
> include a number of rules like
> 
>          ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 :
> accept, tcp . 53 : accept, udp . 67 : accept}
> with possibly 2 different uses of ".", namely 'ip protocol .'  and 'udp . 67'.
> What do those "."'s mean?


Hi Ross,

Nftables uses dot "." (admittedly not the easiest term to search on) to 
concatenate fields:

https://wiki.nftables.org/wiki-nftables/index.php/Concatenations

Best regards,
Frank

