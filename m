From: Magnus Solvang <magnus@solvang.net>
Subject: Re: lan users surfing on lan webserver
Date: Mon, 3 Mar 2003 14:37:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030303133701.GD7199@first.knowledge.no>
References: <20030225215326.GA30804@first.knowledge.no> <20030227123531.GA26259@first.knowledge.no>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030227123531.GA26259@first.knowledge.no>
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

I'm trying this one one more time, since I still haven't found a
solution.
I have moved a webserver behind my iptables-firewall.
Outside dns for this webserver still points to its external ip-address,
so I've set up the firewall to listen to this ip-address (ethx-alias),
and forward the traffic to the internal webserver using DNAT. This
works.
However, the clients on the LAN cannot use the external URL to surf to
this machine, they have to use its internal ip-address (I know I could
set up Bind on the inside, but I'm trying to avoid this).
I'm using the solutions suggested in the NAT-Howto:

  http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

but the traffic is not reaching the internal webserver.

Using tcp-dump, I see that when the client tries to connect to

http://$external_url/

it connects to the ethX-alias on the firewall (the webservers old
ip-address), and thus gets a "Connection refused", since the firewall
isn't running a webserver - it's only supposed to forward the traffic
bound for this ip-address to the internal webserver. But the forwarding
is not working when initiated from the LAN.

I have this relevant FORWARD chain:
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
-p tcp -d $EXTWEBSERVER1 --dport 80 -j ACCEPT

PREROUTING:
$IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTWEBSERVER1 -p tcp \
--dport 80 -j DNAT --to $INTWEBSERVER1

POSTROUTING (http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html)

$IPTABLES -t nat -A POSTROUTING -d $INTWEBSERVER1 -s $INTRANET -p tcp \
--dport 80 -j SNAT --to-source 192.168.1.20

192.168.1.20 being the firewalls LAN-address...

- M

