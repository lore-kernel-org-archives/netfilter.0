From: Marcus Zoller <Marcus.Zoller@idnt.net>
Subject: strange routing --
Date: 12 Jun 2002 20:21:19 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023906079.26607.73.camel@Snoopy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org
Cc: kai@plocki.org

Hi all,

this is not realy related to netfilter but maybe someone here can help
me to find what I did wrong/forgot,...:

I get the following in the logs on my netfilter gateway, about every 2
seconds from two machines behind of the gateway that are in one subnet:

REJECT:	IN=eth0 OUT=eth0 
	SRC=10.10.0.218 DST=10.10.0.200 LEN=56 TOS=0x00 PREC=0x00 TTL=63 	ID=0
DF PROTO=UDP SPT=111 DPT=50916 LEN=36

I'am wondering why the packet is sent to the gateway instead of
sending it direct?

10.10.0.218 is a kernel 2.4.18 NFS server running portmap, ...
10.10.0.200 is a linux box with mounted directorys from that host.

All 3 machines are in the same subnet 10.10.0.0/24. The gateway logging
the message is the default gateway for both.

Running tcpdump -nvi eth0 on the gateway shows exactly what gets logged:

> arp who-has 10.10.0.218 tell 10.10.0.254
< arp reply 10.10.0.218 is-at 0:50:ba:e9:7:d3 (0:80:c8:ca:ce:41)
< 10.10.0.218.sunrpc > 10.10.0.200.50919: udp 28 (DF) (ttl 64, id 0)
> 10.10.0.254 > 10.10.0.218: icmp: 10.10.0.200 udp port 50919
unreachable [tos 0xc0]  (ttl 255, id 49752)

I checked the interface mask, broadcast and routing entries on both
machines and they are as they should be.

The interesting thing is the routing cache on 10.10.0.218 (it has
another interface with 10.10.0.219 but this address never appears in the
logs):
# route -Cn | grep 10.10.0.200
10.10.0.200     10.10.0.218     10.10.0.218     l     0      0      152
lo
10.10.0.200     10.10.0.218     10.10.0.218     l     0      0    32611
lo
10.10.0.219     10.10.0.200     10.10.0.200           0      0    25713
eth1
10.10.0.218     10.10.0.200     10.10.0.200           0      0        1
eth1
10.10.0.218     10.10.0.200     10.10.0.200           0      1        0
eth1
10.10.0.218     10.10.0.200     10.10.0.254           0      0     1304
eth0

Rebooting the machines helps for about 10 minutes then the last entry is
again in the cache.

Interface config:
inet Adresse:10.10.0.218  Bcast:10.10.0.255  Maske:255.255.255.0
inet Adresse:10.10.0.219  Bcast:10.10.0.255  Maske:255.255.255.0

Many thanks for reading this and for any help/ideas!!!

-marcus



