From: Andrew Beverley <andy@andybev.com>
Subject: Re: QoS weirdness : HTB accuracy
Date: Thu, 10 Jun 2010 22:22:28 +0100
Message-ID: <1276204948.1403.13.camel@andybev>
References: <067c83163988908ef546d7ff7f560a17@localhost>
	 <4BF32BB0.7010700@redfish-solutions.com>
	 <e6bd0cff8dafc8b3af0760facb5fdc8c@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1276204961; bh=DkH+VABiUTYIUp1Ea2AUs4CaDg7c1V95u/KoM
	EzXT48=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=kK/Tb8iq
	bMrBp4Z5riZcLg4LrmnH+vO+ujE1/gckvvf/GNjpt+R/r+m/yezPnJLvg1tcBoZgV2X
	Kh4uZQr89IjfYdMCZZdlw4HR2C3uM6/avb6Xddkq8R2i/zA5OvmwbIQLSa75dxOYhvc
	LMD5CNVd3jApuTDekBR9qIiIaYnC8=
In-Reply-To: <e6bd0cff8dafc8b3af0760facb5fdc8c@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julien Vehent <julien@linuxwall.info>
Cc: "Philip A. Prindeville" <philipp_subx@redfish-solutions.com>, Netdev <netdev@vger.kernel.org>, netfilter <netfilter@vger.kernel.org>

> > Sorry for the late response:  could this be an "aliasing" issue caused
> > by sampling intervals (granularity)?
> > 
> 
> I was, in fact, an error in my ruleset. I had put the 'linklayer atm' at
> both the branch and leaf levels, so the overhead was computed twice,
> creating those holes in the bandwidth.

I am seeing similar behaviour with my setup. Am I making the same
mistake? A subset of my rules is as follows:


tc qdisc add dev ppp0 root handle 1: htb r2q 1

tc class add dev ppp0 parent 1: classid 1:1 htb \
    rate ${DOWNLINK}kbit ceil ${DOWNLINK}kbit \
    overhead $overhead linklayer atm                   <------- Here

tc class add dev ppp0 parent 1:1 classid 1:10 htb \
    rate 612kbit ceil 612kbit prio 0 \
    overhead $overhead linklayer atm                   <------- And here

tc qdisc add dev ppp0 parent 1:10 handle 4210: \
    sfq perturb 10 limit 50

tc filter add dev ppp0 parent 1:0 protocol ip \
    prio 10 handle 10 fw flowid 1:10



Thanks,

Andy


