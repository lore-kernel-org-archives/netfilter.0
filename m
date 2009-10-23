From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 23:42:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu>
 <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl Michal <michal@physics.ubc.ca>
Cc: netfilter@vger.kernel.org

On Fri, 23 Oct 2009, Carl Michal wrote:

> so if I replace firehol's rules to allow INVALID packets like this:
> 
> iptables -R in_world_ssh_s4 1 -p tcp --dport 22 -m state --state
> NEW,INVALID,ESTABLISHED -j ACCEPT
> iptables -R out_world_ssh_s4 1 -p tcp --sport 22 -m state --state
> INVALID,ESTABLISHED -j ACCEPT
> 
> Then my stalls go away.
> 
> It needs both though.  If just the input allows invalid, then the output
> packets start being dropped.
> 
> Is there some way to figure out why my packets are being marked invalid?

Log the INVALID packets. Also, it'd be good if you could capture them by 
tcpdump (please use the -Sv options at least).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
