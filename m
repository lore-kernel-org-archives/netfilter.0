From: "Rafael David Tinoco" <rafaeldtinoco@ubuntu.com>
Subject: Re: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Wed, 13 Jan 2021 10:25:23 -0300
Message-ID: <9d1e1f00-9198-4632-897f-dabb22d6e4d4@www.fastmail.com>
References: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
 <20210112165713.GE19605@breakpoint.cc>
 <f91bd38d-efc6-450b-9cbc-7968a731158f@www.fastmail.com>
 <20210112174158.GF19605@breakpoint.cc>
 <329975d1-91a4-4db9-aa6b-ff1244b08e26@www.fastmail.com>
 <20210112183603.GG19605@breakpoint.cc>
 <836936e3-b1ba-4605-a405-89152edfd7e2@www.fastmail.com>
 <20210112192650.GH19605@breakpoint.cc>
 <c5e18f0f-05fd-4092-8e58-de5a190a90d5@www.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c5e18f0f-05fd-4092-8e58-de5a190a90d5@www.fastmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, Ken-ichirou MATSUZAWA <chamaken@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>

On Tue, Jan 12, 2021, at 6:33 PM, Rafael David Tinoco wrote:
> > > which kernel are you running Florian?
> > 
> > 5.10.5 stable.  I can check Fedora tomorrow, I don't have classic
> > iptables there at the moment.
> >
> 
> NM Florian,
> 
> My code was returning -1 on a callback function, disabling the polling 
> for the netlink socket file descriptor. I had it fixed:
> 
>  TCPv6 [  0] src = fe80::5054:ff:fecc:767d (port=1024) to dst = 
> fe80::5054:ff:fecc:767d (port=22) (confirmed)
>         table: raw, chain: PREROUTING, type: rule, position: 1
> 
> and it is working fine now.
> 

Too soon, *definitely* conntrack data tied to trace ulog netlink is intermittent. Trying to discover... I'll probably have to trace kernel to figure out why its not being included...

log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
<log><when><hour>2</hour><min>05</min><sec>01</sec><wday>4</wday><day>13</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev></log> (ret=229)
log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
<log><when><hour>2</hour><min>05</min><sec>01</sec><wday>4</wday><day>13</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev></log> (ret=229)
log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
<log><when><hour>2</hour><min>05</min><sec>01</sec><wday>4</wday><day>13</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev></log> (ret=229)

for apparent no reason it stops working.. trace msgs still copied to userland (META/FULL) but conntrack data not attached to the nl msgs. go figure :\
