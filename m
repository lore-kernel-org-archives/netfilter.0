From: Del Winiecki <delw@wildapache.net>
Subject: Re: Purpose of self-referential rule
Date: 26 Feb 2003 10:52:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046281981.1698.29.camel@thizzy>
References: <20030224160628.GH4316@placemark.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030224160628.GH4316@placemark.com>
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

Kelly, typically you have a default route set on each machine on your
LAN, and that gateway address would be your linux router.
Yes, packets COULD be sent directly, but you'd have to reset the route
in your machine each time you wanted to point to a different machine.
So, the router IS routing all your traffic on the LAN in a normal setup.
So the line in iptables is useful. I use this kind of statement here
where I have 3 different companies sharing a fiber-optic line back to my
ISP. In your example, since its an INPUT statement, limits access to
machines on the 192.168.6.0/24 network assuming you have a DROP policy
for INPUT.

-Del

On Mon, 2003-02-24 at 09:06, Kelly Setzer wrote:
> I've been experimenting with gShield trying to learn the ins and outs
> of iptables.  One of the rules is generates is:
> 
> iptables -A INPUT -s 192.168.6.0/24 -d 192.168.6.0/24 -i eth1 -j ACCEPT
> 
> The source and dest are correct for my internal network, and eth1 is
> the internal net.  My question is, when would the firewall ever see a
> packet that could possible match this?  Any packet with a source and
> destination on the same network would send the packet directly (no
> routing, thus no firewall).
> 
> What am I missing?
> 
> thanks,
> Kelly
> --
> Kelly Setzer, System Administrator/Architect - Placemark Investments
> 14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
> kelly.setzer@placemark.com  http://www.placemark.com
> (972)404-8100x41 (work)       (214) 287-3464 (cell)



