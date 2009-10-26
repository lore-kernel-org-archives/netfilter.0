From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Sun, 25 Oct 2009 21:37:23 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910252101240.4851@tesla>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu> <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
 <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu> <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca> <alpine.LNX.2.00.0910232336420.29761@tesla> <alpine.DEB.2.00.0910241913210.10009@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910241913210.10009@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> The TCP options are:
>
> No-Operation
> No-Operation
> SACK option(10): 3439172895:3439174275(1380)
>
> So it looks like SACK issue - you can verify it by disabling SACK support
> (/proc/sys/net/ipv4/tcp_sack, preferably at both sides) and running your
> original rule sets. Does the ssh connection still hang?
>

doing a better tcpdump shows packets like this:
21:00:14.553927 IP (tos 0x0, ttl 64, id 60074, offset 0, flags [DF], proto TCP (6), length 68) warp.phas.ubc.ca.45084 > spider.phas.ubc.ca.ssh: ., cksum 0x6227 (correct), 401537117:401537117(0) ack 2834113458 win 24840 <nop,nop,sack 3 {147619638:147629298}{147615498:147618258}{147607218:147612738}>

where the SACK numbers appear (to me) to be completely bogus.

It appears that I see a hang right at the first packet using SACK.

This is a very short path, just a single hop, tracepath shows:
  1:  142.103.235.177   0.039ms pmtu 1500
  1:  142.103.236.11    1.053ms reached
  1:  142.103.236.11    0.980ms reached
      Resume: pmtu 1500 hops 1 back 255

I can't capture the other end of that connection, but connecting to
another machine (several hops farther away) where I can capture both sides 
shows that somewhere along the way, the sequence numbers and ack values 
are being translated, but the sack numbers aren't.  This sounds like what 
is discussed here:

http://lkml.indiana.edu/hypermail/linux/kernel/0707.3/2402.html

and I'm 99% sure there is a Pix firewall in the building...

Thanks for the help!

Carl

