From: Dan Barron <dbarron@ddive.com>
Subject: Re: RTSP & RTP w/ Darwin Thru iptables
Date: Thu, 22 Jul 2004 23:24:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040722182406.039b10a0@arctictern.ddive.com>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
 <200407221502.41890.Alistair@nerdnet.ca>
 <6.0.0.22.0.20040722165744.0394d0c8@arctictern.ddive.com>
 <200407222109.32494.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407222109.32494.Alistair@nerdnet.ca>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
 <200407221502.41890.Alistair@nerdnet.ca>
 <6.0.0.22.0.20040722165744.0394d0c8@arctictern.ddive.com>
 <200407222109.32494.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

Thanks again for your insights.  It looks like it is working now.

For those who are interested - here's the current set of relevant rules 
that seem to be working.

# All coming out of DMZ or LAN and all with established connections on any 
interface
$IPTABLES -A FORWARD -i $DMZ_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Forward to RTSP in DMZ STREAMING SERVER
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp -d $DMZ_STREAMING 
--dport 554 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp -d $DMZ_STREAMING 
--dport 7070 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp -d $DMZ_STREAMING 
--dport 554 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp -d $DMZ_STREAMING 
--dport 7070 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp -d $DMZ_STREAMING 
--dport 6970:6999 -j ACCEPT

# DNAT to QTSS Server
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p tcp --dport 554 -j DNAT 
--to-destination $DMZ_STREAMING:554
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p tcp --dport 7070 -j DNAT 
--to-destination $DMZ_STREAMING:7070
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp --dport 554 -j DNAT 
--to-destination $DMZ_STREAMING:554
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp --dport 7070 -j DNAT 
--to-destination $DMZ_STREAMING:7070
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp --dport 6970:6999 -j 
DNAT --to-destination $DMZ_STREAMING:6970-6999

# SNAT - Anything heading out the Public interface gets the public IP
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

A working streamed sample can be seen at http://darwin.dswllc.com/sample.html.

Dan Barron


