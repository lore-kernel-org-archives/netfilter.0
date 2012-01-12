From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dual WAN set-up
Date: Thu, 12 Jan 2012 22:28:39 +0000
Message-ID: <1326407319.2182.2.camel@andrew-desktop>
References: <201201121651.18887.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1326407322;
	bh=/wHj1yPEpgRJtPC0C8TRikHyJqlUn3q1G25A1ROD9Gc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=d7QbsZ6S3s+qldQi2Na+Vx1NGbGt3sHi26VkgjtI+KbCqeoDO+WtXui+BuQ1oh4KH
	 hKnXtX6ltN5SjOiHrVlbx8Lt3wv5OeHrFvKlNvB0Vc9WTCV+uqiQJijnLehi8Lsruw
	 lvA1i3zUeZ+i7JFaiT7jmR8bel0ZS5ATsR2BOVkE=
In-Reply-To: <201201121651.18887.dyioulos@onpointfc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dimitri Yioulos <dyioulos@onpointfc.com>
Cc: netfilter@vger.kernel.org

On Thu, 2012-01-12 at 16:51 -0500, Dimitri Yioulos wrote:
> Hi, folks.
> 
> Please bear with me.  I may have asked something similar in the 
> way-back, but am going to ask again, because I really need to get 
> this set up, have absolutely no idea how, and am pertrified at 
> the prospect:
> 
> I currently have an iptables/Netfilter firewall router configured 
> thusly:
> 
>                                WAN
>                                   |
>  (192.168.x.x) LAN --  fw -- DMZ (10.x.x.x)
> 
> OK, pretty basic.  And, it has worked well for a long time.
> 
> Now, I need to add a second WAN (provided by a second provider).  
> I need it to serve specific boxes in the DMZ, both inbound and 
> outbound.  Currently, all boxes in the DMZ are served by the 
> single WAN connection.  I'm not sure what other information I 
> need to provide you, but I'm hoping you all can help with very 
> specific instructions or a very detailed how-to

If you check the list archives there's been a few discussions on this
recently (search for load balancing).

One way of doing it is marking each connection and balancing those, as
described in this excellent web page:

http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilter-load-balancing-using-connmark

Andy


