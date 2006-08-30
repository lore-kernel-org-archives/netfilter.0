From: Daniel Musketa <Daniel@musketa.de>
Subject: Re: [MASQUERADING] iptables keeps sending from old IP after ppp0's
	IP has changed
Date: Wed, 30 Aug 2006 15:47:47 +0200
Message-ID: <200608301547.47896.Daniel@musketa.de>
References: <200608301407.55481.Daniel@musketa.de>
	<Pine.LNX.4.61.0608301500440.4610@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0608301500440.4610@yvahk01.tjqt.qr>
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

Am Mittwoch, 30. August 2006 15:01 schrieb Jan Engelhardt:
> >Every night the router's ppp0 goes down and after about a minute up again
> > with a new IP. But iptables keeps on sending the NATted UDP packets
> > _from_ the old IP address. `iptables -F` and reloading the rules doesn't
> > help. The only workaround is to stop asterisk on the NAT client for about
> > 2 minutes.
[...]
> >How can I force iptables to use ppp0's real IP address as sender IP in
> >outgoing packets?
>
> Flush the conntrack table when ppp0 has gone up (yes, up)

Is there a cleaner way than

#!/bin/sh
TIMEOUT=$(cat /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout)
TIMEOUT_STREAM=$(cat /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream)
	
echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout
echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream

sleep 10

echo ${TIMEOUT} > /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout
echo ${TIMEOUT_STREAM} 
> /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream

#EOF

?

Daniel

