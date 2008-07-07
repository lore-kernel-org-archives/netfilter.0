From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: What are these and how can I not log them?
Date: Mon, 07 Jul 2008 17:15:30 -0500
Message-ID: <48729582.909@riverviewtech.net>
References: <48729139.8040505@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48729139.8040505@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/07/08 16:57, Simon wrote:
> I'm getting a lot of the below messages - sometimes bursts of a hundred 
> or more, but usually just one or two here and there - in my logs:
> 
> Jul  7 17:52:46 myhost IPTABLES-IN Default Drop: IN=eth0 OUT= 
> MAC=ff:ff:ff:ff:ff:ff:00:08:9b:ac:c3:41:08:00 SRC=192.168.1.75 
> DST=192.168.1.255 LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP 
> SPT=137 DPT=137 LEN=58

These are NetBIOS Name Service packets.  These packets are from Windows 
computers (or any computer using Windows networking) looking for other 
computers on the network.

> I'm guessing it is something to do with IPv6.? But all I really want to 
> know is why are they being blocked and/or how can I stop seeing these in 
> my logs?

Nope, these have nothing to do with IPv6.  The particular above packet 
came from the computer at 192.168.1.75 when it was trying to find out 
what was on the network.  It sent this packet as a broadcast to the 
network, thus requesting that all systems on the network speaking 
NetBIOS respond so that it could learn something, or argue about 
something (browse master election...).

With out knowing what you have in your firewall I can not even begin to 
tell you how to not get them in your logs.  It looks like (based on the 
"IPTABLES-IN Default Drop") that this is a catch all rule that drops any 
thing that has not explicitly been previously allowed.



Grant. . . .
