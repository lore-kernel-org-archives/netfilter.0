From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: lan users surfing on lan webserver
Date: Mon, 3 Mar 2003 08:59:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303030859.45430.netfilter@newkirk.us>
References: <20030225215326.GA30804@first.knowledge.no> <20030227123531.GA26259@first.knowledge.no> <20030303133701.GD7199@first.knowledge.no>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030303133701.GD7199@first.knowledge.no>
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
To: Magnus Solvang <magnus@solvang.net>, netfilter@lists.netfilter.org

On Monday 03 March 2003 08:37 am, Magnus Solvang wrote:

> I have moved a webserver behind my iptables-firewall.

> However, the clients on the LAN cannot use the external URL to surf to
> this machine, they have to use its internal ip-address (I know I could
> set up Bind on the inside, but I'm trying to avoid this).

> I have this relevant FORWARD chain:
> $IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED
> \ -p tcp -d $EXTWEBSERVER1 --dport 80 -j ACCEPT

FORWARD or INPUT?  It should be:

$IPTABLES -A FORWARD -p tcp -d $INTWEBSERVER1 --dport 80
-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

FORWARD because after DNAT has done its job this traffic is no longer=20
addressed to the firewall box.  $INTWEBSERVER1 for the same reason.  And=20
skip the "-i $EXTIF" to ensure it matches connections from the LAN as=20
well as 'outside' clients.

> PREROUTING:
> $IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTWEBSERVER1 -p tcp \
> --dport 80 -j DNAT --to $INTWEBSERVER1

Again, you might want to drop the "-i $EXTIF" part...

> $IPTABLES -t nat -A POSTROUTING -d $INTWEBSERVER1 -s $INTRANET -p tcp
> \ --dport 80 -j SNAT --to-source 192.168.1.20

This part looks fine as-is.

j


