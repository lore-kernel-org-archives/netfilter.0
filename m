From: Markus Linden <markus@drinklist.org>
Subject: Re: Problem with ssh
Date: Wed, 25 Aug 2004 13:32:24 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093437143.2946.178.camel@apan.drinklist.org>
References: <412C8590.8030900@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <412C8590.8030900@4Dllc.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Steve Comfort <steve@4Dllc.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-08-25 at 13:26, Steve Comfort wrote:
> The client side wireless box (on the left) has the following rule in it :
> 
> $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.200.0/16 -j DROP

Look at your netmask, should be /24 not a /16?

Markus

