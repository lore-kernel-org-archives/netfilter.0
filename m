From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables + ebtables + snat question
Date: Sat, 13 Aug 2005 13:23:40 -0500
Message-ID: <200508131323.40526.rob0@gmx.co.uk>
References: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
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

On Friday 2005-August-12 17:41, Scott Phelps wrote:
> I have the following setup:
>
>            LAN
>             |
>             |
>            if0       ________
> DMZ---if1     if2---|ROUTER|---INTERNET
>           \   /      --------
>            br0

FWIW I think the ASCII drawing made perfect sense. I suspect MUA or 
perhaps MTA/MDA issues on Jan's part.

> LAN_NET = 10.0.0.1
> PUBLIC_NET = 77.25.33.0/28
> (14 hosts - broadcast = .15)

BTW I have a site which is using the broadcast IP for a host. You can 
get away with that if you aren't using anything on that subnet which 
needs broadcast. For example: DHCP, SMB. Hosts on the DMZ might answer 
pings of the broadcast IP, but that's a minor inconvenience.

> I am doing transparent bridging between
> if1 and if2
>
> My ROUTER ethernet iface has IP 77.25.33.1
>
> my DMZ hosts will have public IPs ranging
> 77.25.33.2-14
>
> My question is can Masquerade (SNAT) my LAN
> IPs and use the ROUTER ethernet IP
> as a --to-source target?

What will happen to the reply packets? If the router is doing the SNAT 
it should work fine. But if it's the machine with the bridge, no. The 
router will receive and drop those replies.

> Or do I have to assign a IP to my br0 interface?

That would work. Or have the bridge machine SNAT to 10.0.0.1, then do 
another layer of SNAT at the router. In either case the router has to 
have a route to 10.0.0.0/$NETMASK.

I take it you're feeling cramped with IP addresses in the /28. That's 
why I suggested using your broadcast IP. (I have tried setting the 
"-nobroadcast" option with ifconfig(8), but it fails.)

> I am in deign mode so I was trying to figure out
> if this is possible.

Try it out, but I think you need that IP on the bridge.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

