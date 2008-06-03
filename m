From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?]
Date: Tue, 03 Jun 2008 13:35:20 -0300
Message-ID: <1212510920.2539.16738.camel@kr0sty.1.com.ar>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


On Mon, 2008-06-02 at 16:26 -0300, Martin wrote:
[...]
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
[...]


Well, here is some update.


I made some kind of load balance, but not as expected.

Doing some tests just to try to find out where con be the problem, I
found this:

ip route add default equalize nexthop dev $ISP_IF1 weight 1 nexthop dev
$ISP2_IF weight 1


It does load balance, sending some packets to one interface or another,
but using $ISP1_IP. That makes no sense, it's using second nexthop, but
using first nexthop's ip.

Anyway, if I add the complete sentence with corresponding IP and dev, it
keeps using only the first nexthop until it goes down.

Can't figure out why it only uses first IP at the "nexthop" rule....


Should I call Molder and Scully? :S


Thanks list for your support


Cheers


Martin

