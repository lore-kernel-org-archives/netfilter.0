From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Network config review
Date: Fri, 30 Jul 2004 15:11:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407301511.17394.Antony@Soft-Solutions.co.uk>
References: <810BC538117E9F4E9BB152E0C100DF1F18F4B9@farmer.vikus.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F18F4B9@farmer.vikus.net>
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
To: netfilter@lists.netfilter.org

On Friday 30 July 2004 3:02 pm, Patrick Ahler wrote:

> Basically what I'm trying to do with this configuration is replace a
> current firewall. I am just having trouble getting the ISP
> gateway's(JACK's) arp requests to recognize my firewall's (BILL's) MAC
> address for all arp requests to my network.  When I switch firewalls
> (BILL'S), everything will work fine until the ISP's gateway (JACK) sends
> an arp request to my network for an ip, as the ISP's gateway requests
> ip's on my network they return unanswered. On the old firewall(Previous
> BILL) when the ISP's gateway would send an arp request for anything on
> my network my firewall machine would respond with it's MAC address.

What you've said above is not really anything to do with netfilter.

netfilter will process packets for you once they enter the firewall (either to 
terminate there or be routed on somewhere else) but you need to have the 
correct IPs set up on the interfaces in order for ARP to find the interfaces' 
MAC addresses - netfilter can't do that bit for you.

Basically you just need to ensure that all the public IP addresses that you 
want to accept packets for are attached to the external interface.

The old way of doing this is with mutliple ifconfig commands, referencing 
eth0, eth0:0, eth0:1, eth0:2 etc (the names with :s in them are called 
virtual interfaces).

The new way of doing this is with the ip command:
ip addr add a.b.c.d dev eth0
for each address a.b.c.d which you want the interface to respond as.

Regards,

Antony.

-- 
The lottery is a tax for people who can't do maths.

                                                     Please reply to the list;
                                                           please don't CC me.


