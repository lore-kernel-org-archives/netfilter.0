From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: DMZ howto
Date: Fri, 23 Sep 2005 11:02:58 -0500
Message-ID: <200509231103.09530.rob0@gmx.co.uk>
References: <BAY102-F19D493D986DF28A492857DAE960@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F19D493D986DF28A492857DAE960@phx.gbl>
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

On Friday 23 September 2005 10:17, P theodorou wrote:
> 1) the Apache will be hosted on 192.168.1.2 (eth2)

Is 192.168.1.2 the eth2 IP on this machine? Or are you saying, it's a 
different machine which is reached through the subnet on eth2? In the 
latter case ...

> and my dynamic ip is something 22.22.22.22  (eth0)
>
> somehow i declare
> iptables -t nat -A PREROUTING -p tcp --d 22.22.22.22  --dport 8080
> -j DNAT --to 192.168.1.2

... this is correct, *if* you want http://22.22.22.22:8080/ to pass 
through to 192.168.1.2:8080. Apache listens on 80 by default, so unless 
you have changed that prepare to be disappointed. Also note that all 
browsers default to connect to 80.

> -the above line my not beeing correct- so i redirect whatever
> touches 22.22.22.22 to the
> internal 192.168.1.2 threfore conclusion 2 i need a static ip
> or a should never reboot the computer ! right ?

You need to update your DNAT rules whenever your IP address changes. 
Perhaps your IP is relatively static, as mine is at home: dynamic in 
name only. For all practical purposes I can be confident I'll have this 
IP as long as I'm using this MAC address for DHCP with the ISP.

DHCP clients and pppd all offer ways of running scripts when the IP 
address changes. Generally the new IP address would be passed to that 
script as an argument, so it should be a simple exercise to delete your 
previous DNAT rules and replace them with the new IP.

> ps i phoned up my ISP they ask 5 pounds per month for static ip

In some cases a static IP is a good idea. It all depends on what you 
need to do. If you're running authoritative DNS and/or MTA, you do need 
a static IP. In your case you're more likely to be running afoul of 
your ISP's TOS. Many do not allow "servers" in dynamic IP space.

Another issue with residential Internet accounts might be bandwidth: 
many of them do not provide much upload bandwidth. Home users tend not 
to notice, but users connecting to your server from the outside might 
think it seems slow. Likewise when you have outside users taking all 
your upstream bandwidth, you will have trouble getting your own 
requests out.

[superfluous and hard-to-follow top-posted quotes removed]
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

