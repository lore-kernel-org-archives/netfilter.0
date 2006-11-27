From: "Wilson, Richard E" <richard.wilson@eds.com>
Subject: NOTRACK not working as expected
Date: Mon, 27 Nov 2006 15:06:34 -0600
Message-ID: <DE0BDC6DCC1F724882C0828AD2D3E684093116@usplm203.amer.corp.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

All,

Running RH EL 4 Kernel 2.6.9-42.0.3.ELsmp, iptables v1.2.11

I added the following rule to prevent the ip_conntrack table from
tracking localhost connections:

iptables -t raw -A PREROUTING -i lo -j NOTRACK

The monitor script in place to allow us to reboot this system gracefully
when the ip_conntrack table runs out of space reports when it reaches
90% of capacity (determined by ip_conntrack | wc -l / ip_conntrack_max).
I now have a couple copies of the ip_conntrack table a short time before
it ran out of space and I find a LOT (5k+) of connections with
"src=3D127.0.0.1 dst=3D127.0.0.0" in the table.  Is there a better way =
to
create a rule to not track localhost connections?

This server has 4GB of RAM and uses the default value of 65536 for the
ip_conntrack table size.  I have already changed the
ip_conntrack_tcp_timeout_established value from its default of 432000 (5
days) to 172800 (2 days) and it still ran out of table slots.  This
change was made earlier today, a couple hours before the table filled
up.  The localhost traffic cited above is mostly udp traffic (complex
DNS stuff going on).  The server handles mail to/from the Internet, so
has a lot of short term connections.

From what I've read, increasing the size of the ip_conntrack table is
best done by powers of 2 -- is this still the case?  I calculated that
the current table size is roughly 40MB of non-swappable RAM, so I have
room to increase it if all else fails.

Thanks in advance,=20

Richard Wilson
EDS
richard dot wilson at eds dot com



