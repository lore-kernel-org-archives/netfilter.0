From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 14:42:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040109194247.GD24304@cannon.eng.us.uu.net>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net> <001601c3d6d0$b8198e10$1684188d@Kiste>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001601c3d6d0$b8198e10$1684188d@Kiste>
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
Content-Transfer-Encoding: 7bit
To: Thhoep <thhoep@gmx.de>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

> for marking i use:
> "iptables -t mangle -A PREROUTING -i eth4 -s 192.168.0.22 -d 141.24.12.2 -j
> MARK --mark-with 1"
> 
> for selecting a routing table upon that marking i use:
> "ip rule add fwmark 1 table test"
> 
OK. Are these two instructions the only instructions active on the box?

> while table test has a local network route, a host route to the ppp peer and
> a default route to the internet over the ppp peer as gateway.
> 
> the main table is the same but using another ppp interface.
> 
> all the other tables only differ only in the way out, but all include the
> route to the one and only local net.
> 
> 
> back to the problem:
> the marking doesnt seem to be the problem. if i let the marking stay and
> just remove the upon routing rule and replace it with:
> "ip rule add from 192.168.0.22 table test"
> then everything works absolutely fine. so i think its something with the
> iproute trying to use the firewall mark what drops the packet, because it
> seems to disappear while beeing routed.
> 

Both:
"ip rule add fwmark 1 table test"
and
"ip rule add from 192.168.0.22 table test"

are being used for the ping packets and seem to be equivalent. Your problem
seems to be the loss of the pong packets, right?

>  tcpdump verifies, that indeed replies are coming in and shows, that no icmp
> error messages are sent out, what should be the case if no route back could
> be found due to incorrect routing.

This part is not completely correct. The ICMP messages would go out through
ppp0, right? and you're not capturing that.

Do a simultanious tcpdump on all the ppp interfaces and let us know the result.
Although, with the output of "ip rule" it looks to me that table main must be
taken for the return traffic and you have a route to 192.168.0.0/24 there.

Ramin

