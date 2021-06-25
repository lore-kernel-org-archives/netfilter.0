From: David Hajes <david@hajes.org>
Subject: Re: Reload IPtables
Date: Fri, 25 Jun 2021 22:51:47 +0200
Message-ID: <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1624654308; bh=yjK3ojPbWl/5m86shh+klRI5ap1vtKE9LlZaY60XaGI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=pRDEeyV3HpqvvgH691BnXampahPylrhhhC67CMqlayftQqD4OqDDWDhckFo5ZBqPt
         m+pGQsYz8t6Qbs3S0VNxTw3LB4M3Kg6J2rBaXTFnZmL31Zfbh3pd7yol5uKVusnGAX
         YxRxOzybDuUKgXE662LJJfzgO0Wn1XKzz/RDsE8VBOb1rP6q6Woo5RBRgWzz+QldfH
         LTuVYkGzVm3B7e4IS2P5auq2RGG6Qs81WgvvDwktgULHIXSv3gAzGeL2CXos1D2pyJ
         nTg94rxmT1jXskDCTkhpA3C0PcJPUFAUkdh++0yO7I22Jsw6UUP57eBsDkGiTpQklz
         5dFoDQF5OphIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1624654308; bh=yjK3ojPbWl/5m86shh+klRI5ap1vtKE9LlZaY60XaGI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=pRDEeyV3HpqvvgH691BnXampahPylrhhhC67CMqlayftQqD4OqDDWDhckFo5ZBqPt
         m+pGQsYz8t6Qbs3S0VNxTw3LB4M3Kg6J2rBaXTFnZmL31Zfbh3pd7yol5uKVusnGAX
         YxRxOzybDuUKgXE662LJJfzgO0Wn1XKzz/RDsE8VBOb1rP6q6Woo5RBRgWzz+QldfH
         LTuVYkGzVm3B7e4IS2P5auq2RGG6Qs81WgvvDwktgULHIXSv3gAzGeL2CXos1D2pyJ
         nTg94rxmT1jXskDCTkhpA3C0PcJPUFAUkdh++0yO7I22Jsw6UUP57eBsDkGiTpQklz
         5dFoDQF5OphIA==
In-Reply-To: <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: slow_speed@att.net, netfilter@vger.kernel.org

on Debian I flushed all tables including custom tables and used to run 
iptables bash script before I moved to nftables. OpenBSD same strategy - 
flush and reload pf.conf

if that is what you mean by reload.

On 25/06/2021 21:24, slow_speed@att.net wrote:
> What is the preferred command to reload the current rules for 
> iptables? (Please include Debian environment, if distro-specific.)
>
