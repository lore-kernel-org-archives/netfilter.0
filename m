From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: Re: Regarding iptable rules for SNAT
Date: Wed, 19 Oct 2011 08:46:50 +0530
Message-ID: <CADAe=+JiocUgHRe149Eu4x-i_qnyRGSs7bonnC7AKuuKngk+7Q@mail.gmail.com>
References: <CADAe=+Lo46K956EAdtBchVUPkLs-aLoDk7p8HGC5-Bd4PGKy3Q@mail.gmail.com>
 <4E9DC674.3050607@arpa.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=37u5O+G+dzCewdBlKVOjyqUb7fRc55y8r3JoYkJOumU=;
        b=fDvoYOQp+5ViT1lxg7B9nph7VWR5ScXYR2Kr3Oc6/U0KmDCD/zBdgDLLrA8PvT4KOC
         VZBakeK+niyu/3oyUX1ylGU+Uxjfyc2e9bF3VVGdhtkVdhRE0piakB1X7jA6wD2xxJOl
         qHh0rome45q9H/FqSMB7KmBtIfqhgEGav63CE=
In-Reply-To: <4E9DC674.3050607@arpa.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Schorr <erik-lists@arpa.org>
Cc: netfilter@vger.kernel.org

I am sorry I am not able to get you ..

Since we are using the MASQUERADE rule in POSTROUTING .. all the
traffic from 192.168.*.* subnet will be Source natted to 10.12.*.*
subnet right ? Why we have to again add rule in POSTROUTING chain to
just say accept .. ?

Regards,
Ajith




On Wed, Oct 19, 2011 at 12:03 AM, Erik Schorr <erik-lists@arpa.org> wrote:
> On 10/17/2011 8:42 PM, Ajith Adapa wrote:
>>
>> I have a following setup. GW eth1 (private ip) is connected to the ISP
>> router. For host H1 I have set the DNS server as 10.12.3.10.
>>
>> H1 (eth0) --- (eth0) GW (eth1) ---
>> H1 eth0 = 192.168.1.2
>> GW eth0 = 192.168.1.1
>> GW eth1 = 10.12.3.12
>> DNS = 10.12.3.10
>>
>> I have added a rule in GW saying iptables -A POSTROUTING -t nat -o
>> eth1 -j MASQUERADE
>>
>> Now when I am trying to access internet from host H1, DNS queries are
>> being sent to 10.12.3.10 which are masqueraded in GW. Once replies
>> come back from DNS server then GW is replying back to DNS server with
>> icmp destination unreachable.
>
> If there's no reason to SNAT/masquerade traffic from eth0 to a host on eth1
> (10.12.3.*), you can try inserting an ACCEPT rule in the POSTROUTING table
> just before the MASQUERADE rule, to prevent the traffic from 192.168.1.* to
> 10.12.3.* having its source address changed in flight:
>
> # iptables -A POSTROUTING -t nat -o eth1 -m comment --comment "dont masq
> stuff from private net to DMZ net" -s 192.168.1.0/24 -d 10.12.3.0/24 -j
> ACCEPT
> # iptables -A POSTROUTING -t nat -o eth1 -m comment --comment "masq
> everything else" -j MASQUERADE
>
>> Ideal cases once the reply comes back GW has to send it to the host H1
>> right ?
>>
>> Sorry if I am wrong or missed any steps down here ?
>>
>> Regards,
>> Ajith
>
