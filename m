From: Jason Opperisano <opie@817west.com>
Subject: Re: trying to tweek FW and / or ruleset
Date: Tue, 15 Feb 2005 11:27:02 -0500
Message-ID: <20050215162702.GA19547@bender.817west.com>
References: <420F4A83.7020504@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <420F4A83.7020504@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Feb 13, 2005 at 02:39:31PM +0200, Brent Clark wrote:
> echo 1 > /proc/sys/net/ipv4/ip_dynaddr  #This may help if you have a 
> dynamic IP address \(e.g. slip, ppp, dhcp\)
> echo 1 > /proc/sys/net/ipv4/conf/all/log_martians       #Enable logging 
> for malformed Ip Address

"malformed IP Address" seems like an odd way to describe that.  the IP
address isn't malformed, it's not considered to be a valid source
address on the inbound interface; i.e., it's "alien."

> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp

i would be surprised if you want proxy_arp set to 1, unless you're
trying to do something semi-strange.  i could be mistaken...

> echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter

since you're enabling martian logging above, why are you disabling the
feature that detects martians?  "normally" you'd want rp_filter set to 1
on all interfaces, unless you know you're doing something intentionally
that won't work with it enabled.

> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

-j

--
"Shut up brain or I'll stab you with a Q-Tip."
        --The Simpsons

