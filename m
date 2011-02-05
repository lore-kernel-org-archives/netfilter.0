From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 12:29:07 +0000
Message-ID: <1296908947.1695.10.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus>
	 <1296827153.3644.7.camel@debian-laptop.OptimumWireless>
	 <1296838192.3644.20.camel@debian-laptop.OptimumWireless>
	 <1296849455.3644.25.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296908948; bh=7piP5ES79BZowYpcLj0VjCbs5cKIPWNkfJwRQ
	zBw9pA=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=CdOK6BtK
	SQCBKyeoPic1IcRaYtcJKkERayFz/VtEXQ8q00FYfRehu0Zbqx0uMNCwCeuiU15Ob3e
	7872mbdqkDcmXiJdDobr9Z93nohpY6A6EXwmZ/fXXguyCZ4+anTxWyg1awXjgjZFvfE
	/gLveOgooVFJI8NYQvcHDXngbEMwo=
In-Reply-To: <1296849455.3644.25.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Fri, 2011-02-04 at 15:57 -0400, Optimum Wireless Services wrote:
> Hi, is me once again.
> 
> I tried this for a test box and the download speed worked correctly:
> 
> $tc qdisc del dev eth0 root
> $tc class del dev eth0
> 
> $tc qdisc add dev eth0 root handle 1: htb r2q 1
> 
> $tc class add dev eth0 parent 1:0  classid 1:1 htb rate 3000kbit ceil
> 3000kbit
> 
> $tc class add dev eth0 parent 1:1 classid 1:100 htb rate 256kbit ceil
> 256kbit prio 3
> 
> $tc filter add dev eth0 parent 1: protocol ip u32 match ip dst
> 172.16.254.1/32 classid 1:100
> 
> $tc qdisc add dev eth0 parent 1:100 handle 100: sfq perturb 2
> 
> 
> So, are these ruleset more convenient than the one I currently have?
> 

They are more efficient, yes, and in some ways more convenient, but you
lose some of the flexibility you had with marking packets.

Horses for courses really.

Andy


