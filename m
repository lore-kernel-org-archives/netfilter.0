From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Mon, 7 Nov 2022 15:54:37 -0600
Message-ID: <tkbuqu$1187$1@ciao.gmane.io>
References: <tk16fd$hd2$1@ciao.gmane.io>
 <20221103231245.GD29268@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <20221103231245.GD29268@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 11/3/22 18:12, Florian Westphal wrote:
> Ian Pilcher <arequipeno@gmail.com> wrote:
>> Assume that I want to match a particular host (pppp:pppp:pppp:ppc8::1)
>> in a rule.  With ip6tables, I can match this address with this
>> expression:
>>
>>    0:0:0:c8::1/::ff:ffff:ffff:ffff:ffff
> 
> ip6tables-translate suggests:
> 
> nft add rule ip6 filter INPUT 'ip6 saddr & ::ff:ffff:ffff:ffff:ffff == ::c8:0:0:0:1'
> 

Interesting.  I see that too.

I missed it, because ip6tables-translate-restore suggests:

  nft add rule ip6 filter INPUT ip6 saddr 
::c8:0:0:0:1/::ff:ffff:ffff:ffff:ffff counter accept

Which gives a syntax error.

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================


