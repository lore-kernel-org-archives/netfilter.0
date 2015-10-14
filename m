From: Andrew <nitr0@seti.kr.ua>
Subject: Re: Kernel panic in 4.1.6 in nf_nat_redirect
Date: Wed, 14 Oct 2015 21:45:33 +0300
Message-ID: <561EA2CD.8000503@seti.kr.ua>
References: <560D9DDD.8000601@seti.kr.ua> <20151004190543.GA17688@salvia>
 <56139E45.1000605@seti.kr.ua> <5613A136.7010203@seti.kr.ua>
 <20151014175859.GA3415@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151014175859.GA3415@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I switched to SNAT to avoid crashes.

I use 3rd-party software, that creates peer-to-peer pseudointerfaces on 
DHCP packet, so on pseudointerface disappearing all packets are 
processed via master interface that has no IP address, and this cause a 
crash on test box. But similar crashes can be present in other configs 
with eth interfaces w/o IP with REDIRECT rule (for ex., PPPoE BRAS).

14.10.2015 20:58, Pablo Neira Ayuso wrote:
> On Tue, Oct 06, 2015 at 01:23:50PM +0300, Andrew wrote:
>> Maybe crash happens when packet comes to interface without assigned IP?
> Do this resolved the problem for you?
>
> Not telling here this is enough, obviously we shouldn't crash here.
>
>> 06.10.2015 13:11, Andrew wrote:
>>> Hi.
>>>
>>> I recompiled kernel with debug info enabled; here's gdb output:
>>>
>>> (gdb) list *nf_nat_redirect_ipv4+0x24
>>> 0x24 is in nf_nat_redirect_ipv4 (/var/testpoint/LEAF/source/i486-unknown-linux-uclibc/linux/linux-4.1/net/netfilter/nf_nat_redirect.c:60).
>>> 55
>>> 56            rcu_read_lock();
>>> 57            indev = __in_dev_get_rcu(skb->dev);
>>> 58            if (indev != NULL) {
>>> 59                ifa = indev->ifa_list;
>>> 60                newdst = ifa->ifa_local;
>>> 61            }
>>> 62            rcu_read_unlock();
>>> 63
>>> 64            if (!newdst)
>>>
>>>
>>> 04.10.2015 22:05, Pablo Neira Ayuso wrote:
>>>> Could you please do the following?
>>>>
>>>> $ gdb net/netfilter/nf_nat_redirect.o
>>>> $ list *nf_nat_redirect_ipv4+0x24
>>>>
>>>> And post the result, thanks.
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

