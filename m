From: Andrew Beverley <andy@andybev.com>
Subject: Re: Help on outgoing packet (without NAT)
Date: Wed, 21 Sep 2011 22:47:25 +0100
Message-ID: <1316641645.9850.225.camel@andybev-desktop>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800>
	 <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr>
	 <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800>
	 <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
	 <5b10ceef17baa191e62d2d9357257887@decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1316641646;
	bh=+HH6w7VvsYaqHp8CefhXngUKQT7ObHWqSMj82gZyqMI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=rrOOO6jfadDatv15uC2TtwcHlNPuP/3m3BYxgCjcSod4TxFfQJ2uibUpxCwPyawhe
	 e7iQ8TImMJC0JwaVvDLlfAgB7HdzgDA923g1et0SD6tZT3l328ls+ATZE7p2WiJsKZ
	 ckxFo8P1ZEnpMkyClTv5b445lB5dzHzQIa1MX3X4=
In-Reply-To: <5b10ceef17baa191e62d2d9357257887@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

On Wed, 2011-09-21 at 22:23 +0100, Jorge Bastos wrote:
> Howdy,
> 
> I'd like some help on how can I redirect the outgoing packets without 
> using NAT.
> 
> I have a machine, that when requests to IP 5.5.5.5 and port 80 are 
> made, the request be redirected to 192.168.1.221:80
> I'm trying this but no luck, maybe I'm close to it:
> 
> iptables -I FORWARD -d 5.5.5.5 -p tcp --dport 80 --to 192.168.1.221:80
> 
> What can I missing or what do I need to add?

Assuming that you are referring to packets generated on the local
machine (which is what is implied), then you need to use OUTPUT instead
of FORWARD.

FORWARD is only for packets that arrive from another machine. OUTPUT is
for locally generated packets.

Andy


