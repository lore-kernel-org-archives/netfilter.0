From: Magnus Solvang <magnus@solvang.net>
Subject: Re: lan users surfing on lan webserver
Date: Thu, 27 Feb 2003 13:35:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030227123531.GA26259@first.knowledge.no>
References: <20030225215326.GA30804@first.knowledge.no>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030225215326.GA30804@first.knowledge.no>
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

Quoting Magnus Solvang (magnus@solvang.net):
| I'm configuring a firewall on a network where we have put
| the webserver on the inside of the firewall and given it
| a reserved ip-address.
| I have done the appropriate forwarding so that the webserver
| can be reached from the internett. Trouble is, users on the
| LAN have to use its internal ip-address to reach the web-
| pages.

I've been reading the docs, but still haven't figured this
one out.

According to NAT-HOWTO-10.html, I've set up these rules:

$IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTWEBSERVER1 -p tcp \
  --dport 80 -j DNAT --to $INTWEBSERVER1
$IPTABLES -t nat -A POSTROUTING -d $INTWEBSERVER1 -s $INTNET -p tcp \
  --dport 80 -j SNAT --to 192.168.1.20

192.168.1.20 is the internal ip-address on the firewall.

The first line is working fine (I can reach the server from the
internet).
But, the second line isn't doing what I hoped it would - the users
on the LAN cannot use the outside URL to get to the internal webserver.
tcpdump shows traffic going from the internal client -> external
webserver-address and back, but nothing reaches the interal webserver.

I noticed that the OUTPUT chain logged dropped packages from the
internal client to the webserver, and this rule cleared that up:

$IPTABLES -A OUTPUT -p tcp -o $INTIF -s $EXTWEBSERVER1 \
  --sport 80 -d $INTNET -j ACCEPT

But now, no packets are logged, and it's still not working.
I'm guessing the POSTROUTING line need an appropriate FORWARD-rule...
If so, what would it look like?

- M

