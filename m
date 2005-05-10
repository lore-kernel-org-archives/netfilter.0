From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: philosophical question regarding NAT
Date: Tue, 10 May 2005 17:11:03 -0500
Message-ID: <42813177.9030903@riverviewtech.net>
References: <1115723584l.29661l.0l@server.moose.blogdns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115723584l.29661l.0l@server.moose.blogdns.org>
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

> Although NAT is enabled and LAN side systems will be NATed to the 
> gateway's WAN side IP address, WAN side systems can still access systems 
> on the inside of the firewall if they know what the LAN side addresses 
> are (and have a route to the gateway somehow).
> 
> In other words, even though NAT is active the bridging function provided 
> by ip_forward is still happening as well.
> 
> It seems you can disable the bridging function with the following 
> PREROUTING rule:
> 
> -A PREROUTING -i eth0 -d <private_lan_block> -j DROP
> 
> which enforces NAT, ie, only NATed things can get through.  While you 
> can achieve the same thing by setting policy of FORWARD to DROP and 
> allowing only RELATED and ESTABLISHED stuff through (which I do)
> I am surprised I have not seen this PREROUTING rule used more often as a 
> safety measure.
> 
> It doesn't seem to break anything, does anyone know why this technique 
> isn't seen more often?

Usually (as far as I know any way) there are accompanying rules that will only allow any traffic form the internal LAN to pass out to the internet (assuming that you don't want to do any Q & A filtering) and ONLY allow ESTABLISHED and RELATED stateful traffic back in from the internet to the internal LAN.  If you have corresponding INPUT rules on your firewall I think that a LOT of what you are thinking about will be stopped at the firewall it's self.  To my knowledge this is what the statful matching is for.  Does any one care to comment on this?



Grant. . . .

