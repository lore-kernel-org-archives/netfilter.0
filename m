From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 12:57:50 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

ok,

so if I replace firehol's rules to allow INVALID packets like this:

iptables -R in_world_ssh_s4 1 -p tcp --dport 22 -m state --state NEW,INVALID,ESTABLISHED -j ACCEPT
iptables -R out_world_ssh_s4 1 -p tcp --sport 22 -m state --state INVALID,ESTABLISHED -j ACCEPT

Then my stalls go away.

It needs both though.  If just the input allows invalid, then the output 
packets start being dropped.

Is there some way to figure out why my packets are being marked invalid?

Carl

