From: "Klemen Kecman" <klemen@sting.si>
Subject: Re: IPTABLES + IPROUTE2
Date: Mon, 26 Jan 2004 08:53:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008601c3e3e1$94d6aeb0$6a02a8c0@klemen>
References: <EHENIKBEJAMHPLPJOJBPCEDKDIAA.lucho@galix.com>
Reply-To: "Klemen Kecman" <klemen@sting.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

$IPT -t nat -A PREROUTING -p tcp -d xxx.xxx.xxx.xxx --dport 53 -j
DNAT --to-destination xxx.xxx.xxx.xxx:53
It will forward the packet as it is to the destination ip and port. If u
have to change the packet what so ever then mangle it.

Klemen Kecman

----- Original Message -----
From: "L.Malinov" <lucho@galix.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 23, 2004 12:44 PM
Subject: IPTABLES + IPROUTE2


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
>


