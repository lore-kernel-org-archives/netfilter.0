From: Jason Opperisano <opie@817west.com>
Subject: Re: help route private traffic to 10.x.x.x and everything else to
	the 'net
Date: Mon, 15 Nov 2004 15:49:07 -0500
Message-ID: <1100551747.3591.34.camel@hubcap.ljm.dom>
References: <1100550589.5398.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100550589.5398.26.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-11-15 at 15:29, David Williamson wrote:
> I've got a debian box with broadband access via ethernet to a wireless
> link.  The gateway to the public net is 192.168.0.1, via my box,
> 192.168.0.2.  I've got Firestarter on it, and everything works.  On
> another box, I have access to our private WAN, mostly 10.130.x.x and
> 172.21.x.x and the like via a Cisco router at 10.130.80.1.  I'd like to
> set things up so that any box on our LAN can access the private WAN, and
> if it's not on the WAN, the packets go out on the 192.168.0.1 gateway to
> the internet.  This way, stuff that's blocked on our WAN (like ftp,
> email, jabber) will still work, since they'll have another route to the
> 'net.

some ascii art might help explain your setup better.

> But every time I start trying to write the rule I get lost not long
> after "iptables -"  <g>
> 
> eth0 is the internet nic, eth1 will be the WAN nic.
> 
> iptables -t nat -A PREROUTING  -i eth1 -d 10.0.0.0/255.0.0.0 -j DNAT
> --to 10.130.80.1
> 
> Is the above anywhere even close to a way to forward packets going to
> the 10.x.x.x part of our WAN, to the 10.130.80.1 router?  

no.  you need to start out by having routing setup properly before you
start firewalling.  in your case, you need to add routes on the linux
box to the networks on the WAN via the WAN router; something along the
lines of:

  ip route add 10.130.0.0/16 via 10.130.80.1
  ip route add 172.21.0.0/16 via 10.130.80.1

etc...adjust accordingly to your exact setup--the basic form of the
command is:

  ip route add $NETWORK/$PREFIX via $GATEWAY

once the linux box knows where everything is supposed to go you can
start filtering and NAT-ing.  it appears as though you wish to NAT
traffic from your LAN destined for networks on the WAN.  if this is the
case, you would SNAT your LAN traffic behind the IP address of the linux
firewall:

  iptables -t nat -A POSTROUTING -o $WAN_IF -s $LAN_NET \
    -j SNAT --to-source $WAN_IF_IP

-j

--
"Be careful when we capture him! We cannot claim the reward unless
 we have 51% of the carcass"
	--The Simpsons


