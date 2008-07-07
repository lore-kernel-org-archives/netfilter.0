From: Simon <tanstaafl@libertytrek.org>
Subject: What are these and how can I not log them?
Date: Mon, 07 Jul 2008 17:57:13 -0400
Message-ID: <48729139.8040505@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hello,

Very new to iptables and firewall, so please be gentle... :)

I'm getting a lot of the below messages - sometimes bursts of a hundred 
or more, but usually just one or two here and there - in my logs:

Jul  7 17:52:46 myhost IPTABLES-IN Default Drop: IN=eth0 OUT= 
MAC=ff:ff:ff:ff:ff:ff:00:08:9b:ac:c3:41:08:00 SRC=192.168.1.75 
DST=192.168.1.255 LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP 
SPT=137 DPT=137 LEN=58

I'm guessing it is something to do with IPv6.? But all I really want to 
know is why are they being blocked and/or how can I stop seeing these in 
my logs?

Thanks...
