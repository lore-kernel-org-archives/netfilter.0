From: Rene Cunningham <rene@dclabs.com.au>
Subject: pptp-conntrack-nat and 2.6
Date: Fri, 14 Jan 2005 11:50:46 +1100
Message-ID: <20050114005046.GP18935@eden.office.dclabs.com.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Gday,

Ive been tackling pptp-conntrack-nat with kernel 2.6 for the past couple of
days and im not getting far.

It appears that pptp-conntrack-nat for 2.6 is very experimental and is
not working in its current state. It worked well in 2.4.

Ive come up with a quick hack, though it isnt very stable and is only
limited to a single internal machine. It uses the MARK target to mark
gre packets which allows netfilter to track the packets easily.

external interface = ppp0
internal pptp client = 192.168.1.50
mark value = 1

iptables -t mangle -A PREROUTING -i ppp0 -p gre -j MARK --set-mark 1
iptables -t nat -A PREROUTING -i ppp0 -p gre -m mark --mark 1 -j DNAT
--to 192.168.1.50
iptables -A FORWARD -i ppp0 -p gre -m mark --mark 1 -j ACCEPT

Are there any other solutions to getting internal workstations connected
to external PPTP servers with connection tracking in 2.6? Assigning external
routable addresses to internal machines really isnt an option at the
moment.

Cheers!

-- 

Rene Cunningham
DCLabs Pty Ltd
http://www.dclabs.com.au

