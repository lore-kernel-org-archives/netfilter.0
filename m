From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Route packets from an interface to another
Date: Sat, 10 Sep 2005 02:54:40 -0500
Message-ID: <200509100254.40327.rob0@gmx.co.uk>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
	<2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>
	<200509092345.40386.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509092345.40386.rob0@gmx.co.uk>
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

On Friday 2005-September-09 23:45, I wrote:

Most of the story, but an important part was missing. Apologies to 
anyone who is seeing this on both lists.

> Home machine: LAN address 192.168.6.6/24 (no direct external
> interface) Remote machine: x.y.z.112/29
>
> Home openvpn config:
> remote x.y.z.112
> ifconfig x.y.z.116 192.168.6.248
> ifconfig-nowarn
>
> Remote openvpn config:
> remote my.dynamic.dnsname
> ifconfig 192.168.6.248 x.y.z.116
>
> Started both ends of the tunnel. At home:
> # echo 64 tunnel >> /etc/iproute2/rt_tables
> # ip rule add from x.y.z.116 table tunnel
> # ip route add default via 192.168.6.248 table tunnel
> # ip route flush cache
> (These should go in an openvpn --up script.)

Also, at the remote:
# echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
# echo 1 > /proc/sys/net/ipv4/ip_forward
(These might be wanted in an --up script at the other endpoint.)

The first command tells the eth0 interface (substitute the name of 
yours) to listen for proxy ARP: hosts other than itself, but for whom 
it has an explicit route. http://en.wikipedia.org/wiki/Proxy_ARP 
explains better than I can.

Earlier, by accident, I had bound the wrong IP's at each endpoint, so 
the system arp(8) cache was still answering for x.y.z.116. In time the 
cache timed out, and the tunnel stopped working.

The second command is not needed if you were already using the machine 
as a router, which I was, but it occurred to me that you and others 
might not be doing that.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

