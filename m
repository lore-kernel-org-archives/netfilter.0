From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Combined Internal/External DNAT question
Date: Mon, 16 May 2005 16:06:43 -0500
Message-ID: <42890B63.2000603@riverviewtech.net>
References: <42889941.5060507@griffous.net>	<4288E7F6.3030700@riverviewtech.net>	<Pine.LNX.4.60.0505161523100.15128@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0505161548000.15128@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505161548000.15128@darkstar.sysinfo.com>
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

> an interesting tidbit from the iptables man pages suggests that their is 
> a built in facility for this one to one nat thingie I'm looking into here;
> 
> NETMAP
>        This  target allows you to statically map a whole network of addresses onto another network of addresses.
>        It can only be used from rules in the nat table.
> 
>        --to address[/mask]
>               Network address to map to.  The resulting address will be constructed in the  following  way:  All
>               'one'  bits  in the mask are filled in from the new `address'.  All bits that are zero in the mask
>               are filled in from the original address.
> 
> If I read this correctly, it appears to build the hash tables of 
> addresses for one eh?

As I understand it the NETMAP target is used to do NATing on a large range ((sub)network) of IPs in on rule.  Thus you could directly translate 192.168.0.1 <-> 172.16.0.1, 192.168.0.2 <-> 172.16.0.2, 192.168.0.n <-> 172.16.0.n, etc.

As far as your situation are you really wanting each computer on your network to have a globally routable IP?  If not then you do not need / want to look at NETMAP.



Grant. . . .

