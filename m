From: "L.Malinov" <lucho@galix.com>
Subject: RE: IPTABLES + IPROUTE2
Date: Sat, 24 Jan 2004 14:05:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EHENIKBEJAMHPLPJOJBPMEDMDIAA.lucho@galix.com>
References: <20040124010457.GA8126@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040124010457.GA8126@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

Hi there,

I did try to remove "-o eth0" already but the result is still the same. Any
other possible suggestions?

-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
Sent: 24 January 2004 03:05
To: L.Malinov
Cc: netfilter@lists.netfilter.org
Subject: Re: IPTABLES + IPROUTE2


On Fri, Jan 23, 2004 at 01:44:38PM +0200, L.Malinov wrote:

> Hi there,
>
> I have the following configuration: Local Net with Linux RedHat 9.0 Squid
> proxy server (with one net card) and 2 gateways - router1 and router2. The
> default gateway for everyone including the proxy is router1. I'd like, the
> http request from the local net sent to the proxy to be forwarded to the
> Internet via router2. I'm trying the following configuration:
>
> iptables -A OUTPUT -o eth0 -t mangle -p tcp --dport 80 -j MARK --set-mark
2

A suggestion: remove "-o eth0" from the above.

> echo 202 www.out >> /etc/iproute2/rt_tables
> ip rule add fwmark 2 table www.out
> ip route add default via router2 dev eth0 table www.out
>
> It looks like the packets go through the right chain under iptables and
get
> marked, however after that they still don't get forwarded via router2 but
> router1. What could be wrong in this config and is this possible to
achieve
> at all with the above configuration?
>
> Regards
>
> L.Malinov
>


