From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 13:30:28 -0500
Message-ID: <465336C4.5060600@riverviewtech.net>
References: <C2787F66.1C272%robert@leblancnet.us>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C2787F66.1C272%robert@leblancnet.us>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 05/22/07 12:07, Robert LeBlanc wrote:
> Thanks, I wasn't aware of this option as I haven't done much with 
> bridging since I had lots of trouble with trying to bridge and NAT on 
> the same network (use allow the same physical network after my linux 
> gateway to carry my public network and the NATed private network). I 
> will have to look into it again, this option may have been a cause of 
> some of my issues.

*nod*  Bridging Routers can be interesting critters to work with.

Brouters are usually used to allow globally routable systems IP 
addresses to be used in front of and behind a firewall (of sorts).  I.e. 
a small block of IP addresses that the brouter uses for its external IP 
address as well as internal public servers use IP addresses from to be 
directly accessible from the net with out any sort of NAT.

(INet) --- (Cable / DSL modem) --- (BRouter) --- (Server(s)
                                              --- (Workstation(s))

To pull this off usually you bridge the internal and external NICs 
together and multi home the bridge interface for your internal and 
external IP addresses.  I.e. bri0 = A.B.C.D and bri0:1 = 192.168.144.254 
are your IP addresses.

In this case, you only bridge traffic to / from the A.B.C.x network and 
route any thing else.  You can even serve DHCP on the internal LAN with 
out a problem.

In this scenario, you can use either EBTables or IPTables to do your 
filtering.  The only thing you need to remember is to not bridge (DROP 
in the brouting table / BROUTE chain) any internal traffic and force it 
to be routed.  Another way to say it is to only bridge traffic to / from 
your globally routable IP addresses.  Remember that you will need to 
pass some ARP traffic too.




Grant. . . .

