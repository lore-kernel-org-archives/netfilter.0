From: "Rafael David Tinoco" <rafaeldtinoco@ubuntu.com>
Subject: Re: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Tue, 12 Jan 2021 15:54:42 -0300
Message-ID: <836936e3-b1ba-4605-a405-89152edfd7e2@www.fastmail.com>
References: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
 <20210112165713.GE19605@breakpoint.cc>
 <f91bd38d-efc6-450b-9cbc-7968a731158f@www.fastmail.com>
 <20210112174158.GF19605@breakpoint.cc>
 <329975d1-91a4-4db9-aa6b-ff1244b08e26@www.fastmail.com>
 <20210112183603.GG19605@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210112183603.GG19605@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, Ken-ichirou MATSUZAWA <chamaken@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>

> Right, but that works for me as well:
> 
> log received (prefix="TRACE: filter:INPUT:policy:1 " hw=0x86dd hook=1 
> mark=0)
> <log><when><hour>19</hour><min>33</min><sec>27</sec><wday>3</wday><day>12</day><month>1</month><year>2021</year></when><prefix>TRACE:
> filter:INPUT:policy:1
> </prefix><hook>1</hook><hw><proto>86dd</proto><src>000000000000</src></hw><indev>1</indev><payload>6003d6ac00403a4000000000000000000000000000000001000000000000000000000000000000018100bf186808000377ebfd5f0000000014410f0000000000101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f3031323334353637</payload></log>
> (ret=479)
>   ip_conntrack_info: REPLY / ESTABLISHED
>   icmpv6   58 30 src=::1 dst=::1 type=128 code=0 id=26632 src=::1 
> dst=::1 type=129 code=0 id=26632

which kernel are you running Florian ? Is it vanilla from any distro (which I could check config options from ?). If not a missing config option (could not find anything related) then it might be a regression or something like it (which I could try to bisect).

thanks!
