From: "giovanni costagliola" <giovanni.costagliola@nexusat.it>
Subject: Active FTP and NATting: troubles
Date: Fri, 16 Apr 2004 16:48:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BFEIJHPOPCCMOPEKHHMOAEOCDCAA.giovanni.costagliola@nexusat.it>
References: <Pine.LNX.4.58.0404160851070.27976@seraph.dst.usb.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0404160851070.27976@seraph.dst.usb.ve>
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
To: netfilter@lists.netfilter.org

hallo all,
	I'm implementing a firewall which, moreover, NATs all the incoming connections to internal private addresses. I'm experiencing some
problems configuring active FTP and, honestly, I cannot figure out what's going wrong. I'm coming to get your help.

Scenarios:

Internet <-> FW <-> DMZ

I'm natting all public addresses to private ones.

Let's suppose my server has the public ip IP_PUBLIC and the private ip IP_PRIVATE.

I've loaded the following kernel modules:
ip_conntrack
ip_conntrack_ftp
ip_nat_ftp

I stated, initially, the following statement

iptables -t nat -A PREROUTING -d IP_PUBLIC -j DNAT --to-destination IP_PRIVATE

after some test I've added the following statement too:

iptables -t nat -A POSTROUTING -s IP_PRIVATE -j DNAT --to-source IP_PUBLIC

to allow natting of FTP server incoming connections to the clients.

Q1. Am I right argumented such I did? Or the 2nd statement is pleonastic?

I see that, adding the second rule, some matching occurr.

then I enabled the traffic issuing the following four statements:

iptables -A CHAIN_INBOUND  -d IP_PRIVATE -p tcp --dport ftp-data -m state --state ESTABLISHED -j ACCEPT
iptables -A CHAIN_OUTBOUND -s IP_PRIVATE -p tcp --sport ftp-data -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A CHAIN_INBOUND  -d IP_PRIVATE -p icmp -m state --state RELATED -j ACCEPT
iptables -A CHAIN_OUTBOUND -s IP_PRIVATE -p icmp -m state --state RELATED -j ACCEPT

Q2. The last two rules should allow icmp traffic "related" to the ftp connection. Are they legal? In the sense that iptables can
handle them appropriately recognizing the fact they are related to the FTP transfer?

looking at iptables statistics, while attempt to connect via active ftp to the host, I don't see any matching of the rules
concerning ftp-data channell

Q3. where I'm wronging?

thanx for your time
*g


