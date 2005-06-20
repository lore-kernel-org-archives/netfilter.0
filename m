From: "Gary W. Smith" <gary@primeexalia.com>
Subject: NAT_FTP and ipsec
Date: Mon, 20 Jun 2005 10:30:25 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829073E1@pxtbenexd01.pxt.primeexalia.com>
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

Hello,=20

I ran into a weird error today and was wondering if there was any
workaround for it.  I have two networks connected via IPSEC (Openswan)
which has been working great for some time.  All of the remote nodes can
access the main network just fine (including FTP).  Between the nodes
and the primary network, iptables is set to allow all traffic
unrestricted.  The nodes and the primary network all use internal IP's.

From a Linux box on the remote node I can FTP to my workstation and pull
files.  But when I try to pull files from that Linux box from my
workstation I have been receiving "ftp: connect: No route to host".  I
have been looking at both firewalls in question and they both have
ip_conntrack_ftp and ip_nat_ftp loaded. =20

The firewall on the main network is showing "kernel: FTP_NAT: partial
Packet 1842323491/17 in 35830/35905"

Some articles that I pulled up basically said it is because IPSEC
doesn't play well with iptables.  But I haven't had any other problems.

Both firewalls are running RHEL 4.  The kernel has been patched to
include a fix for IPSEC (for a race condition which caused kernel
panics) and pptp-conntrack.

Any ideas?

Gary Smith
