From: "" <kfm@plushkava.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] ICMPv6 ingress dropped despite
 accept rule
Date: Mon, 3 Feb 2020 11:15:46 +0000
Message-ID: <77d49c07-70dd-7108-ea77-ee3f943ca765@plushkava.net>
References: <f8914acf-6487-c9bd-e452-d253069aebe5@gmx.net>
 <df96258c-8bcb-4db4-6910-d96ef1caf990@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:from:to:references:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=d
        02LMEabtFM0w0ZSjlpHD5/wNxwswDbK0NpTlIRNSiQ=; b=WxuY0fNtK/prVdRNc
        8nVRwz+NLQv6d7TjfyDH1lN58ebSj0yAZ8V6fq4yvg7YIB55kMQM8dc28ifl2tx7
        IQY9m1aVReK/sPNK3smQvyluI4+cyhHaRX8HTvN8iZ46j1+5YgOS0jI1NpcAWQ23
        AOtNOKZPWmpLA7sSdt0gVkEInVKQb7KUX0yqMSUONadVN1VWSvr2YJt/0JHixyON
        BQEi6Yt8SsMF3tHGjuSimxIX1+51HX+OE2EZaNgOHZI7KXnRzwssyAAL7bnkwP5p
        6qc10oiNiMtOhckSCqRLlAF4OBAwPGmDNyHbADnqgrh5nz8rDptRobSiNWvRfW07
        O47lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=d02LMEabtFM0w0ZSjlpHD5/wNxwswDbK0NpTlIRNS
        iQ=; b=kWJ1k4YmF8hqHz1/IqCjm/OtNEuUtVI6HnzxmvDYvj7YbE0XbjxERQUMn
        B+J50/LK0MpZ5iKAlG+24ADiI+/n6eNPd4YzloXkBi5Q5+KwriUzHUTyT8hQIcQY
        Em+cIdP4LehLbcxDzvh7qjuA+SHxLekw8co6mq8xTE1AiFYSOMWyCjTR3VPQnAw1
        wPHSkD2iviypprGU7srfccxdjt5gn/92+njzZPd8bTxETHhcf2yk0nfw5DXlsjyH
        mhtog80tkY0M2m4dgM6r1GFTK9PKhbcdw3XpI8pD1RekG4ziTWVy2Sb6HWreiAfR
        rtZuog8vgdjR8eRM3ydonfWeOeuwg==
In-Reply-To: <df96258c-8bcb-4db4-6910-d96ef1caf990@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 03/02/2020 11:12, Kerin Millar wrote:
> On 03/02/2020 10:56, ѽ҉ᶬḳ℠ wrote:
>> Appreciate if someone could be obliged and have a look at the below 
>> ruleset and let me know where I am going wrong since ICMPv6 is being 
>> (policy) dropped:
>>
>> DROP_WAN_IN IN=pppoe-wan OUT= MAC= 
>> SRC=fe80:0000:0000:0000:e2ac:f1ff:fe65:51ba 
>> DST=ff02:0000:0000:0000:0000:0000:0000:0001 LEN=72 TC=224 HOPLIMIT=255 
>> FLOWLBL=0 PROTO=ICMPv6 TYPE=134 CODE=0
>>
>> despite an accept statement
>>
>> --- ruleset
>>
>> table arp filter { # handle 141
>>          chain input { # handle 1
>>                  type filter hook input priority filter; policy accept;
>>                  iif "eth2" drop # handle 3
>>          }
>>
>>          chain output { # handle 2
>>                  type filter hook output priority filter; policy accept;
>>                  oif "eth2" drop # handle 4
>>          }
>> }
>> table inet filter { # handle 142
>>          chain input { # handle 1
>>                  type filter hook input priority filter; policy drop;
>>                  ct state established,related accept # handle 4
>>                  ct state invalid drop # handle 5
>>                  iif "lo" accept # handle 6
>>                  iif "br-lan" accept # handle 7
>>                  iif "lan0" accept # handle 8
>>                  iif "lan1" accept # handle 9
>>                  iif "lan2" accept # handle 10
>>                  iif "lan3" accept # handle 11
>>                  iif "lan4" accept # handle 12
>>                  log prefix "DROP_WAN_IN " # handle 13
>>          }
>> }
>> table ip6 filter { # handle 145
>>          chain input { # handle 1
> 
> This particular chain is not hooked.
> 

Re-posting the above as I accidentally replied off-list.

-- 
Kerin Millar
