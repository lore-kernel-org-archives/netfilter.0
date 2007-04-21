From: Oleg <sov.rbsec@gmail.com>
Subject: Re: Iptables rule on span traffic
Date: Sat, 21 Apr 2007 23:33:41 +0400
Message-ID: <200704212333.41889.sov.rbsec@gmail.com>
References: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>
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

AFAIK pcap library gets traffic before iptables rule processing (because it's 
promiscous mode), so snort and tcpdump (and any other tool which uses pcap) 
continues to see any traffic (even 'blocked by iptables', because its rules is 
applied after interface pass).

> Anyway, here is my situation.
> I have fwsnort generate iptables rule (based on snort IDS rules) which are
> running on a machine with two interfaces. One of the interfaces (eth1) ?is
> connected to a SPAN port that mirrors traffic on part of our network, this
> interface is in promiscuous mode. The other interface (eth0) is a regular
> addressable interface. For some reason, the iptables rules seem to have no
> effect on traffic seen by the SPAN port.

-- 
Best regards, Oleg

