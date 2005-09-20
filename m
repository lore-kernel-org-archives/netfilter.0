From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: rules for dhcp server
Date: Tue, 20 Sep 2005 08:46:36 -0500
Message-ID: <200509200846.37890.rob0@gmx.co.uk>
References: <a0f69e5050920053621fc6fa5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5050920053621fc6fa5@mail.gmail.com>
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

On Tuesday 20 September 2005 07:36, Askar wrote:
> I'm configuring a firewall on dhcp server, i'm a bit confuse which
> port to allow on INPUT that users (clients) get IP from the server
>
> from /etc/sevices...
>
> bootps 67/tcp dhcps #Bootstrap Protocol Server
> bootps 67/udp dhcps #Bootstrap Protocol Server
> bootpc 68/tcp dhcpc #Bootstrap Protocol Client
> bootpc 68/udp dhcpc #Bootstrap Protocol Client

The server binds 67/udp, client binds 68/udp. TCP is not used.

> dhcpv6-client 546/tcp #DHCPv6 Client
> dhcpv6-client 546/udp #DHCPv6 Client
> dhcpv6-server 547/tcp #DHCPv6 Server
> dhcpv6-server 547/udp #DHCPv6 Server

I don't know about this but I bet it's also UDP-only. If you're not 
using IPv6 addressing then you do not care.

> lot of other services do runnig on this machine, however i'm very
> clear about all other services, ie which port to allow etc

On the server machine you must allow connections to your 67/udp from 
68/udp. Some of these (renewals) will come addressed to the IP of your 
dhcpd; others (broadcasts) will come to 255.255.255.255. The origin 
IP's for such broadcasts are 0.0.0.0.

DHCP service is generally a good thing to keep behind a firewall, IMO. 
Mine at home is running on a server which gets pass-through DNAT from 
the external router, so I had to be tricky about this. If the source 
address is not in my LAN segment I handle it as an external packet, but 
that was a problem for DHCP. I simply accept all from 255.255.255.255 
(those won't pass through the external router anyway), but if you want 
to tighten it up you could try this:

iptables -A INPUT -s 0.0.0.0 -d 255.255.255.255 \
    -p udp --sport 68 --dport 67 -j ACCEPT


> All the client machines are running MS. Therefore any other good
> suggestion will be appreciated to machine the network efficient.

Get rid of all the MS machines. :)

Only bind your DHCP service to the interface[s] where you intend to 
offer DHCP.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

