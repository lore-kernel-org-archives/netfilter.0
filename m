From: "Gary W. Smith" <gary@primeexalia.com>
Subject: PPTP through question
Date: Tue, 16 Nov 2004 20:01:14 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0197D9@pxtvjoexd01.pxt.primeexalia.com>
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

Hello,

We just replace an old solid state firewall with a new RHEL3 firewall
running iptables 1.2.11.  We compiled config_ip_nf_pptp in the kernel.
Everything appears to be fine and stable with the exception of a small
problem with PPTP clients.  With the old firewall the PPTP works fine.
Addresses are NAT'd into a private 192.168.0.x range.  With the new
firewall in place several of the clients get dropped after exactly two
minutes.  These clients are behind multiple different types of
firewalls.

Earlier this week I had a problem with local routing of external IP
accesses.  I've resolved that.  But I'm not sure if this has anything to
do with the two minute cutoff or if it's something independent of the
routing.  (ROUTING INCLUDED BELOW)

Also, I have loaded these modules listed below.  It doesn't matter if I
include ip_conntrack_pptp or not.  We still have the same problem. =20

/sbin/modprobe iptable_nat
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ip_conntrack

#/sbin/modprobe ip_conntrack_proto_gre
#/sbin/modprobe ip_conntrack_pptp
/sbin/modprobe ip_nat_proto_gre
/sbin/modprobe ip_nat_pptp
/sbin/modprobe ip_conntrack_irc
/sbin/modprobe ip_nat_irc
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_conntrack_mms
#/sbin/modprobe ip_nat_mms
/sbin/modprobe ipt_LOG
/sbin/modprobe ip_gre
/sbin/modprobe ipt_TARPIT

[0:0] -A PREROUTING -d 206.53.45.51 -j DNAT --to-destination
192.168.0.51
[0:0] -A PREROUTING -d 206.53.45.52 -j DNAT --to-destination
192.168.0.52
...
[0:0] -A PREROUTING -d 206.53.45.62 -j DNAT --to-destination
192.168.0.62
#Outgoing Maps (2 per IP - 1 local translation 1 remote)
[0:0] -A POSTROUTING -d 192.168.0.51 -j SNAT --to-source 206.53.45.51
[0:0] -A POSTROUTING -d 192.168.0.52 -j SNAT --to-source 206.53.45.52
...
[0:0] -A POSTROUTING -d 192.168.0.62 -j SNAT --to-source 206.53.45.62
[0:0] -A POSTROUTING -o eth0 -j SNAT --to-source 206.53.45.50
#************************************************************
[0:0] -A OUTPUT -d 192.168.0.51 -j DNAT --to-destination 206.53.45.51
[0:0] -A OUTPUT -d 192.168.0.52 -j DNAT --to-destination 206.53.45.52
...
[0:0] -A OUTPUT -d 192.168.0.62 -j DNAT --to-destination 206.53.45.62
