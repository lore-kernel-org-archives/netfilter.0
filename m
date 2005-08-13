From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables + ebtables + snat question
Date: Sat, 13 Aug 2005 14:36:23 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508131433280.3437@yvahk01.tjqt.qr>
References: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Phelps <netfilter@decipher.com>
Cc: netfilter@lists.netfilter.org

> I have the following setup:
>
> LAN
> | 
> | 
>          if0       ________
> DMZ---if1     if2---|ROUTER|---INTERNET
> \   /      --------
> br0

Your ascii art is totally broken. If you draw ascii at all, use a monospaced 
font!

> LAN_NET = 10.0.0.1
> PUBLIC_NET = 77.25.33.0/28
> (14 hosts - broadcast = .15)
>
> I am doing transparent bridging between if1 and if2
> My ROUTER ethernet iface has IP 77.25.33.1
> my DMZ hosts will have public IPs ranging 77.25.33.2-14
>
> My question is can Masquerade (SNAT) my LAN
> IPs and use the ROUTER ethernet IP
> as a --to-source target?

Yes.

> Or do I have to assign a IP to my br0 interface?

The bridge itself needs an IP if you want to SNAT to it. Otherwise this would 
happen:

PING from dmz (77.25.33.2) to google.com (216.239.37.99) via
the nexthop (e.g. 77.1.2.3).

The bridge SNATs to 77.25.33.1

The nexthop asks arp-who-has 77.25.33.1 -- no response.
If your bridge does not have an IP, you need some ebtable tricks to make an 
ARP reply.

> I am in deign mode so I was trying to figure out
> if this is possible.
>
> The rule would look like this:
> $IPTABLES -t nat -A POSTROUTING \
> -o $BR0 -j SNAT --to-source $ROUTER_IP
>
> Can this work?


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

