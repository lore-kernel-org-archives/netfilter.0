From: Carsten Maass <cm@blinkenlichten.de>
Subject: Re: Redirect DHCP requests to DMZ?
Date: Wed, 23 Apr 2003 18:58:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA6C622.3020103@blinkenlichten.de>
References: <3EA66634.2020508@blinkenlichten.de> <1051100353.12295.96.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051100353.12295.96.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Salut Cedric!

Cedric Blancher wrote:
>>redirect DHCP request from the clients on the local LAN to the DHCP
>>server inside the DMZ.
> 
> You'll achieve this setting a DHCP Relay up. Due to what they are, DHCP
> packets cannot be routed through different IP networks (mainly because
> of destination addresses that are used).

This is exactly what I dont understand: What are they? After all they 
are just IP packets. And if I am able to apply to them a rule like

$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d 255.255.255.255 
--destination-port 67:68 -j DROP

which discards them, why am I unable to apply a rule which redirects 
them to another subnets interface? Shouldn't the DNAT thingy take care 
of the new destination address?

Yes, a DHCP relay would be a solution, but I opted against it. I am 
trying to keep the router/firewall as (c)lean as possible: just routing, 
firewall and ssh stuff.

> But this kind of setup is no secure. If someones breaks into your DMZ,
> he will be able to have your LAN's configuration, and even tamper it,
> acting on DHCP stuff. That's _very bad_. DMZ compromission must not
> endanger rest of network security.

Right you are. But our setup was a compromise between money and 
security: Another server is just not affordable at the moment.

But you make me considering if it wouldn't be better to convince our 
Windows admin to let go his DHCP idea. The administrative overhead of a 
static client setup might be a better price to pay, pondering the 
security impact of the current setup. On the other hand I am also eager 
to find out, why this doesn't work out as expected.


Thank you for your answer,
Carsten.


