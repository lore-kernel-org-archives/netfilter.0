From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_queue exiting on big tcp sessions
Date: Wed, 03 Nov 2010 19:35:00 +0100
Message-ID: <4CD1AB54.5080603@netfilter.org>
References: <AANLkTimmr4MVCOwgxea9KoGB1BjomBchJ7oAgpnt2WyZ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimmr4MVCOwgxea9KoGB1BjomBchJ7oAgpnt2WyZ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rajkumar S <rajkumars@gmail.com>
Cc: netfilter@vger.kernel.org

On 02/11/10 16:46, Rajkumar S wrote:
> Hi all,
> 
> I am using latest git checkout of libnetfilter_queue and libnfnetlink
> on debian etch with kernel 2.6.26-2-686. The iptables rules used while
> testing are:
> 
> -A INPUT -s 192.168.3.22/32 -m state --state NEW,ESTABLISHED -j
> NFQUEUE --queue-num 0
> -A OUTPUT -d 192.168.3.22/32 -m state --state NEW,ESTABLISHED -j
> NFQUEUE --queue-num 0
> 
> I am using utils/nfqnl_test.c as my test program and using wget to get
> a file from 192.168.3.22 for testing. The program runs okay when
> getting smaller files but if number of packets go above say 200
> nfqnl_test exits with following message:
> 
> hw_protocol=0x0800 hook=1 id=389 hw_src_addr=00:14:2a:c9:e1:5d indev=2
> payload_len=1500
> entering callback
> hw_protocol=0x0800 hook=1 id=390 hw_src_addr=00:14:2a:c9:e1:5d indev=2
> payload_len=1500
> entering callback
> closing library handle
> 
> The number of packets to trigger this condition varies from say 200 to
> about 1000 and changes with each run.
> 
> dmesg does not show any error, the last lines of dmesg are:
> [76465.470246] ip_tables: (C) 2000-2006 Netfilter Core Team
> [92735.818567] Netfilter messages via NETLINK v0.30.
> [92793.863824] nf_conntrack version 0.5.0 (6144 buckets, 24576 max)
> 
> Before testing with compiled git version I was trying with ubuntu
> (lucid) and nfqueue-bindings for python and got the same error.
> 
> I am not sure what goes wrong here, I can help with any debug steps to
> find out the exact error if required. Any help to locate and fix this
> issue is much appreciated.

Please, see:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commitdiff;h=37791b0eb98c00098a6410f6dedfdce92fc88f3e;hp=c4692e02d4fc804f7aa31f407d7d2f31861753bc
