From: Simon <tanstaafl@libertytrek.org>
Subject: Re: What are these and how can I not log them?
Date: Mon, 07 Jul 2008 18:57:54 -0400
Message-ID: <48729F72.5060502@libertytrek.org>
References: <48729139.8040505@libertytrek.org> <48729582.909@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48729582.909@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Grant,

Thanks for the response...

>> Jul  7 17:52:46 myhost IPTABLES-IN Default Drop: IN=eth0 OUT= 
>> MAC=ff:ff:ff:ff:ff:ff:00:08:9b:ac:c3:41:08:00 SRC=192.168.1.75 
>> DST=192.168.1.255 LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP 
>> SPT=137 DPT=137 LEN=58

> These are NetBIOS Name Service packets.  These packets are from Windows 
> computers (or any computer using Windows networking) looking for other 
> computers on the network.

Ok, makes sense, at least for the computers inside my network - but when 
the flood happens, it is from a non-local IP address, although I can't 
swear that the source/dest ports are the same... I'll have to watch for 
the next one and grab a snippet...

> With out knowing what you have in your firewall I can not even begin to 
> tell you how to not get them in your logs.  It looks like (based on the 
> "IPTABLES-IN Default Drop") that this is a catch all rule that drops any 
> thing that has not explicitly been previously allowed.

Yeah, I had someone help me set this up years ago, and I told him I 
wanted it buttoned up as tight as possible. He even added rules to block 
most OUT bound traffic as well, which I have since learned is probably 
not a great idea...

Any chance you or someone could help me in re-evaluating my current ruleset?

To dump the current rules to a file I'd just do:

iptables-save > myrules

Then just copy/paste the contents here for evaluation (if thats ok)?

Thanks again for your time...
