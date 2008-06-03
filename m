From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?]
Date: Tue, 03 Jun 2008 15:13:48 -0300
Message-ID: <1212516828.2539.16788.camel@kr0sty.1.com.ar>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
	 <1212510920.2539.16738.camel@kr0sty.1.com.ar>
	 <48458766.2030602@googlemail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48458766.2030602@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Perry <rita.co.ltd@googlemail.com>
Cc: netfilter@vger.kernel.org


On Wed, 2008-06-04 at 01:03 +0700, Mark Perry wrote:
> Martin wrote:
> >> #ISP 1
> >> ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP table 1
> >> ip route add default via $ISP1_GW dev $ISP1_IF
> >>
> >> #ISP 2 
> >> ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP table 2
> >> ip route add default via $ISP2_GW dev $ISP2_IF
> >>
> 
> Shouldn't the default routes here be for table 1 and table 2 respectively?
> 
> You are adding them to the default table?
> 
> I thought the idea was to have 2 new tables each with their own default 
> route?
> 
> mark
> 

Right, I figured out that after sending the first mail to the list.

By now it is:
#ISP 1
ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP table 1
ip route add default via $ISP1_GW dev $ISP1_IF table 1

#ISP 2 
ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP table 2
ip route add default via $ISP2_GW dev $ISP2_IF table 2


And then add the defualt with two nexthops at the default route.


Cheers


Martin


