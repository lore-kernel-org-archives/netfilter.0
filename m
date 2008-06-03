From: Mark Perry <rita.co.ltd@googlemail.com>
Subject: Re: load balance [OT?]
Date: Tue, 03 Jun 2008 12:56:39 +0700
Message-ID: <4844DD17.1000501@googlemail.com>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:organization:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=1FvrJLA05MW5fQLgLV6xrYNlUdoZt5+Yi/MzU40BBsI=;
        b=wM9QKxFV/BNG9er9UJBGX+wIL8h1gy5O+atBAqeMbtejFM/iCwSKIoyl2ZqkiC54vWSLOldIH4v0aWu+yzf6p7hYWhOyxaJ8oghd1ZzUsMChXSJjx0tJAGfbL96Yrcr0rK7cfmvoUogE7gV5XD01tYBjecWU3/6pcMzCXFbjMRk=
In-Reply-To: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Martin wrote:
> Hello netfilter list!
> 
> #ISP 1
> ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP table 1
> ip route add default via $ISP1_GW dev $ISP1_IF
> 
> #ISP 2 
> ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP table 2
> ip route add default via $ISP2_GW dev $ISP2_IF
> 
> #Rules for ISPs
> ip rule add $ISP1_IP table 1
> ip rule add $ISP2_IP table 2
> 
> #Internal LAN and cross reference to the other ISP
> ip route add $LAN_NET dev $LAN_IF table 1
> ip route add $ISP2_NET dev $ISP2_IF table 1
> 
> ip route add $LAN_NET dev $LAN_IF table 2
> ip route add $ISP1_NET dev $ISP1_IF table 2
> 
> #Add isp net in main
> ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP
> ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP
> 
> #This should do the trick of balancing
> 
> ip route add default scope global equalize nexthop via $ISP1_GW dev
> ISP1_IF weight 1 nexthop via $ISP2_GW dev $ISP2_IF weight 2
> 
> 
> What actually happens is that traffic is going out only by the first GW
> declared in the first nexthop, and it doesn't care weight nor balance.
> The only chance of making it to go throw the second GW declared is
> shutting down or collapse that interface, so then it goes for the second
> one.
> 
You have requested different weights:

ip route add default scope global equalize nexthop via $ISP1_GW dev
ISP1_IF weight 1 nexthop via $ISP2_GW dev $ISP2_IF weight 2

If you want each to be equal then at least give them equal weights.


-- 
Mark Perry
