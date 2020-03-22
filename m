From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 10:43:12 -0400
Message-ID: <0b44d0eb-5d52-d0c8-fe6c-ccbe6ba88e01@fhmtech.com>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=jN9OeGwNZIemJ400ytfBQ+/C5PTbYVUAdD2qU9C959o=;
        b=F0QAER7NeAUC7TfpD3WT63B7R4QZE/pJ1hjVlFSe1a29pE57aA81V441/y6Q1RUmOjYh1o0PWAgrWQjM5iEVgzmjAiQo8Oz1RBMOmYzQqwdfB1bhq6zkta2SLqr3Kus9sQRF9IsFhOpsCp8b+D0eA8yVTq2BpPYQ5BBx27hjv0c=;
In-Reply-To: <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/22 10:11, Reindl Harald wrote:
> 
> Am 22.03.20 um 14:40 schrieb Darius:
>> Hi,
>> I can't find the way to make one rule matching packets with the same dport either on tcp or udp. So far I have rules like this:
>>
>> ip protocol tcp tcp dport 2000 counter accept
>> ip protocol udp udp dport 2000 counter accept
>>
>> I would like to have one rule instead. I couldn't find the way to do it with intervals or maps because dport statement must go together with tcp or udp.
> 
> not sure for nftables but with iptables "ipset" is the solution
> 
> --------------------
> 
> Name: DNS_PORT
> Type: bitmap:port
> Header: range 53-53
> Size in memory: 80
> Number of entries: 1
> 
> Members:
> 53
> 
> --------------------
> 
> 9    1333K  102M IN_DNS     all  --  *      *       0.0.0.0/0
>   0.0.0.0/0            match-set DNS_PORT dst
> 

nftables has its own concept of sets:
https://wiki.nftables.org/wiki-nftables/index.php/Sets

I don't know of a way to use ipset with nftables. I think you would have 
to use iptables in parallel, taking care with ordering nftables & 
iptables hooks so that your combined ruleset does what you intend. 
Trickier than I'd like to setup & maintain...

I was interested to learn of this use of ipset... I'd glossed over the 
bitmap:port section of the ipset man page:
http://ipset.netfilter.org/ipset.man.html#lbAV

Now I'm wondering whether ipset bitmap:port match (using iptables) 
requires additional precaution of first matching only (udp, tcp) 
protocols, as is the case with nftables raw match? Or does this ipset 
match do this check implicitly?

Cheers,
Frank
