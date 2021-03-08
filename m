From: "" <kfm@plushkava.net>
Subject: Re: when will nftables have ability to delete matching rule like
 iptables?
Date: Mon, 8 Mar 2021 15:24:22 +0000
Message-ID: <0a56115b-e5aa-81a9-2b69-3cd5d11609c9@plushkava.net>
References: <d27a2a67-6739-6ade-d822-bbefd9c8bcd4@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=/
        sv+wB97MTIN4CWX7jCrZXTD2Gfcb/635X9dxBZ6bpY=; b=L0WQ7GrD0WUilsh4P
        41Q0W4gJdVLgD5sHnbwviXadNbwMHG+3iL9L6cN+UNphAh+Gc/4kdKOUpG4En01+
        LHDgCrpVuptLMjfrxmjOLcw3QA2Nrcs0P1AL3Bch43q61a9w6fAR9Kjr/JR2Kuzg
        dpz2nY0rdVbwzHIG2aG0ikwecFC2XYvnpzjiCjn/10IbFyvEyJ2/kiy6tjsFbfpn
        dSQuOotkKkl1z4e1W6K8BUsJMkYU70xsl+iIHvcsSsZEopniPSIjdyWXsHRz9W3j
        nGxLjVFiEoo/rg7abKlvEs2lsbP2QyLimx1S2GEs/HPCxV8YUHcPT2QwnYp5A+pL
        x9iCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=/sv+wB97MTIN4CWX7jCrZXTD2Gfcb/635X9dxBZ6b
        pY=; b=dnT5PVfe5mgmSsfXRnWnVixUTFiRHL5KfBfkcPZ5tLYGH/tx2bU8ghesX
        oBb/tVCn6AFKE2S9KLsIxgPR0fn+0ohB5IWoNV2oC+IVDyAwI6dtKvMjinifJUNz
        BIK0IY7/OFEKxbKyzSMbKdF65go0KNL3w0qngdVzaM5OU50gmPz59ANA3N9hVRG2
        ZV/2Um0HcDYclgQS0UEgJ2XbOPtxAFY6dApf4qgyrRqY8g9i0JuQmaHMTeNgdndo
        iMLIPaMYCcF5D8O0avxaMmkpqfYJ4TpJ5G+/FLdCczfSXP8/M+rmZN3E1dKhYlgt
        d4NmuXF+DIQG3BxihQWZhcizgS6pA==
In-Reply-To: <d27a2a67-6739-6ade-d822-bbefd9c8bcd4@gmail.com>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Amish <anon.amish@gmail.com>, netfilter@vger.kernel.org

On 08/03/2021 13:14, Amish wrote:
> Hello,
> 
> I have few programs that currently use iptables to add / delete firewall 
> rules.
> 
> I have been waiting to migrate to nftables from 3-4 years. (I do not 
> want to use nft based iptables)
> 
> But roadblock for me is inability of nftables to delete a matching rule. 
> (similart to iptables -D INPUT -s 192.168.1.10 -j ACCEPT)
> 
> Obtaining the handle first and then deleting is difficult programmatically.
> 
> Have I missed any easy way out here?

Assuming that "-D INPUT -s 192.168.1.10 -j ACCEPT" is indicative of the 
rules that are being added and removed, the easy way would be to 
manipulate a set rather than a chain. That also goes for iptables, given 
the existence of ipset.

-- 
Kerin Millar
