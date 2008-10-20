From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: IP redirect?
Date: Mon, 20 Oct 2008 11:23:00 -0500
Message-ID: <48FCB064.1020907@riverviewtech.net>
References: <48FC5095.5040202@read.org.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FC5095.5040202@read.org.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/20/08 04:34, Morgan Read wrote:
> To redirect lan traffic addressed to the wan IP (e.g.) 123.456.789.012 
> to the lan IP address 192.168.1.123, I'm using the following:
> $ iptables -t nat -I PREROUTING 1 -d 123.456.789.012 -j DNAT 
> --to-destination 192.168.1.123
> 
> But, all internal traffic seems to get lost - 18 months ago when I last 
> did this, traffic to 123.456.789.012 seemed to hit 192.168.1.123 and 
> come back without problem.

Please search the mailing list archives for the "TCP Triangle".  The 
most recent thread was "routing all HTTP requests to my own web server". 
  Also, take a look at one of Julian's images 
"http://jengelh.hopto.org/images/dnat-mistake.png" for more information.

> I've added the following, with some interesting results:
> $ iptables -t nat -I POSTROUTING 1 -s 192.168.1.40 -j SNAT --to-source 
> 58.28.20.69

*nod*

> Now, the traffic from the specific lan IP 192.168.1.123 does seem to be 
> redirected correctly and come back to itself.  But still, all other lan 
> traffic seems to get lost.

This is as I would expect.

> Any ideas what's happening, where I'm getting lost?

You are only SNATing traffic from (-s) 192.168.1.40.  Try SNATing all 
traffic from your local LAN that is being redirected to your system.

$ iptables -t nat -I POSTROUTING 1 -s 192.168.1.0/24 -d 192.168.1.123 -j 
SNAT --to-source 58.28.20.69

Note:  I'm not sure why you are using a source of 58.28.20.69.  I would 
think that you would want to use the source of your internal interface 
in the 192.168.1.0/24 network.



Grant. . . .
