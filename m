From: Jean Tourrilhes <jt@bougret.hpl.hp.com>
Subject: netfilter before routing for local outgoing packets ?
Date: Wed, 24 Sep 2003 15:55:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030924225535.GB3366@bougret.hpl.hp.com>
Reply-To: jt@hpl.hp.com
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

	After reading various documentations, I've hit a deadlock. I
hope you guys can help me.
	<Not suscribed to the list, please cc me>

	What I want to do :
	I want to be able to route a specific *local* application
differently from other applications. A crude simplification would be
to route 'telnet' via eth0 and 'http' via eth1. In practice, I would
really like the flexibility of having two set of routes.

	I can define multiple routing tables (via 'ip route'), and set
some rules defining which table should be used (via 'ip rule'). Those
rules arebased on source address, dest address, TOS or
fwmark. Netfilter allow me to set TOS or fwmark based on more or less
what I want.
		http://en.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.netfilter.html
		http://linux-ip.net/html/tools-ip-rule.html
		http://linux-ip.net/html/adv-multi-internet.html
		(Excellent document by the way !)

	Unfortunately, local outgoing packet don't seem to go through
netfilter before passing through the routing table.
		http://www.docum.org/stef.coene/qos/kptd/

	Did I miss something obvious ? Is there any way to use 'ip
rule' for local outgoing traffic ? Is there any other mechanism that
would do what I want ?

	Thanks...

	Jean

