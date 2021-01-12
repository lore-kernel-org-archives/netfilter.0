From: "Rafael David Tinoco" <rafaeldtinoco@ubuntu.com>
Subject: Re: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Tue, 12 Jan 2021 15:01:09 -0300
Message-ID: <329975d1-91a4-4db9-aa6b-ff1244b08e26@www.fastmail.com>
References: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
 <20210112165713.GE19605@breakpoint.cc>
 <f91bd38d-efc6-450b-9cbc-7968a731158f@www.fastmail.com>
 <20210112174158.GF19605@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210112174158.GF19605@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, Ken-ichirou MATSUZAWA <chamaken@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>

> > Ha, that's weird. 
> > 
> > log received (prefix="TRACE: raw:OUTPUT:policy:3 " hw=0x86dd hook=3 mark=0)
> > <log><when><hour>14</hour><min>27</min><sec>16</sec><wday>3</wday><day>12</day><month>1</month><year>2021</year></when><prefix>TRACE: raw:OUTPUT:policy:3 </prefix><hook>3</hook><hw><proto>86dd</proto></hw><outdev>12</outdev><payload>600041d600200640fe8000000000000014535dfffe1aca68fe8000000000000002163efffe7faedd9b1000161118d258a85cd4bb801001fb267100000101080a011250252a763edf</payload></log> (ret=393)
> > 
> > here... kernel 5.8.0-26-generic and latest libnetfilter-log, using:
> > 
> > ip6tables-legacy -t raw -I OUTPUT 1 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
> > ip6tables-legacy -t raw -I PREROUTING 1 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
> > ip6tables-legacy -t raw -A OUTPUT -j TRACE
> > ip6tables-legacy -t raw -A PREROUTING -j TRACE
> 
> ?  You need a -j NFLOG rule.  -j TRACE might not even use netlink events
> but raw printk() when used with classic iptables (rather than
> iptables-nft, where this maps to 'meta nftrace set 1'.

-j TRACE uses netlink communication for IPv4, why would it not use for IPv6 if my nf_log:

$ sudo cat /proc/net/netfilter/nf_log 
 0 NONE (nfnetlink_log)
 1 NONE (nfnetlink_log)
 2 nfnetlink_log (nfnetlink_log)
 3 NONE (nfnetlink_log)
 4 NONE (nfnetlink_log)
 5 NONE (nfnetlink_log)
 6 NONE (nfnetlink_log)
 7 NONE (nfnetlink_log)
 8 NONE (nfnetlink_log)
 9 NONE (nfnetlink_log)
10 nfnetlink_log (nfnetlink_log)
11 NONE (nfnetlink_log)
12 NONE (nfnetlink_log)

has proto 2 and 10 to use nfnetlink_log.. and, from kernel:

static struct nf_logger nfulnl_logger __read_mostly = {
	.name	= "nfnetlink_log",
	.type	= NF_LOG_TYPE_ULOG,
	.logfn	= nfulnl_log_packet,
	.me	= THIS_MODULE,
};

nfnetlink_log shows me that the function nfulnl_log_packet() is the one that builds the netlink packet to userland. So, if it works for IPv4, why would it not work for IPv6 ? 

Note: My intent is to have a single rule that gives me one netlink msg to each of the traced events (instead of adding a bunch of NFLOG rules working each one as triggers for the events, which I also could).
