From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: okay, I admit confusion here;
Date: Mon, 16 May 2005 16:05:32 -0500
Message-ID: <42890B1C.3010404@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<42825732.8010206@verisignlabs.com>	<428259CE.3080708@riverviewtech.net>	<42825D48.2060003@verisignlabs.com>	<20050511203452.GA13902@bender.817west.com>
	<Pine.LNX.4.60.0505131725190.2601@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505131725190.2601@darkstar.sysinfo.com>
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

> I have moved from a p-p-p dialup serivce to a rr business class service 
> <and learned to hate verizion>.  Anyways, rr brings in a router, and 
> gives me the /28 block <router takes an address>.  how do I setup  eht0 
> and eth1 to share the same block?  Is this a case for interface bridging 
> and ip2route?
> 
> router  <->   eth1 <external>   <->   eth0 <internal, connects to the home
>                                  hub/switch>
> 
> router = xxx.xxx.xxx.17
> eth1 = xxx.xxx.xxx.18
> eth0 = xxx.xxx.xxx.19
> 
> Rest of the home net gets IP's 20-30

Are you REALLY wanting the rest of the (computers in your) home to have globally routable IPs?  If you are wanting such I would REALLY suggest that you take a look at the NETMAP target where you would do mass translation of the IP addresses to private IPs or look at a lot of port forwarding.  Why did you get a /28 block of IPs?  Do you have 13 (plus the router) pieces of equipment that need to have globally routable IPs or is this just what they gave you (and are billing you for) because you have multiple computers at your house that will be using the cable modem?  I have not dealt with RR in a long time so I don't know their current politics, though from what I remember they wanted to charge per system that would be accessing the net via the CM.  If this is just simple home LAN internet access (IMHO) you should REALLY think about dropping back to one IP address from RR and do the same t
 ype of NATing that you were doing on your PPP.



Grant. . . .

