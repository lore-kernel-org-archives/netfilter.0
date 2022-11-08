From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Tue, 8 Nov 2022 08:12:31 -0600
Message-ID: <tkdo4g$31n$1@ciao.gmane.io>
References: <tk16fd$hd2$1@ciao.gmane.io>
 <20221103231245.GD29268@breakpoint.cc> <tkbuqu$1187$1@ciao.gmane.io>
 <Y2odvQkzNbBz6lAu@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <Y2odvQkzNbBz6lAu@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 11/8/22 03:13, Pablo Neira Ayuso wrote:
> On Mon, Nov 07, 2022 at 03:54:37PM -0600, Ian Pilcher wrote:
>> I missed it, because ip6tables-translate-restore suggests:
>>
>>   nft add rule ip6 filter INPUT ip6 saddr
>> ::c8:0:0:0:1/::ff:ffff:ffff:ffff:ffff counter accept
>>
>> Which gives a syntax error.
> 
> iptables version? 1.8.8 here provides a correct translation.
> 

1.8.7 (on Fedora 36).

I see that the 1.8.8 changelog contains:
    Phil Sutter (134):
        ...
        xtables-translate: Fix translation of odd netmasks

And it looks like Fedora 37 will ship with 1.8.8, so it appears that my
timing was particularly unfortunate.

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================


