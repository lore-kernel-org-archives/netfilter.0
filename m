From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forward to DMZ addresses
Date: Thu, 18 Aug 2005 01:10:40 -0500
Message-ID: <43042660.7090405@riverviewtech.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>	<4302D0F1.8030005@riverviewtech.net>
	<19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>
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

> What would I DNAT (--to-source) to.  My understanding is to check for
> ESTABLISHED,RELATED state and forward onto either LAN/DMZ interface, but
> how do I receive where -to-source should be?

If you have a DNATing rule set up for traffic that is destined to your DMZ server coming in to your router on eth1 as such:

iptables -t nat -A PREROUTING -i ${WAN} -d ${ExternalIP} -j DNAT --to-destination ${DMZServerIP}
iptables -t filter -A FORWARD -i ${WAN} -o ${DMZ} -d ${DMZServerIP} -j ACCEPT
iptables -t filter -A FORWARD -i ${DMZ} -o ${WAN} -s ${DMZServerIP} -j ACCEPT

You will need something similar to this as well:

iptables -t nat -A PREROUTING -i ${LAN} -d ${ExternalIP} -j DNAT --to-destination ${DMZServerIP}
iptables -t filter -A FORWARD -i ${LAN} -o ${DMZ} -d ${DMZServerIP} -j ACCEPT
iptables -t filter -A FORWARD -i ${DMZ} -o ${LAN} -s ${DMZServerIP} -j ACCEPT

The idea behind this is that you are DNATing the traffic that is coming in from the world.  When you try to access your ""servers (globally routable) IP from your LAN your traffic will be coming in the interface connected to your LAN (eth0) and thus not match the first rule above.  This is why you need a similar rule to match on traffic that is coming in on your LAN interface.

Note:  I went ahead and explicitly included rules for the FORWARD chain in the filter table that may be covered under a different rule, use your discression on these.

> Ah...thanks.  Didn't think about that

No problem.  Ideas is what this list is for.

> IP Network = xx.xx.xx.182
> Router WAN interface = xx.yyy.y.241
> Router LAN interface = xx.xx.xx.183
> Firewall eth0 connected to LAN switch = 10.123.x.x
> Firewall eth1 connected to router = xx.xx.xx.184
> Firewall eth2 connected to DMZ switch = xx.xx.xx.185
> DMZ server eth0 connected to DMZ switch = xx.xx.xx.186

# Let's handle any outgoing and returning LAN traffic.
iptables -t filter -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth1 -j ACCEPT
# Presumably any traffic returning from outbound requests will be in a state of established (or related) and thus is not destined to the DMZ server.
# I think this situation will be taken care of inherently.

# Let's forward any (NEW or RELATED) traffic coming in to the WAN IP from the world over to the DMZ server.
iptables -t nat -A PREROUTING -i eth1 -d xx.yy.yy.240 -m state --state NEW,RELATED -j DNAT --to-destination xx.xx.xx.186
iptables -t filter -A FORWARD -i eth1 -o eth2 -d xx.xx.xx.186 -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth1 -s xx.xx.xx.186 -j ACCEPT

# Let's forward any traffic coming in to the WAN IP from the LAN over to the DMZ server.
iptables -t nat -A PREROUTING -i eth0 -d xx.yy.yy.240 -j DNAT --to-destination xx.xx.xx.186
iptables -t filter -A FORWARD -i eth0 -o eth2 -d xx.xx.xx.186 -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s xx.xx.xx.186 -j ACCEPT

# We need to SNAT the traffic out to the world.
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source xx.yy.yy.240


> LAN stuff works just fine...well, at least from what I can tell and it's
> the only section with local IP's.  The others are all using globally
> routable IP's from my block.
> 
> Currently, and as stated before, I can access everything from the firewall
> itself, just can't pass through.
> 
> **Once I get a basic setup going, I should be able to figure it out...
> it's just this hurdle right now

*nod*

