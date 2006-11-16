From: Mogens Kjaer <mk@crc.dk>
Subject: NAT with two external IP numbers
Date: Thu, 16 Nov 2006 13:37:14 +0100
Message-ID: <455C5B7A.5040702@crc.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

I'm trying to solve a problem:

We have now:
Internal network: 172.20.0.0/16
External network: 130.226.184.38

This works without problems running a Linux
box with iptables and MASQUERADING

The problem is, that due to a license agreement
(online journal access), some of our users on
the 172.20.0.0 network must have access, and some
don't.

My idea was:

Give the linux box two IP numbers externally,
e.g. 130.226.184.38 and 130.226.184.39, register
130.226.184.38 with the journal, change the
internal IP numbers so that:

172.20.0.0/17 has access
172.20.128.0/17 does not have access

So I want 172.20.0.1 - 172.20.127.255 to be
masqueraded as 130.226.184.38 externally,
and 172.20.128.0 - 172.20.255.254 to be
masqueraded as 130.226.184.39

I've tried adding two IP numbers externally:

# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:02:55:11:EF:03
           inet addr:130.226.184.38  Bcast:130.226.184.255 
Mask:255.255.255.0
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:1774 errors:0 dropped:0 overruns:0 frame:0
           TX packets:2543 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:298539 (291.5 KiB)  TX bytes:237100 (231.5 KiB)

eth0:1    Link encap:Ethernet  HWaddr 00:02:55:11:EF:03
           inet addr:130.226.184.39  Bcast:130.226.184.255 
Mask:255.255.255.0
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

and use the following when setting up masquerading:

/sbin/iptables -t nat -A POSTROUTING -s 172.20.0.0/17 -o eth0 -j MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -s 172.20.128.0/17 -o eth0:1 -j 
MASQUERADE

but it doesn't work. Packages comming from 172.20.128.0 addresses
does not get their source address changed, e.g. if I ping another
machine on the 130.226.184.x network from the 172.20.128.x network,
the machine will receive packets with a 172.20.128.x from address,
not 130.226.184.39

How do I solve this problem?

Mogens

-- 
Mogens Kjaer, Carlsberg A/S, Computer Department
Gamle Carlsberg Vej 10, DK-2500 Valby, Denmark
Phone: +45 33 27 53 25, Fax: +45 33 27 47 08
Email: mk@crc.dk Homepage: http://www.crc.dk

