From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Question on raw table and match state
Date: Sat, 12 Feb 2011 09:14:49 +0700
Message-ID: <AANLkTik2CyiQ3RQZxsxLSMmSFrzCKD+rLr7=tY4asvLG@mail.gmail.com>
References: <1233805814.468.1297447131465.JavaMail.root@tahiti.vyatta.com>
	<1426981515.473.1297447301826.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1426981515.473.1297447301826.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Kath <steven.kath@vyatta.com>, netfilter@vger.kernel.org

(sorry for top posting)

Strangely enough, the iptables binary does not complain when I tried:

iptables -t raw -A PREROUTING -p icmp -m state --state
ESTABLISHED,RELATED -j LOG --log-prefix "RP MATCH:"

or replacing LOG with ACCEPT. But checking dmesg shows that the rule
is not triggered. Just to be sure, I added the following:

iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED -j LOG
--log-prefix "FI MATCH:"

and dmesg indeed shows the rule triggering.

That said, I've now understood raw & conntrack much better, thanks.

Rgds,


On 2011-02-12, Steven Kath <steven.kath@vyatta.com> wrote:
> ----- "Pandu Poluan" <pandu@poluan.info> wrote: -----
>> I am wondering if the following rule will work:
>>
>> iptables -t raw -A PREROUTING -p icmp -m state --state
>> RELATED,ESTABLISHED -j ACCEPT
>>
>
> If you look at Jan's Netfilter packet flow diagram, you'll see that the raw
> PREROUTING chain is traversed before the conntrack functions are called.
> State can not be determined until after the packet is compared to the
> conntrack table. The rule you described can't work and I think the iptables
> binaries won't allow it to be created.
>
> http://jengelh.medozas.de/images/nf-packet-flow.png
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
