From: Andrew Beverley <andy@andybev.com>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Thu, 01 Nov 2012 22:03:02 +0000
Message-ID: <1351807382.2243.51.camel@andylaptop>
References: <5088717B.6080300@wildgooses.com>
	 <1351412418.2740.5.camel@andylaptop> <508D47E2.8020800@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <508D47E2.8020800@ngtech.co.il>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1351807389;
	bh=PNSYfo3heUf3jaD5t5MJV0whXnwowkmAfBDy5mOFx3Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=kHx00rZ1idmXaSwNthah8mnuMssAGuY3BrYGB9SfImQyjNZOdiYq+rVJWqt7WgFwW
	 F8jmtenBHoMljjd0pdVmHMp/kCCSuxp/XCG+AEq6BhbT/WJUdhrfBGOGPdOfT8jV9F
	 VmHq9KLdg7l11BKuAyABGv090xQt8kzZC2D2/eFE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: Ed W <lists@wildgooses.com>, netfilter@vger.kernel.org, ntop-dev@unipi.it, "G. Elian Gidoni" <geg@gnu.org>

On Sun, 2012-10-28 at 16:57 +0200, Eliezer Croitoru wrote:
> > I have to admit that I only had limited success with l7-filter, although
> > it no longer appears to be maintained anyway.
> >
> What would you want to achieve from a using l7 iptables?
> filtering? scheduling?

At the time I was using it to do traffic shaping, to prevent p2p
applications overloading a network with low bandwidth internet
connection. The problem was that it only needed one p2p application to
not be identified for the network to be overloaded. So in the end I took
a rather rudimentary approach and just identified any client making lots
of connections to ports above 1024:

http://www.andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux

Andy


