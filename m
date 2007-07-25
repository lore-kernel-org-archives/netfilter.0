From: =?ISO-8859-1?Q?=22Thomas_B=2E_Preu=DFer=22?=
 <tp14@inf.tu-dresden.de>
Subject: Problems with Kernel 2.6.22.1
Date: Wed, 25 Jul 2007 09:34:26 +0200
Message-ID: <46A6FD02.6050805@inf.tu-dresden.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

having updated my kernel from 2.6.19.2 to 2.6.22.1 both taken as vanilla
source from kernel.org, I now receive errors when trying to insert rules
using the state or conntrack modules. I expect other extensions to fail
as well. The produced error messages suggest some incompatibility
between the kernel and the userspace iptables:

# iptables -v -A FORWARD -j ACCEPT -m state --state RELATED,ESTABLISHED
ACCEPT  all opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  state
RELATED,ESTABLISHED
iptables: Invalid argument

# iptables -v -A FORWARD -j ACCEPT -m conntrack --ctstate
RELATED,ESTABLISHED
ACCEPT  all opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  ctstate
RELATED,ESTABLISHED
iptables: Invalid argument

This problem occurs with both the iptables v1.3.6 coming with Debian and
a self-compiled iptables v1.3.8 from the netfilter.org download page.

Is any such issue known? May there be any non-automatic dependencies in
the kernel configuration going beyond:

CONFIG_NETFILTER_NETLINK=y
CONFIG_NF_CONNTRACK_ENABLED=y
CONFIG_NF_CONNTRACK=y
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
CONFIG_NETFILTER_XT_MATCH_STATE=y

Thanks,
Thomas
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGpvz/0Kh0pbgr4w8RAnf+AJwJBl7c1IggMMi0SotiqOpJg5c62QCfThRM
M6sXBxEVroOKyQPUAvxx1VM=
=0lyq
-----END PGP SIGNATURE-----

