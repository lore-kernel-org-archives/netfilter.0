From: Thomas Jacob <jacob@internet24.de>
Subject: Re: OpenVPN throttling problem
Date: Tue, 07 Sep 2010 13:09:36 +0200
Message-ID: <1283857776.32608.39.camel@enterprise.ims-firmen.de>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 2010-09-06 at 21:23 -0400, J Webster wrote:

> So, for example the client accesses the proxy server and types in
> www.googlevideos.com and plays the video with the proxy as an in between
> server.
> For the VPN, the client accesses the VPN server and types in
> www.googlevideos.com and plays the video with the VPN as an in between
> relay - it's not VPN in the strict sense of just gaining access to a private
> network, it's more of a public server with security access restrictions for
> geo IP location.
> 
> On going to speedtest.net I get this when connected to the VPN:
> ping 289ms
> Down 0.58Mbps
> Up: 0.84 Mbps
> 
> On connecting directly to the proxy server on the same server box I get:
> ping 414ms
> Down 2.54Mbps
> Up: 0.22 Mbps

Judging from the latter speed result you are probably connecting
through some sort of consumer connection, where there is a
pretty high likelihood that your path MTU will not be 1500, so
I'd say the OpenVPN guys are probably right when they think
it's an MTU problem. Your iptables rules certainly don't
look if they could be causing the throttling.

Your best option would probably be to fiddle around with
the MTU related settings of OpenVPN. Try searching
the OpenVPN-users mailing list, having MTU related problems
is apparently quite common, that's why there are
so many different options for that area. 
Also maybe look into the  --clamp-mss-to-pmtu thing.

