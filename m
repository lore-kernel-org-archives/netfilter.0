From: Joel Newkirk <netfilter@newkirk.us>
Subject: Tangent to: portfw on iptables 2.4 kernel problem.
Date: Wed, 11 Dec 2002 03:15:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212110315.46400.netfilter@newkirk.us>
References: <96C102324EF9D411A49500306E06C8D1021AE36D@eketsv02.cubis.de>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <96C102324EF9D411A49500306E06C8D1021AE36D@eketsv02.cubis.de>
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

In researching a rather long reply directly to Louie Miranda on this,=20
(with no answers, just many debugging suggestions)  I enabled full=20
logging of all packets, with a DNAT from my firewall's external IP to a=20
LAN IP, then telnetted to that IP from the firewall machine.  iptables=20
v1.2.5, RedHat 7.3 'stock' kernel.

The resulting logs surprised me.

The initial packet followed this route through the firewall chains:

mangle-OUTPUT
nat-OUTPUT
filter-OUTPUT
mangle-POSTROUTING
nat-POSTROUTING
out on lo and back
mangle-PREROUTING
mangle-INPUT
filter-INPUT

skipping nat-PREROUTING.

Subsequent packets in the connection (successful telnet to myself :^)=20
skipped ALL nat table rules.

Does netfilter normally skip NAT chains entirely when lo is involved?  I=20
would have expected at least the initial packet to hit every chain. =20
(well, not FORWARD since the DNAT never took place...)

j


