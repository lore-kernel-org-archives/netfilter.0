From: Jason Opperisano <opie@817west.com>
Subject: Re: Static NAT Mappings
Date: Wed, 06 Oct 2004 19:01:46 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097103706.1716.29.camel@wolfpack.ljm.dom>
References: <416470cc.39e.491e.214291233@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <416470cc.39e.491e.214291233@arbbs.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-10-06 at 18:25, John Black wrote:
> I'm trying to setup static NAT mappings.
> 
> this is what i did, but it doesn't work:
> public address 1.2.3.4/24
> ifconfig eth0:0 1.2.3.4 netmask 255.255.255.0

ip address add 1.2.3.4 dev eth0

> then in my firwall script:
> iptables -t nat -A POSTROUTING -s 192.168.0.4 \
>  -o eth0 -j SNAT --to 1.2.3.4

OK--looks good.

> i tried this also:
> iptables -t nat -A POSTROUTING -s 192.168.0.4/24
>   -o eth0 -j SNAT --to 1.2.3.4

that's nonsense.  .4 is not the network address, .0 is.

> i have read the howto on the netfilter web site. 
> but i'm still lost.

do you have filter rules in place that could be blocking the traffic?

have you enabled IP forwarding (sysctl -w net.ipv4.ip_forward=1)?

-j

-- 
Jason Opperisano <opie@817west.com>


