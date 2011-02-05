From: Andrew Beverley <andy@andybev.com>
Subject: Re: good tutorial
Date: Sat, 05 Feb 2011 19:22:04 +0000
Message-ID: <1296933724.1617.10.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>
	 <20110205155829.3a5ebc7b@catus> <1296923860.1695.20.camel@andybev>
	 <BLU0-SMTP7495DFC8C5F2213D76D1D2F3E90@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296933726; bh=YGbp/kULBLWyOIdqK3E9O3gFIQln3KlT9I9fp
	zXOg8E=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=SQA1iaas
	szBlpU3WAXl1sBy8BLnuYmHRnT+63EhkcBs0S9CqAYW3t/VJELVA64mu2xNTnGDBnuJ
	8sQX8VA3xBXr5dk6HR+jFGM9O0F2m/5FsQJzyni1H8GvevmWfs0x5mjNyjn0lHQy0qj
	mAwNlTTCgAkJqLQwnCBHnaAWgGaGk=
In-Reply-To: <BLU0-SMTP7495DFC8C5F2213D76D1D2F3E90@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-02-05 at 17:48 +0100, J Webster wrote:
> Does anyone have a tutorial recommendation for tc?
> I tried the existing tutorials on LARTC and they were all lacking 
> examples - also the pages look like they were written 10 years ago.
> I want to limit bandwidth per ip address on my server.

If you check the archives there's a discussion going on right now about
this...

You can use a classful qdisc such as HTB, create a leaf for each IP
address, then filter into that leaf using the U32 filters.

Something like this (untested - I've only copied from the list
archives):


tc qdisc add dev eth0 root handle 1: htb r2q 1
tc class add dev eth0 parent 1:0  classid 1:1 htb \
	rate 3000kbit ceil 3000kbit

tc class add dev eth0 parent 1:1 classid 1:100 htb \
	rate 1500kbit ceil 1500kbit prio 3
tc filter add dev eth0 parent 1: protocol ip u32 \
	match ip dst 172.16.254.1/32 classid 1:100
tc qdisc add dev eth0 parent 1:100 handle 100: sfq perturb 2

tc class add dev eth0 parent 1:1 classid 1:101 htb \
	rate 1500kbit ceil 1500kbit prio 3
tc filter add dev eth0 parent 1: protocol ip u32 \
	match ip dst 172.16.254.2/32 classid 1:101
tc qdisc add dev eth0 parent 1:101 handle 101: sfq perturb 2

...


You'll need a leaf class for each IP address, and all the leaf classes
should add up to the parent.

By the way - please start a new email when starting a new thread. If you
reply to a previous email and change the subject then your email will
still appear in the original thread in the message archives.

Andy


