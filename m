From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Dynamic Natting or Mobile ip
Date: Mon, 03 Oct 2005 00:50:19 -0500
Message-ID: <4340C69B.5060202@riverviewtech.net>
References: <200509301653.j8UGrqLL006892@rti02.co-lo.riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509301653.j8UGrqLL006892@rti02.co-lo.riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> I am creating some routers/servers for a few hotels. There requirements say
> I must have a dynamic nat router. What it does is allow anyone with any
> static ip to be able to connect to the network and get internet access.

This will not be easy.  But thanks to all the various things that Linux can do you just might be able to pull it off.  Rather there are a lot of pieces of the puzzle that are already solvable with Linux.

> Router/server
> Ip:192.168.100.1/24
> Dhcp server range: 192.168.100.50-192.168.100.200
> 
> Example client
> Static ip: 10.1.2.47
> Subnet: 255.255.255.180
> Gateway: 10.1.2.1
> Dns: 1.1.1.1
> 
> What I want to do is allow the client through the network without changing
> there ip info. I have heard of something called mobile ip or dynamic
> natting. Is anyone familiar with what I am describing and/or has done it? If
> you have do you have any web pages that give information on it.

I'm not sure where you will do the various things that need to be done but these are the steps that I think would need to be taken.  Oh, yah, DO NOT EVEN TALK TO ME ABOUT IPSEC VPNS through this.

Here are some concerns of mine:
1)  I'm not sure how you will solve the ARPing problem when clients are looking for the router they are expecting to be there.
2)  How do you handle one client thinking that the IP of the router is in use by another client on the network?  (See VLANs below.)
3)  You will probably want your LAN interface to have a netmask of 0.0.0.0 so that it can communicate back with all the clients that are there no matter what subnet they are on.  However you may only want to support the 10.x.x.x, 172.16.0.0 - 172.31.255.255, and 192.168.x.x networks.  (More on this later.)


I think you could use the Layer 2 filtering / NATing functionality of EBTables to DNAT any traffic that is not destined to the router to be DNATed to the router such that your router will be able to handle it.  Once you have done this I think you may be able to SNAT the traffic out to the world like you would normally.  The real bugger of the problem is getting the traffic destined to any router IP in to your router.  In short you have to prepare for every (likly?) possiblity or you have to have a dynamic solution that will work for any thing.  (VLANs)  If you set up all your network connections to be on seperate VLANs and Layer 2 bridge them in to one bridge / bridge interface on your router you could then easily know that any traffic comming in from any given VLAN would likly be destined to the router or internet at large.  In this case you could respond to any ARPs and send back the M
 AC of the router.  Then the next problem becomes how do you handle the different subnets. 
 You could have a subnet of a.b.c.d with a netmask of 0.0.0.0 thus making that network interface local to ALL networks.  I'm not sure if Linux has an option to say "All Subnets are Local" or not.  I'm tempted to say that you would want to SNAT on the layer 2 such that the traffic would appear as if it was comming in from a known subnet and could be handled as such.  Rather than using multiple (physical) routers you could easily set up a small (UML) router to do nothing but SNAT inbound traffic that is not already on the correct subnet and then hand it back off to the real router to connect out to the internet.  I have not done any playing with the advanced IPTables hooks for EBTables to allow you to use IPTables actions on bridged packets but I think you will want to investiage such for this project.  In short you will end up with a logic flow some what like this:

Is the inbound traffic ARPing for the correct router IP?  If not correct this via EBTables.
Is the inbound traffic on the correct subnet?  If not SNAT it so that it is.
Route and SNAT the traffic as you would normally.

The unSNATing and unDNATing of the traffic should take care of its self mostly.  Hoever you will probably need to do something special with the routing tables on the system to make it such that the standard routing will not see the a.b.c.d 0.0.0.0 subnet as the destination for it's outbound traffic to the world.  You will thus probably have to have a seperate routing table and tell Linux to use the Main routing table for all traffic that is destined to the world and use the / an alternant routing table for traffic that is destined to the internal (what should I call this messed up LAN) LAN.

For the cleanist possible opperation I would make it look like all the routers that the various client computers think they are going through would be an extra hop to get on to the subnet that you are really running on the client LAN side.  This way you will not have a ping responce to 10.20.30.40 comming back from 192.168.0.254 directly.  IMHO this is bad form and should be avoided at all possible.  You will probably end up with such a scenario by having a lot of your work done at layer 2 if you do not take extra care.  Thus when someone pings 10.20.30.40 it should come back from 10.20.30.40 even if 10.20.30.40 has the same MAC as 192.168.0.254.  Then when you do a traceroute out from 10.20.30.50 to Google you would see something like <local client>, 10.20.30.40, 192.168.0.254, <your ISP gw>, <your ISPs upstream>, etc.

I will do some more chewing on this and see what I can come up with.  Can I ask for some more information though?

1)  What model of D-Link router did you see this functionality on as I'd like to investigate it.
2)  What hotel / motel is making this request?  (Name would be nice but not necessary.)
3)  Is this mandatory or a desired feature?
4)  Is this a local management's request / requirement or is it a national chain request / requirement?
5)  What equipment is being recommended to fulfill this request?
6)  How big (number of client systems) will this network be?



Grant. . . .

