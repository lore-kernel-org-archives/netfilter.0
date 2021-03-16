From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: How to concatenate subnet with port in a set?
Date: Tue, 16 Mar 2021 12:04:22 -0400
Message-ID: <95b92126-5d58-c8ef-1510-d2797488f14e@fhmtech.com>
References: <5q7dsb7wp.iCi4WV@prvy.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=z27nq8U64tnQ7cjlaRsVW1nD82jKKANraUGbYylowRo=;
        b=MA7gJlAOozJccy1ffwSaZcLE/Ny3SEomycMV1Hc8qwGFpY2eswtrt2yeMwdFHPgrkSBFSWy4FpyACrqnnx3+eovKeGUtNFeXqkguTYadEmIOTHzHJD3K/TfHxjCoktyekR+doqoqJVN73S5wNwlaUQpGe5ZooQ3/sz62wMSy+Ag=;
In-Reply-To: <5q7dsb7wp.iCi4WV@prvy.eu>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: lists.netfilter.org+0cvssbcc2j@prvy.eu, netfilter@vger.kernel.org

On 2021/03/16 11:34, etkaar wrote:
> Hello!
> I am currently using <nftables v0.9.0 (Fearless Fosdick)> on Debian 10 (Buster). For a whitelist, I thought about a set like this:
> 1> set whitelist_ipv4_tcp {2>     type inet_service . ipv4_addr3>     elements = {4>      22 . 255.255.255.255,5>      22 . 255.255.255.0/246>     }7> }
> You can see, that on line 5 I used a port concatenated by an IPv4 subnet. Unfortunately, this will not work. I could use subnets, but only as a simple unconcatenated set.
> My question is: When will it be possible to concatenate subnets with different types such as inet_service (= port) in sets? Or is it already possible in a newer version than 0.9.0?

Hi Etkaar,

https://marc.info/?l=netfilter&m=158575148505527&w=2

nftables 0.9.4 / Linux kernel 5.6 added support for ranges in 
concatenations.

Best Wishes,
Frank
