From: "Rafael David Tinoco" <rafaeldtinoco@ubuntu.com>
Subject: Re: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Tue, 12 Jan 2021 14:30:08 -0300
Message-ID: <f91bd38d-efc6-450b-9cbc-7968a731158f@www.fastmail.com>
References: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
 <20210112165713.GE19605@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210112165713.GE19605@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, Ken-ichirou MATSUZAWA <chamaken@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>

> > This can also be observed with:
> > 
> > libnetfilter-log/utils/nf-log.c code (if BUILD_NFCT)
> 
> Works for me:
> 00389d4fd5f00000000a9e2060000000000101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f3031323334353637</payload></log>
> (ret=450)
> ip_conntrack_info: REPLY / ESTABLISHED
> icmpv6   58 30 src=::1 dst=::1 type=128 code=0 id=6 src=::1 dst=::1 
> type=129 code=0 id=6
> 
> Do you have an ip6tables rule that matches on conntrack state?
> Otherwise conntrack will be disabled.
>

Ha, that's weird. 

log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
<log><when><hour>14</hour><min>27</min><sec>16</sec><wday>3</wday><day>12</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev><payload>600041d600200640fe8000000000000014535dfffe1aca68fe8000000000000002163efffe7faedd9b1000161118d258a85cd4bb801001fb267100000101080a011250252a763edf</payload></log> (ret=393)

here... kernel 5.8.0-26-generic and latest libnetfilter-log, using:

ip6tables-legacy -t raw -I OUTPUT 1 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
ip6tables-legacy -t raw -I PREROUTING 1 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
ip6tables-legacy -t raw -A OUTPUT -j TRACE
ip6tables-legacy -t raw -A PREROUTING -j TRACE

(it works with IPv4)... wonder if its a kernel config option :\.
