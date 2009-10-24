From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 23:44:15 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910232336420.29761@tesla>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu> <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
 <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu> <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Eegads,

so logging the invalid packets (strangely setting 
ip_conntrack_log_invalid to 1 didn't actually produce the logs, I 
had to bypass the check for LOG_INVALID in nf_conntrack_proto_tcp.c 
and recompile...) gives:

Oct 23 23:35:00 spider nf_ct_tcp: ACK is over the upper bound (ACKed data not seen yet) IN= OUT= SRC=142.103.236.11 DST=142.103.235.177 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=10722 DF PROTO=TCP SPT=44574 DPT=22 SEQ=3218503158 ACK=2892721343 WINDOW=24840 RES=0x00 ACK URGP=0 OPT (0101050ACCFD9D1FCCFDA283)
Oct 23 23:35:00 spider nf_ct_tcp: ACK is over the upper bound (ACKed data not seen yet) IN= OUT= SRC=142.103.236.11 DST=142.103.235.177 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=10723 DF PROTO=TCP SPT=44574 DPT=22 SEQ=3218503158 ACK=2892721343 WINDOW=24840 RES=0x00 ACK URGP=0 OPT (0101050ACCFD9D1FCCFDA7E7)

but how can that be?  in the dumps posted earlier, the data had gone 
through?  Hadn't it?

Carl


