From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Conntrack and DNS
Date: Mon, 6 Feb 2006 09:09:33 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132CB5C7@mailbox.vikus.com>
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

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Carlos Pastorino
> Sent: Thursday, February 02, 2006 6:20 AM
> To: netfilter@lists.netfilter.org
> Subject: Fwd: Conntrack and DNS
>=20
>=20
> > My advice would be to have one, at the top, without specifiying the
> > interface. See if that solves the problem.
>=20
> I've done it, but it didn't work. I really haven't the foggiest idea
> about what must the problem be.
>=20
> I wonder if it could be the modules I'm executing (in this order):
>=20
> /sbin/modprobe ip_conntrack
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_ftp
> /sbin/modprobe ip_tables
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_REJECT
> /sbin/modprobe ipt_state
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_mangle
> /sbin/modprobe iptable_nat


As long as you load modules before running the rules, I wouldn't think
the order would be a problem.

> Or the processes:
>=20
> echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
> echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
> echo "1" > /proc/sys/net/ipv4/ip_forward
> echo "1" > /proc/sys/net/ipv4/tcp_syncookies
> echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
> echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
> echo "0" > /proc/sys/net/ipv4/conf/all/log_martians
> echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
>=20
> Thanks again,
>=20
> Pastorino
>=20

These I don't know much about. About the only direction I can point you
on this is conntrack. In your rules you allow any outbound DNS request
to 4 DNS servers. The second DNS reply should fall under
RELATED,ESTABLISHED, just like the first.

Sorry I can't be more help.

Derick Anderson

