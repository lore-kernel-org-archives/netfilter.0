From: Wladimir Mutel <mwg@mwg.dp.ua>
Subject: Interaction of conntrack & policy routing
Date: Mon, 23 Jan 2006 10:55:11 +0200
Message-ID: <20060123085511.GA17554@mwg.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Resent-Message-ID: <20060128092121.GD30250@mwg.dp.ua>
Resent-To: netfilter@lists.netfilter.org
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

	Hi,

	I have a router that is connected to 2 upstream ISPs (p1, p2). 
	Each ISP had allocated us its IP (p1i1, p2i1) 
	and gateway (p1g1, p2g1). I implemented a setup described in
	http://lartc.org/howto/lartc.rpdb.multiple-links.html
	like this :

	ip addr add $p1i1/30 dev eth1 # ifconfig , in fact
	ip addr add $p2i1/30 dev eth2
	# they gave us small ethernet subnets for each link

	ip rule add from $p1i1 lookup 1
	ip rule add from $p2i1 lookup 2
	ip route add table 1 default via $p1g1
	ip route add table 2 default via $p2g1
	# that's split access as described in LARTC 4.2.1

	for i in $p1list
	do ip route add $i via $p1g1 # dev eth1
	done
	for i in $p2list
	do ip route add $i via $p2g1 # dev eth2
	done
	#each provider has a list of its local networks, with free access

	ip route add default via $p1g1
	#choose one provider for default routing

	We have our intranet connected to eth0, and we have mail server
	in there (intramail), and we want to pass incoming smtp 
	connections via	router to this server (in iptables-save format):

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -i eth1 -d $p1i1 -p tcp -m tcp --dport 25 -j DNAT --to-destination $intramail
-A PREROUTING -i eth2 -d $p2i1 -p tcp -m tcp --dport 25 -j DNAT --to-destination $intramail
-A POSTROUTING -s $intramail -o eth1 -p tcp -m tcp --dport 25 -j MASQUERADE 
-A POSTROUTING -s $intramail -o eth2 -p tcp -m tcp --dport 25 -j MASQUERADE 
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A INPUT -i lo -p tcp -m tcp --dport 25 -j ACCEPT 
-A INPUT -p tcp -m tcp --dport 25 -j LOG 
-A INPUT -p tcp -m tcp --dport 25 -j DROP 
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A FORWARD -s $intramail -o eth1 -p tcp -m tcp --dport 25 -j ACCEPT 
-A FORWARD -s $intramail -o eth2 -p tcp -m tcp --dport 25 -j ACCEPT 
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
COMMIT

	Now I have an external host h2 in $p2list network, and I open 
	smtp connection to $p1i1 . Packets with source address $h2 and
	dest.address $p1i1 enter the router via interface eth1.	Then
	they are conntracked/dnatted to $intramail. 
	Then related/established replies from $intramail are 
	conntracked back to src.addr $p1i1 and dst.addr $h2. And then,
	the question is, are they run through policy routing rules again
	to be sent back through eth1 as per 'lookup 1'/'table 1' ? The
	problem is that I don't get any reply from dnatted $intramail. 
	When I connect from $h2 to $p2i1, all goes well and smtp reply
	is visible. The same is true for host h1 in $p1list. When I
	connect from $h2 to $p2i1, connection just times out. When I
	connect from $h1 to $p1i1, all goes well. Btw, on such timeout,
	I don't ever see dnatted packets outgoing from eth0 (by tcpdump).

	Please tell what is wrong with me or with iptables.
	With only one provider, all was well. These problems started to
	happen only with policy routing for split access, when another
	provider was added to our config.

	Thank you in advance.


