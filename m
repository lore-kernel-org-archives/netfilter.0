From: Mark Hindley <mark@hindley.uklinux.net>
Subject: Firehol DROPping INVALID
Date: Sat, 5 Jun 2004 21:17:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040605201739.GA3481@hindley.uklinux.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have asked this on the Firehol lists, but got no response. Hope you
can help.

I am using kernel 2.6.6 and have firehol setting up a firewall on the
gateway machine with eth0 LAN, ppp0 dial-up link. NAT for hosts on LAN

If the ppp link is down and a host on the LAN sends a packet destined
for the outside world, the icmp-unreacahble packet does not get
returned, so the LAN host has to wait to time out.

The offending command issued by firehol seems to be: 


iptables -A OUTPUT -m state --state INVALID -j DROP

Although the comment says this is recommended in the Netfilter HOWTO, I
cannot find it.

I can get round it by adding

iptables -I OUTPUT 2  -m state --state INVALID -p icmp --icmp-type  destination-unreachable -j ACCEPT

which inserts the ACCEPT before the DROP above and means that hosts on
the LAN get an immediate icmp reply "destination-unreachable" if the
ppp link is down.

Is this wise? secure. Am I missing something.

Thanks for your help

Mark

