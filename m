From: Jason Eberly <jason@killerinterviews.com>
Subject: non-local destinations ARP instead of routing
Date: Thu, 07 Apr 2005 11:19:42 -0500
Message-ID: <1112890782.22652.42.camel@jaypad>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

  I am seeing a most curious problem, and hope that someone here will
recognize something obvious and smack me in the head with it before we
have to delve into the inner depths of every relevant config...

  Here's a quick-n-dirty text diagram of the current network layout:

 { V }--[ r ]--[ fw ]--[PIX]--{ L }
                 x
               [ s ]
Key:
V   =  Vendor's network
r   =  Vendor's router
fw  =  Vendor's (iptables) firewall
s   =  Vendor's (samba) server
PIX =  Our Cisco PIX Firewall
L   =  Our LAN

  Everything on the *left* side of the PIX is in a DMZ (from the LAN-
side perspective.)  The 'fw' machine is configured to forward netbios
connections to 's', the samba server.  Clients on our LAN use the IP
address of 'fw' to map drives.  There did not used to be a 'fw' machine
in this picture at all, but when the vendor added it they simply used
the DMZ address previously owned by 's' and gave 's' a new one on a
private subnet.  The 's' machine is directly connected to 'fw' with a
crossover cable.

  Here's where things get dodgy: when a client on our Lan tries to map a
drive, the SYN packet gets to 'fw' as expected, and gets MASQ'd along to
's'.  The response come back, lands at 'fw' - at which point 'fw' starts
ARPing for a destination MAC address as if the LAN client were local to
the DMZ.

  Does anyone eyeballing this have an 'Aha!' for me?  Or do we need to
see iptables, routes, PIX rules, and packet captures to proceed?  Am I
correct in thinking that this is a basic routing issue and not an
iptables issue, that ARP is inappropriate here, and that the vendor's
work-around (static ARP entries on 'fw') is an abomination?

  Any insight would be greatly appreciated...  Thanks in advance!  :)


