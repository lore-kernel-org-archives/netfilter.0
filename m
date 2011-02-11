From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: Question on raw table and match state
Date: Fri, 11 Feb 2011 10:01:41 -0800 (PST)
Message-ID: <1426981515.473.1297447301826.JavaMail.root@tahiti.vyatta.com>
References: <1233805814.468.1297447131465.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1233805814.468.1297447131465.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

----- "Pandu Poluan" <pandu@poluan.info> wrote: -----
> I am wondering if the following rule will work:
> 
> iptables -t raw -A PREROUTING -p icmp -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> 

If you look at Jan's Netfilter packet flow diagram, you'll see that the raw PREROUTING chain is traversed before the conntrack functions are called.  State can not be determined until after the packet is compared to the conntrack table. The rule you described can't work and I think the iptables binaries won't allow it to be created. 

http://jengelh.medozas.de/images/nf-packet-flow.png
