From: Florian Westphal <fw@strlen.de>
Subject: Re: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Tue, 12 Jan 2021 19:36:03 +0100
Message-ID: <20210112183603.GG19605@breakpoint.cc>
References: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
 <20210112165713.GE19605@breakpoint.cc>
 <f91bd38d-efc6-450b-9cbc-7968a731158f@www.fastmail.com>
 <20210112174158.GF19605@breakpoint.cc>
 <329975d1-91a4-4db9-aa6b-ff1244b08e26@www.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <329975d1-91a4-4db9-aa6b-ff1244b08e26@www.fastmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org, Ken-ichirou MATSUZAWA <chamaken@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>

Rafael David Tinoco <rafaeldtinoco@ubuntu.com> wrote:
> > > Ha, that's weird. 
> > > 
> > > log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
> > > <log><when><hour>14</hour><min>27</min><sec>16</sec><wday>3</wday><day>12</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev><payload>600041d600200640fe8000000000000014535dfffe1aca68fe8000000000000002163efffe7faedd9b1000161118d258a85cd4bb801001fb267100000101080a011250252a763edf</payload></log> (ret=393)
> > > 
> > > here... kernel 5.8.0-26-generic and latest libnetfilter-log, using:
> > > 
> > > ip6tables-legacy -t raw -I OUTPUT 1 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
> > > ip6tables-legacy -t raw -I PREROUTING 1 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
> > > ip6tables-legacy -t raw -A OUTPUT -j TRACE
> > > ip6tables-legacy -t raw -A PREROUTING -j TRACE
> > 
> > ?  You need a -j NFLOG rule.  -j TRACE might not even use netlink events
> > but raw printk() when used with classic iptables (rather than
> > iptables-nft, where this maps to 'meta nftrace set 1'.
> 
> -j TRACE uses netlink communication for IPv4, why would it not use for IPv6 if my nf_log:
> 
> $ sudo cat /proc/net/netfilter/nf_log 
> 10 nfnetlink_log (nfnetlink_log)

Right, but that works for me as well:

log received (prefix="TRACE: filter:INPUT:policy:1 " hw=0x86dd hook=1 mark=0)
<log><when><hour>19</hour><min>33</min><sec>27</sec><wday>3</wday><day>12</day><month>1</month><year>2021</year></when><prefix>TRACE:
filter:INPUT:policy:1
</prefix><hook>1</hook><hw><proto>86dd</proto><src>000000000000</src></hw><indev>1</indev><payload>6003d6ac00403a4000000000000000000000000000000001000000000000000000000000000000018100bf186808000377ebfd5f0000000014410f0000000000101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f3031323334353637</payload></log>
(ret=479)
  ip_conntrack_info: REPLY / ESTABLISHED
  icmpv6   58 30 src=::1 dst=::1 type=128 code=0 id=26632 src=::1 dst=::1 type=129 code=0 id=26632

