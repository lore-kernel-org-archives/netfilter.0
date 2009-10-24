From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ssh connections stalling
Date: Sat, 24 Oct 2009 19:24:22 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0910241913210.10009@blackhole.kfki.hu>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu> <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
 <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu> <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca> <alpine.LNX.2.00.0910232336420.29761@tesla>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910232336420.29761@tesla>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl Michal <michal@physics.ubc.ca>
Cc: netfilter@vger.kernel.org

On Fri, 23 Oct 2009, Carl Michal wrote:

> so logging the invalid packets (strangely setting 
> ip_conntrack_log_invalid to 1 didn't actually produce the logs, I had to 
> bypass the check for LOG_INVALID in nf_conntrack_proto_tcp.c and 
> recompile...) gives:
> 
> Oct 23 23:35:00 spider nf_ct_tcp: ACK is over the upper bound (ACKed data not
> seen yet) IN= OUT= SRC=142.103.236.11 DST=142.103.235.177 LEN=52 TOS=0x00
> PREC=0x00 TTL=64 ID=10722 DF PROTO=TCP SPT=44574 DPT=22 SEQ=3218503158
> ACK=2892721343 WINDOW=24840 RES=0x00 ACK URGP=0 OPT (0101050ACCFD9D1FCCFDA283)

The TCP options are:

No-Operation
No-Operation
SACK option(10): 3439172895:3439174275(1380) 

So it looks like SACK issue - you can verify it by disabling SACK support 
(/proc/sys/net/ipv4/tcp_sack, preferably at both sides) and running your 
original rule sets. Does the ssh connection still hang?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
