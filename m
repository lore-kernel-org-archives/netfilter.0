From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Dropping SYN with FIN flag set
Date: 21 Oct 2003 12:39:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066754393.1557.29.camel@valhalla>
References: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: jimm@simutronics.com
Cc: netfilter@lists.netfilter.org

On Tue, 2003-10-21 at 11:47, James Miller wrote:
>
> Nessus is always alerting on  "Remote host does not discard TCP SYN packets
> which have the FIN flag set".  What is the best way to close up this hole?

One of the nice things you get with iptables over many commercial
offerings is the flexibility to deal with stuff like this. ;-)

> something like '-p tcp --tcp-flags SYN,FIN -j DROP'

Here is what I do:

iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,ACK -j LOG
--log-prefix " SYNACK "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,ACK -j REJECT
--reject-with icmp-host-unreachable
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j LOG
--log-prefix " SYNFINSCAN "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j REJECT
--reject-with icmp-host-unreachable
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN -j LOG
--log-prefix " FINSCAN "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN -j REJECT
--reject-with icmp-host-unreachable
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL NONE -j LOG
--log-prefix " NULLSCAN "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL NONE -j REJECT
--reject-with icmp-host-unreachable
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN,PSH,URG -j LOG
--log-prefix " NMAPXMAS "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN,PSH,URG -j REJECT
--reject-with icmp-host-unreachable

I prefix these traffic patterns to make them easier to parse out of the
logs, and the reject the traffic with a host unreachable. I like using
type 3's rather than drops as it confuses the scanner on the other end
and many times shuts it down (ie. scanner gives up thing the host is not
on-line).

HTH,
C



