From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dual WAN setup redux
Date: Thu, 02 Feb 2012 23:11:13 +0000
Message-ID: <1328224273.18690.29.camel@andrew-desktop>
References: <201202021252.07673.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201202021252.07673.dyioulos@onpointfc.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328224277;
	bh=VNa6p2RGKm+rTODNiUk6DBIJD8ZUzE2bqib2krra6ho=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=dCKrGAGOlRg/ynsZeCpOkIlU4ZNn5dcpZOwd1P6mvDpsLvD79BuywXz8Z9jSS9jWU
	 2FulInHuaXpGqfC5j0aeTqy7bIYk+wCxG6fQfRuBZW15MpWDhGx9BfQuHx9rpfTcG6
	 zo7FRaSZslTqKRbfor7zkvpFNuK1iiyzUmn600ag=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dimitri Yioulos <dyioulos@onpointfc.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "DiCecca, Caitlin" <cdicecca@onpointfc.com>

On Thu, 2012-02-02 at 12:52 -0500, Dimitri Yioulos wrote:
> I changed the ip addy of the test server to 192.168.1.11, back on the 
> DMZ subnet.  I now have partial success, as I can ping the gateway 
> (75.x.x.30).

So can I :)

>   I think I have the correct SNAT and DNAT rules to reach this 
> on port 80, but I can't reach it via 75.x.x.27, which is its external 
> address.  Nor can I ping it.

You need to add the .27 address to the interface that is connected to
the 75.144.186.30 Cisco router (eth3?).

You should then be able to ping 75.144.186.27 from the internet. Once
that is working, it should just be a matter of adding the DNAT rule for
192.168.1.11 to forward from eth3.

> I don't know if it's helpful, but I've attached what I hope is a new, better 
> network map.

That's pretty good, but missing a few helpful things such as the
interface names, which I think you had on previous diagrams.

Andy


