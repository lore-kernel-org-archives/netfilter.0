From: Tim Evans <tkevans@tkevans.com>
Subject: Translating Ziegler Book ipchains Rules
Date: Wed, 11 Dec 2002 07:00:46 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111200.gBBC0kK9004655@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-MD5: uKmVyW2KEW801c4G1wOq/g==
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

We've been using the example script from the Ziegler _Linux Firewalls_
book as a base for our firewall for some years, and are now "translating"
it to use iptables.

That script has nice, symmetrical pairs of rules like this:

# HTTP (80) - accessing remote web sites as a client
ipchains -A output -i eth1 -s $IPADDR $UNPRIV -d 0/0 80 -p tcp -j ACCEPT
ipchains -A input -i eth1 -s 0/0 80 -d $IPADDR $UNPRIV -p tcp ! -y -j ACCEPT

With connection tracking in iptables, can all these pairs be cut to just
one rule, like this:

$IPTABLES -A FORWARD -o eth1 -s $IPADDR -p tcp --sport $UNPRIV  \
--dport 80 -j ACCEPT

Or do I still need this, too?

$IPTABLES -A FORWARD -i eth1  -p tcp --sport 80 -d $IPADDR \
--dport $UNPRIV ! --syn -j ACCEPT

Similarly, is it necessary to have multiple rules for ftp control
and data ports, or does ip_conntrack_ftp handle everything with just
one rule, like this:

$IPTABLES -A FORWARD -o eth1 -s $IPADDR -p tcp --sport $UNPRIV  \
--dport 21 -j ACCEPT

Or do I need these in pairs also, with parallel ones for port 21?

Thanks, I will summarize.
--
Tim Evans		|    5 Chestnut Court
tkevans@tkevans.com	|    Owings Mills, MD 21117
http://www.tkevans.com/	|    443-394-3864;410-748-0160 (pager)


