From: Alexis <alexis@attla.net.ar>
Subject: Re: iptables routing help
Date: Sun, 25 Jan 2004 13:56:27 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075049787.1636.7.camel@pepelui.baicom>
References: <A9EB4907-4EF7-11D8-A7CD-000A9577164C@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A9EB4907-4EF7-11D8-A7CD-000A9577164C@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

in this case (i understand now)
Like Antony said, the better approach is to make a linux box with
netfilter as firewall and 2 nics.

One of this nics connected to the dsl modem and the other nic as the
LAN. 

So all boxes inside de lan are connected, and you must configure nat in
the linux box in order to the LAN boxes reach internet.



On Sun, 2004-01-25 at 02:31, William Knop wrote:
> Say I want to transfera file from one computer to another in my house.
> Since they are ondifferent subnets, the data is routed out my modem to
> the gateway atmy isp, and then back in my modem and to the other
> computer in myhouse. Ideally (in any reasonable setup), the data
> should not leavethe house and flood my dsl modem with local traffic.
> 
> So, I want to grab packets destined for the gateway (via
> afirewall/iptables), check if the packet is destined for one of
> thethree local subnets, and make the packet go directly to
> it'sdestination. I'm not sure if this has to do with ethernet
> frames,tcp/ip, or arp or something like that, but I've tried lots of
> thingswith minimal success.
> 
> 
>         im not shureif i can understand the schema, could be more
>         specific?
>         
>         thanks
>         
>         
>         ----- Original Message ----- 
>         From: "William Knop"<w_knop@hotmail.com>
>         To:<netfilter@lists.netfilter.org>
>         Sent: Saturday, January 24, 2004 6:25 PM
>         Subject: iptables routing help
>         
>         
>         > Hello,
>         >My dsl provider has my house on several subnets (ips obtained
>         viadhcp, 
>         >along with a netmask of 255.255.255.0), so I have had to
>         screw around 
>         >with each machine to make sure local traffic doesn't flood
>         the dsl 
>         >modem. To remedy this, I've been trying to set up a firewall
>         box to 
>         >basically reroute those three subnets as local, but I'm
>         finding itvery 
>         >difficult. It seems like every doc out there only addresses
>         nat, which 
>         >is definitely not what we want. I'd greatly appreciate some
>         help 
>         >accomplishing this.
>         > 
>         >Thanks much,
>         >William
>         > 
>         > 
>         > 
>         > 
> 
-- 
Alexis <alexis@attla.net.ar>


