From: Tom <tom@foscore.com>
Subject: Re: Dropping UDP packets to port 53 containing known domain string?
Date: Mon, 2 Aug 2021 01:39:24 -0400
Message-ID: <72e9e837-5890-e646-79e1-3486e9d7da79@foscore.com>
References: <6bf250e7-e0ba-43f2-6e35-c858e85db41c@foscore.com>
 <8900c969-32f9-00c1-b78d-bc84b7381034@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1627882765;
        bh=E6i9IlPp10PpEbB25AoCWneQltIbrqPq9bOYJe1GJZY=;
        h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
        b=KMT/AiIEAQvYG+eTqEqD5eKuloocdSwg6a8HYLW9iJwPqJnOlB1Mwb1a9Mrx7um8Y
         Z/EXNCEPKohGeghP4bpXHE2zgTAw5fACh+GRB/7ZFfLxZmGE9+tBNWl5B/KnLv9AXE
         0mSaSDvc0NMG/yEknyB3uotVwC9EwABlFm2S/oBc=
In-Reply-To: <8900c969-32f9-00c1-b78d-bc84b7381034@plushkava.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Kerin Millar <kfm@plushkava.net>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 2021-07-27 2:09 a.m., Kerin Millar wrote:
> Let us begin with `tcpdump -n -s0 -X udp port 53`. Here is the payload 
> of an offending query, including the encapsulating IPv4 header.

> 0x0000:  4528 003a bb51 0000 f211 3319 4bad 43f9  E(.:.Q....3.K.C.
> 0x0010:  c422 8657 0035 0035 0026 0000 0001 0100  .".W.5.5.&......
> 0x0020:  0001 0000 0000 0000 0870 697a 7a61 7365  .........pizzase
> 0x0030:  6f03 636f 6d00 002e 0001                 o.com....
Thanks a lot for your very informative reply. Sorry for the delay in 
responding. With your help I got it to work. Thanks very much!
