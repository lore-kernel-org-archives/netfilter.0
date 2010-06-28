From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables & VLAN redirect
Date: Mon, 28 Jun 2010 15:45:13 -0500
Message-ID: <4C2909D9.8010506@riverviewtech.net>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>	<4C262DA2.1040103@riverviewtech.net>	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>	<4C2805A3.4070801@riverviewtech.net> <AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/28/10 12:33, Anatoly Muliarski wrote:
> Unfortunately, I have a set of tasks to cope with.

Not a problem.

> 1. UDP broadcast relaying for specific ports from specific VLANs - on 
> second thought I've decided to use udp-broadcast-relay as it's the 
> simplest way.

Ok...  Remember that the simplest way may not always be the best way.

> 2. Multicast feeding and IGMP exchange snooping - I tried to avoid 
> using igmpproxy but probably I should use it.

> 3. Mirroring specific sessions to VLAN 9 - and I can postpone this 
> task for the future.

Please clarify what you are meaning by "mirroring specific sessions".

> For mirroring purpose I have to alter destination MAC and I can do 
> that in POSTROUTING chain.

It sounds like you are NATing at the data layer.

> Other tasks use broadcast/multicast destination addresses so I do not 
> need to alter them.

Ok.

> Bridging is a good idea, but its current implementation lacks some 
> features important to me - as impossibility to limit traffic 
> directions between bridge devices and the fact that a network device 
> can belong to one bridge only.

Please clarify "impossibility to limit traffic direction between bridge 
devices".

It is trivial to allow bridging one way while blocking it the other way.

I.e. set an EBTables policy to DROP and only allow bridging the 
direction you want.

VID:100 --> VID:9
VID:101 --> VID:9
VID:102 --> VID:9
...
VID:199 --> VID:9

Bridging does not have to be by-directional.  You can easily make 
EBTables not bridge the traffic.

> In two words :). All user VLANs(eth1.100-eth1.200) have IP belonging 
> to one subnet( but sometimes to other ) and they can communicate each 
> other by using proxy-arp trick under control of the router. And now I 
> need to extend capabilities of this communication as I stated above. 
> Owing to talking with you and thinking on the problems I understand 
> my tasks clearer.

It may be my mis-understanding, but I'm still not seeing why you can't 
do this in EBTables using bridging.

If you bridge all your VLANs together and configure EBTables to filter 
the traffic, I don't see what the problem will be.

All your layer 3 traffic will behave as if it is on one large network, 
passing through the bridge with out the need for modification.  Granted, 
you can modify the traffic if you /want/ to, but I don't see the /need/ 
for it.  At least based on my (mis)understanding.

> Grant, thank you for your support.

You are welcome.

Let me ask you this:

Do you want your different user VLANs to be able to communicate with 
each other?  (Inter user VLAN communications)

How would this scenario work for you:

  - Bridge all the user VLANs and the VLAN 9 together.
  - Configure the bridge to drop the frames by default.
  - Configure the bridge to selectively bridge the frames that you want to.
  - Optionally alter the bridged frames if you want to.

I think I did something similar to what you are wanting to do a number 
of years ago.  I bridged about 40 different VLANs (sharing one IP 
subnet) together and configured them so that they could not talk with 
each other (preventing the spread of virus / worms) but so that they 
could talk to the router that was on a different VLAN that was part of 
the bridge.  In the process I had to modify the MAC address of traffic 
b/c the switch that was being used had a flaw where it could not see the 
same MAC address on more than one VLAN.  This has been in place and 
working just fine for a number of years.  Originally it started out on a 
P-II 233 MHz system with 128 MB of memory and it was able to do it with 
out any problems.  The only reason we replaced the box was because it 
was physically old and we did not want the hardware to dye on us.  I 
ended up copying the EBTables scripts from the old system to the new 
system and made very minor modifications to get everything to work 
(essentially as it was) with out any problems.



Grant. . . .
