From: Philip Craig <philipc@snapgear.com>
Subject: Re: Dynamic redirection?
Date: Thu, 26 Feb 2004 18:32:44 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403DAF2C.1090303@snapgear.com>
References: <1077774151.3036.78.camel@merlin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077774151.3036.78.camel@merlin>
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
To: Glen Becker <solar04@comcast.net>
Cc: netfilter@lists.netfilter.org

Glen Becker wrote:
> Is there a way to "redirect" web connections only if the packet hasn't
> already been ACCEPTed for forwarding?

Since DNAT is performed in PREROUTING, which comes before FORWARD,
it is impossible to base the DNAT decision off whether the packet is
accepted in FORWARD.

You need to duplicate your authentication rules in the nat table.

> For example:
> Host 192.168.2.128 is authenticated and should be allowed any internet
> connections.  http requests from all other internal hosts are sent to
> the local web server:
> 
> -P FORWARD DROP
> -A FORWARD -p udp --dport 53 -j ACCEPT
> -A FORWARD -p udp --sport 53 -j ACCEPT
> -A FORWARD -s 192.168.2.128 -p ALL -j ACCEPT
> -A FORWARD -d 192.168.2.128 -p ALL -j ACCEPT
> -A [something really smart like DNAT but only if the packet traverses
> this far]

Use these rules:

-t nat -A PREROUTING -s 192.168.2.128 -j ACCEPT
-t nat -A PREROUTING -d 192.168.2.128 -j ACCEPT
-t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to 192.168.2.1
-P FORWARD DROP
-A FORWARD -p udp --dport 53 -j ACCEPT
-A FORWARD -p udp --sport 53 -j ACCEPT
-A FORWARD -s 192.168.2.128 -p ALL -j ACCEPT
-A FORWARD -d 192.168.2.128 -p ALL -j ACCEPT

If you don't like duplicating the rules like that, then you could
set marks in mangle PREROUTING and base both the nat and filter rules
off the mark.  Or you could patch your kernel to use ippool or ipset,
then you wouldn't need to dynamically add rules at all, you just
have one rule each in nat and filter referring to the pool/set.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


