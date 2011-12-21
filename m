From: Andrew Beverley <andy@andybev.com>
Subject: Re: Details on iif in ip rule
Date: Wed, 21 Dec 2011 09:01:12 +0000
Message-ID: <1324458072.4269.37.camel@steve-pc>
References: <9E4E4FA919634D48ADBF608395D283EE0721B63257@exc-aus-0001>
	 <alpine.LNX.2.01.1112210318020.5980@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1324458074;
	bh=PxVKPpXLPAn7GKccqEx+U+srK9O4Pin21Dd3REGnbE0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=FGe4J49gW9Lc6He65WJK78FIKb33wh5feqmt+4Iv72MWQ1gzAhAExHkEjeFly7hY0
	 9x79pfaxlb8kQaGJKbM8Oz1eMB7xalDNVrspWZ26cEcpd7KR/2rM16NL17xO4FVWd1
	 xHbQPSs1n5GMgSZGvx9oOboRPkMj+sQVn1XsIQ1I=
In-Reply-To: <alpine.LNX.2.01.1112210318020.5980@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aadith Koshy <ak699f@att.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 2011-12-21 at 03:20 +0100, Jan Engelhardt wrote:
> On Wednesday 2011-12-21 01:08, Aadith Koshy wrote:
> 
> >Hi Team,
> >
> >I am having some trouble understanding 'iif' on the ip rules. Let me 
> >explain what I am trying out. I have 3 virtual interfaces on a single 
> >interface.
> 
> stop using net-tools. Use iproute2.

Aadith: Jan is right. You need to use iproute2. As a starter for 10, you
need to do something like:

ip address add 192.168.5.0/24 dev eth0

rather than whatever ifconfig rule you are using.

Andy


