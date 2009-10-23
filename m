From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 11:49:45 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910231136510.18617@spider.phas.ubc.ca>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Hi,

> Different MTU sizes? It does look like an MTU problem. What kind of
> Internet connection do you have? What is your network topology?
>
> Try to set MSS to 1380 with the TCPMSS target in the OUTPUT chain.
>
> Best regards,
> Jozsef
> -

so if I add:

iptables -t mangle -A OUTPUT  -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1380

it doesn't help,

now the tcpdump starts:
11:36:16.742371 IP 128.189.212.241.39178 > spider.phas.ubc.ca.ssh: S  1086962333:1086962333(0) win 5840 <mss 1380,[|tcp]>
11:36:16.742409 IP spider.phas.ubc.ca.ssh > 128.189.212.241.39178: S 995440061:995440061(0) ack 1086962334 win 5792 <mss 1380,[|tcp]>

but it still stalls the same way.

I'm connected to a gigabit switch in a university department.  I'm afraid 
I don't know more about the topology than that.

My understanding of some of this is pretty weak, but I'm surprised the 
packets coming out of spider are so big: 8208 bytes in some cases.  I seem 
to run into problems when the packets get so big.  They are still 
that big even after forcing mss to 1380.

Carl


