From: "Thomas Kristensen" <Hyper@ubn.dk>
Subject: Log every package incoming and outcoming.
Date: Fri, 20 Aug 2004 12:32:24 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <44585.80.164.248.134.1092997944.squirrel@krank.darknet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

How can i log every package coming on INPUT, OUTPUT and FORWARD chains.

I want to log every package to lateron collect the data and make stats
over the use from every ip inside the firewall. The reason why i need to
log, is i need to check every ip to se if its inside denmark, or outside
denmark (i got the list for dk ips).

i dont want a full system setup, i just need somekind og modul for
iptables, or a conf for iptables to log every thing.
The problem is if i set a rule, iptables will stop at a matching rule, and
therefor i cant set a log rule in the end for alle chains.


Any ideas?


----------------------------------------------
DarkNet Webmail -http://webmail.darknet.dk



