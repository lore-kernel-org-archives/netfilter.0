From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Port forwarding doesn't work.
Date: 12 Oct 2003 20:44:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066005882.1151.23.camel@valhalla>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
	 <1065994862.3562.10.camel@Marvin>
	 <200310121604.06545.Herman@AerospaceSoftware.com>
	 <200310121700.13102.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121700.13102.Herman@AerospaceSoftware.com>
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
To: Herman@AerospaceSoftware.com
Cc: netfilter@lists.netfilter.org

On Sun, 2003-10-12 at 19:00, Herman wrote:
>
> Here is my problem:
> I need to forward a port from outside the firewall, to everybody on the 
> inside. 

If it was UDP traffic, you might be able to get away with forwarding to
your internal broadcast address. Since its TCP however, that's not RFC
and I doubt anyone will respond unless they have a broken stack.

> All examples I have seen forwards to a specific IP on the inside, 
> which doesn't go well with DHCP. 

Maybe you can do something with DDNS or specify a MAC-->IP mapping for
the host(s) that needs need this service.

>  The man page says that specifying a range 
> of IPs will trigger a round robin effect, which I don't think I want to 
> happen. So, how now brown cow?

Agreed. That will balance to a number of different IPs, not what you are
looking for. Then again your using TCP so you can't do multiple nodes at
the same time anyway.

> If I display the rules, I can't see any forwarding rules in the list, which 
> tells me that the forwarding rules that I try to implement are simply ignored 
> by iptables:

Try it on the command line and see what errors come back.

> iptables -v -L
> Chain INPUT (policy ACCEPT 55251 packets, 13M bytes)

<snip>

> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)

Hummm. You do realize you are letting through *everything* you are not
specifically dropping? Looks like you've had quite a bit of traffic
sneak by. :(

> How can the FORWARD chain be empty, since MASQUERADE is working and my laptop 
> can surf the web?

Because you are letting everything not specifically denied blow through.

> Why are my new forwarding rules ignored?

Again, try stuff like this from the command line. If iptables is not
happy, it will let you know about it.

> How can I debug this stuff and see where the packets are going/not going?
> Can anybody shed light on this?

The counters are a good indication of what is going on. You can also run
tcpdump to troubleshoot what goes by.

HTH,
C



