From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: trying to tweek FW and / or ruleset
Date: Mon, 14 Feb 2005 07:08:20 +0300
Message-ID: <200502140708.20811.e-boogie@yandex.ru>
References: <420F4A83.7020504@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420F4A83.7020504@eccotours.dyndns.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Sunday 13 February 2005 15:39, Brent Clark wrote:
> ======================================================================================
> 
> echo 1 > /proc/sys/net/ipv4/ip_dynaddr  #This may help if you have a 
> dynamic IP address \(e.g. slip, ppp, dhcp\)
> echo 1 > /proc/sys/net/ipv4/conf/all/log_martians       #Enable logging 
> for malformed Ip Address
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp
> echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
> 
> =====================================================================================

The following article may be useful:

http://www.securityfocus.com/infocus/1711

--
Mikhail

