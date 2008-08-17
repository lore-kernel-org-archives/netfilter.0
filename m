From: Michael Alaimo <lists@reptiliannature.org>
Subject: Re: VPN (interface) access for and all traffic through from single
 user -- how to do it?
Date: Sun, 17 Aug 2008 00:30:06 -0400
Message-ID: <48A7A94E.8070202@reptiliannature.org>
References: <200808151255.44987.janklodvan@gmail.com> <200808152212.59882.janklodvan@gmail.com> <48A5F9E2.5080206@riverviewtech.net> <200808162347.55392.janklodvan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=reptiliannature.org;
	s=ns1; t=1218947393; bh=i3AyV6VnVSnv6eCS5SzLctGQpx9L45c2bHiDIRS0Jik
	=; h=Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=u
	pUsrcR37yBulOkMNZTq17DD8FITg5wiVzKub0MirfubkczXTWRnvxaWrO57nrbKCnvz
	KGiF/A6kpZtiWRQkbdJQxczG/g8s161Qzie70+Guy9+8ZPohJq76cHP08lpFL9B1Bn3
	uCJqlTHAJzfJN6MDswPZ6PTT6OfMCgY1Q6sQ=
In-Reply-To: <200808162347.55392.janklodvan@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Klod <janklodvan@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Jan,

I would use tcpdump and traceroute to aid in debugging.  nmap might also 
be useful.
I also forget exactly what to do here, so if someone else knows please 
help out.
If i recall correctly, there is a way you can direct traffic to your vpn 
using SNAT.
so like if iptables -t nat -A POSTROUTING -d vpn_endpoint -J SNAT 
--to-source local_vpn_endpoint

I think thats correct.  The idea here is to have only traffic to the vpn 
use the vpn, no?   Trafic would leave
your vpn endpoint, reach the other side.  The other side would reply 
back to your SNAT -to-source which
would get routed to your pc. 

I know this works with the *swan implementations, so using some sort of 
NAT may help.
I would use those tools to debug, but there are probably some others 
that would help as well.

Have you ever tried OpenVPN?  It have used it in an office situation 
before, and people appreciated it.

Please correct me if I am wrong.  Hope this helps.

Mike

Jan Klod wrote:
> Still asking questions. I tried to follow probably the most simple case 
> presented here:
> http://pptpclient.sourceforge.net/routing.phtml#all-to-tunnel
> but result is no access to internet at all. How can I debug these things and 
> find out what is going on? Now it is like in the dark...
>
> Is it considerable to be a proof, that pptp VPN tunnel is working, if I can 
> ping -i ppp0 <remote VPN address>?
>
> Looking for solutions,
> Jan
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

