From: "Jeroen van den Hoed" <jeroen@smartnet.dhs.org>
Subject: inconsistency in iptables and ifconfig traffic counters?
Date: Wed, 5 Jan 2005 17:48:43 +0100
Message-ID: <000901c4f346$6bc96ec0$3200a8c0@jeroen>
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

Hello all,

I'm working on a script to monitor all traffic that passes my colocated
server. My first thought was to use ifconfig to monitor the RX and TX
counters repeatedly and calculate my (monthly) traffic. Later I decided to
use iptables since it can monitor the traffic seperately, for multiple ip
aliases, where ifconfig can not.

I now have both scripts running at the same time, and I came accross
inconsistencies in the reported traffic. Ifconfig reports more traffic than
iptables does. For example; yesterday, iptables reported that my received
traffic was 230mb, whereas ifconfig reported 259mb. (the transmitted traffic
has similar inconsistencies, ifconfig reports 10 to 15% more traffic than
iptables does)
The problem, of course, is that I now don't know which counter to trust.

Setup
My external interface is eth0 which is checked with "ifconfig eth0" every 5
minutes. The RX and TX values are then written to a log file and at the end
of the day these values are added up and reported to me by mail. (The script
handles the overflow of the 32bit counter values correctly.)

For iptables I've a couple of rules to measure my incoming and outgoing
traffic in the mangle table; as follows:
iptables -t mangle -N incomingtraffic
itpables -t mangle -A incomingtraffic -j RETURN
iptables -t mangle -A PREROUTING -i eth0 -j incomingtraffic
iptables -t mangle -N outgoingtraffic
itpables -t mangle -A outgoingtraffic -j RETURN
iptables -t mangle -A POSTROUTING -o eth0 -j outgoingtraffic
At the end of the day these values are read out and the counters are reset
to zero (iptables -L -n -v -x -t mangle -Z).

Shouldn't the iptable rules above count ALL the traffic coming in and going
out of eth0? And if these rules are correct, then why is this report lower
than the report of ifconfig?

Hope someone can enlighten me.


Thanks in advance,
Jeroen van den Hoed


