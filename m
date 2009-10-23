From: "Steven Kath" <steven.kath@vyatta.com>
Subject: RE: ssh connections stalling
Date: Fri, 23 Oct 2009 16:58:39 -0700 (PDT)
Message-ID: <687C3DFC948C4195AB96E750012B6F98@skathlaptop>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu> <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu> <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Carl Michal' <michal@physics.ubc.ca>
Cc: netfilter@vger.kernel.org


> > Log the INVALID packets. Also, it'd be good if you could capture them
by
> > tcpdump (please use the -Sv options at least).
> >
> 
> just discovered that if ip_conntrack_tcp_be_liberal is set to 1, my
> problem also goes away.

If you set /proc/sys/net/netfilter/nf_conntrack_log_invalid to 1 and check
dmesg after some invalid packets are dropped, you might get some more
output about how the packets are judged invalid.  

