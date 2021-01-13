From: "Rafael David Tinoco" <rafaeldtinoco@ubuntu.com>
Subject: Re: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Wed, 13 Jan 2021 18:07:04 -0300
Message-ID: <3729ed84-ac3f-4ef3-9320-2902cbdf1a9c@www.fastmail.com>
References: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
 <20210112165713.GE19605@breakpoint.cc>
 <f91bd38d-efc6-450b-9cbc-7968a731158f@www.fastmail.com>
 <20210112174158.GF19605@breakpoint.cc>
 <329975d1-91a4-4db9-aa6b-ff1244b08e26@www.fastmail.com>
 <20210112183603.GG19605@breakpoint.cc>
 <836936e3-b1ba-4605-a405-89152edfd7e2@www.fastmail.com>
 <20210112192650.GH19605@breakpoint.cc>
 <c5e18f0f-05fd-4092-8e58-de5a190a90d5@www.fastmail.com>
 <9d1e1f00-9198-4632-897f-dabb22d6e4d4@www.fastmail.com>
 <20210113175054.GA10377@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210113175054.GA10377@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org, Ken-ichirou MATSUZAWA <chamaken@gmail.com>


> > log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
> > <log><when><hour>2</hour><min>05</min><sec>01</sec><wday>4</wday><day>13</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev></log> (ret=229)
> > log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
> > <log><when><hour>2</hour><min>05</min><sec>01</sec><wday>4</wday><day>13</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev></log> (ret=229)
> > log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
> > <log><when><hour>2</hour><min>05</min><sec>01</sec><wday>4</wday><day>13</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev></log> (ret=229)
> 
> There is no conntrack information yet in the raw table.

Yep, that was it. I had a IPv4 nat rule that made conntrack to confuse me and appear as an intermittent trace for the raw table conntrack rule. Had nothing for ipv6 so that is why IPv6 seemed not to work at all. 

Got it:

  tcp      6 432000 ESTABLISHED src=fe80::472:eeff:fef8:dbb6 dst=fe80::5054:ff:fecc:767d sport=53866 dport=22 src=fe80::5054:ff:fecc:767d dst=fe80::472:eeff:fef8:dbb6 sport=22 dport=53866 [ASSURED]
log received (prefix="TRACE: mangle:POSTROUTING:policy:1 " hw=0x86dd hook=4 mark=0)
<log><when><hour>18</hour><min>05</min><sec>27</sec><wday>4</wday><day>13</day><month>1</month><year>2021</year></when><prefix>TRACE: mangle:POSTROUTING:policy:1 </prefix><hook>4</hook><hw><proto>86dd</proto></hw><outdev>12</outdev></log> (ret=238)

Thanks a lot Pablo!
