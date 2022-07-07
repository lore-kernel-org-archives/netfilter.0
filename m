From: Kerin Millar <kfm@plushkava.net>
Subject: Re: CONNMARK rules
Date: Thu, 7 Jul 2022 14:31:56 +0100
Message-ID: <20220707143156.4bac152c2c4d4ad65945767f@plushkava.net>
References: <20220707151739.06206fa5b2536669309e8041@xaq.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1657200713; x=
        1657287113; bh=D63k1oK9NnSyOV8cSGXIRCVoUHrQHTq0toxo8N2lVns=; b=q
        1lnjDI3MQDNvHSpHREsYcU4dH9nlcHOH9oF6RAfWIL4NHdJo0O3g3cPr/CFS48VL
        bubZArFEoXYI+dXMou6lAh96nOIdiWnqCmhRAp0Q1rEbThnjBvRErguM+1tUk49P
        QFgMPQA2P+kT5p8sQSbAIoYja4Nd6hr8q7/LVGe6mxQ6ZwnaltTx9Mb2UyRsWtxb
        Pq2XPtpiGvvZUOL0vyinANeuv6Wj/TucotUA7DSP1pmgk48S0ChhZII5uRUkEeLO
        T9iLJpcPPDUXvtJfj8a25/qB9KYLqFjew7/LWvuXWlAVvRg9Nan+bkciVcb+aWOu
        +yUlJHSz2yvF+kTqvbhBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657200713; x=
        1657287113; bh=D63k1oK9NnSyOV8cSGXIRCVoUHrQHTq0toxo8N2lVns=; b=p
        cBqx9pLzTKKCeLxWJ5E4BVVpbvnQqV843WCxTICrUtRInMP91OIsZjqUX2ogG/UT
        4cX7CfLpvg2gLwCEHxty5KrK0xRcNVBzjZYaggfNBLA66GW2QoCnbUP0n3HFEWs/
        5yUqDqdEfv/jM6Kgu/s4PlZkmLXf7iOpg6NOsOv2fP/p466GsWB0McZvSlQO+yuf
        X+fA86b9TdIPGsR/r54W3ttONDQijN2YheHHjsCScYQ0hmF+KE9QiofH8ZTh3yXo
        lwOtAnpg02tYugmXlRzr4diyu1NZlOFL6VVgH84n3r1+S3J9hfnwse4+ycCn6sHQ
        VItUgECDDNj2HjIH0KXjQ==
In-Reply-To: <20220707151739.06206fa5b2536669309e8041@xaq.nl>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Richard Lucassen <mailinglists@xaq.nl>

Hi Richard,

On Thu, 7 Jul 2022 15:17:39 +0200
Richard Lucassen <mailinglists@xaq.nl> wrote:

> Hello list,
> 
> I have two lines in the iptables PREROUTING mangle table to split up
> traffic from even and odd ip numbers:
> 
> -s 10.32.24.0/23 -j CONNMARK --set-mark 0x1001
> -s 10.32.24.0/255.255.254.1 -j CONNMARK --set-mark 0x1000
> 
> But I noticed that rules in this order does not work (everything
> gets 0x1001):
> 
> -s 10.32.24.0/255.255.254.1 -j CONNMARK --set-mark 0x1000
> -s 10.32.24.0/23 -j CONNMARK --set-mark 0x1001
> 
> So I assume the the CONNMARK rules are not end rules (hit = exit)
> 
> Is that correct?

Yes, it is. This could be confirmed by inspecting the rule counters or by using the TRACE target.

-- 
Kerin Millar
