From: dhiraj.2.bhuyan@bt.com
Subject: connection tracking query
Date: Mon, 7 Apr 2003 10:02:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E0926876C@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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



1. I was reading the Iptables tutorial by Oskar Andreasson
http://iptables-tutorial.frozentux.net/iptables-tutorial.html.
It says that connection tracking in done in the PREROUTING chain or OUTPUT
chain (for locally generated packets). If connection tracking is done only
at these two chains, what happens to the packets that don't belong to an
already established connection? I understand that it will have to go through
the filter rules - before the state table is updated for a NEW/RELATED
connection. If that is the case, "conntrack" must be taking place at other
chains too (where the filter is applied). The following document
http://www.knowplace.org/netfilter/syntax.html does infact say that
"conntrack" is happening not only in the PREROUTING and the OUTPUT chain,
but also in INPUT and POSTROUTING chain. What I find strange with this is
that for a packet that goes through the "FORWARD" chain, "conntrack" is done
twice on the same packet - first in the "PREROUTING" chain and second in the
"POSTROUTING" chain. Does anyone have any explanation for this?


2. If a packet is found to belong to an already ESTABLISHED connection, does
it still have to go through the filter rules again?


Thanks,
dhiraj

