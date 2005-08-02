From: "J.T. Moore" <jtmoore@international-auto.com>
Subject: Re: DNAT pptp to windows machine
Date: Tue, 2 Aug 2005 17:35:58 -0400
Message-ID: <04a101c597aa$2db2bc50$1500a8c0@domain.internationalauto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

You will need to DNAT inbound traffic to TCP port 1723 and the GRE
protocol (IP Protocol 47). Any nat or conntracking of GRE requires the
PPTP connection tracking and NAT helper patch for iptables and kernel
pacth from the iptables patch-o-matic next generataion (pom-ng) extra's
repository. This patch was recently broken on 2.6.11 and newer kernels,
but the latest notes in netfilter-svn say that its been fixed and will =
work=20
on 2.6.11 and newer.

Your safest bet is to install poptop on the firewall machine. If you =
want
to poptop use and/or require mppe encryption, I suggest using the=20
dkms rpm packages to patch the kernel if your distro supports rpms
so that you want have to manually patch the kernel or rebuild the =
modules
everytime a new kernel is released.

All of the poptop and dkms packages can be found on source forge
at: http://sourceforge.net/projects/poptop/

J.T.
