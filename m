From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Sat, 24 Oct 2009 13:58:30 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910241354210.30681@tesla>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu> <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
 <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu> <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca> <alpine.LNX.2.00.0910232336420.29761@tesla> <alpine.DEB.2.00.0910241913210.10009@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910241913210.10009@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> So it looks like SACK issue - you can verify it by disabling SACK support
> (/proc/sys/net/ipv4/tcp_sack, preferably at both sides) and running your
> original rule sets. Does the ssh connection still hang?
>

Good call.  No hangs if SACK is disabled.

Carl

