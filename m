From: Glen Becker <solar04@comcast.net>
Subject: Re: Dynamic redirection?
Date: 26 Feb 2004 10:24:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077809082.2771.5.camel@merlin>
References: <1077774151.3036.78.camel@merlin>
	 <403DAF2C.1090303@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <403DAF2C.1090303@snapgear.com>
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

Craig, thanks!  That works great for now; "simple is good".  If time
permits later I would like to experiment with your and Jeroen's
suggestion of marking.

-Glen

On Thu, 2004-02-26 at 03:32, Philip Craig wrote:
> Use these rules:
> 
> -t nat -A PREROUTING -s 192.168.2.128 -j ACCEPT
> -t nat -A PREROUTING -d 192.168.2.128 -j ACCEPT
> -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to 192.168.2.1
> -P FORWARD DROP
> -A FORWARD -p udp --dport 53 -j ACCEPT
> -A FORWARD -p udp --sport 53 -j ACCEPT
> -A FORWARD -s 192.168.2.128 -p ALL -j ACCEPT
> -A FORWARD -d 192.168.2.128 -p ALL -j ACCEPT
> 
> If you don't like duplicating the rules like that, then you could
> set marks in mangle PREROUTING and base both the nat and filter rules
> off the mark.  Or you could patch your kernel to use ippool or ipset,
> then you wouldn't need to dynamically add rules at all, you just
> have one rule each in nat and filter referring to the pool/set.


