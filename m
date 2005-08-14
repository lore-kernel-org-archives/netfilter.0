From: psihozefir <sorin.panca@gmail.com>
Subject: Errors patching connrate module (and others).
Date: Sun, 14 Aug 2005 12:28:05 +0300
Message-ID: <fdb0cf3905081402281e3c2f10@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hallo! Recently I made my first attempt to run patch-o-matic. I needed
the connrate module. I got the 2.6.12.4 vanilla linux kernel,
iptables-1.3.3 and patch-o-matic-ng-20050811 packages. I ran the runme
script with the `extra' option. First I tried to add connrate only and
I have the following error: cannot apply (3 rejects out of 4 hunks)
[ERROR (3 rejects out of 4 hunks)]. What does this error mean and in
what file can I try to fix it? I want to test this feature as the
author says it's working and needs tests. I also tried to add the
ctnetlink and nf_conntrack patches and they gave me similar errors
[ERROR (1 rejects out of 48 hunks) and cannot apply (1 rejects out of
16 hunks)] and their status are "Stable" and "Testing". Then I ran
patch-o-matic and I added all patches I thought I would need and I
forced the connrate patch. At compile time (as modules) I get these
errors:
for rtsp
net/ipv4/netfilter/ip_nat_rtsp.c: In function `rtsp_mangle_tran':
net/ipv4/netfilter/ip_nat_rtsp.c:167: warning: implicit declaration of
function `ip_conntrack_change_expect'
net/ipv4/netfilter/ip_nat_rtsp.c: In function `expected':
net/ipv4/netfilter/ip_nat_rtsp.c:368: error: storage size of `mr' isn't kno=
wn
net/ipv4/netfilter/ip_nat_rtsp.c:368: warning: unused variable `mr'
net/ipv4/netfilter/ip_nat_rtsp.c: In function `help_out':
net/ipv4/netfilter/ip_nat_rtsp.c:411: error: structure has no member named =
`seq'
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: `ct' undeclared (first
use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: (Each undeclared
identifier is reported only once
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: for each function it appears i=
n.)
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: incompatible type for
argument 2 of `rtsp_mangle_tran'
net/ipv4/netfilter/ip_nat_rtsp.c:431: warning: passing arg 3 of
`rtsp_mangle_tran' from incompatible pointer type
net/ipv4/netfilter/ip_nat_rtsp.c:431: warning: passing arg 4 of
`rtsp_mangle_tran' from incompatible pointer type
net/ipv4/netfilter/ip_nat_rtsp.c:431: warning: passing arg 5 of
`rtsp_mangle_tran' makes integer from pointer without a cast
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: too many arguments to
function `rtsp_mangle_tran'
net/ipv4/netfilter/ip_nat_rtsp.c: At top level:
net/ipv4/netfilter/ip_nat_rtsp.c:449: error: parse error before "enum"
net/ipv4/netfilter/ip_nat_rtsp.c:452: warning: function declaration
isn't a prototype
net/ipv4/netfilter/ip_nat_rtsp.c: In function `help':
net/ipv4/netfilter/ip_nat_rtsp.c:453: error: `pskb' undeclared (first
use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c:456: error: `ctinfo' undeclared
(first use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c:462: error: `ct_rtsp_info' undeclared
(first use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c:462: error: `exp' undeclared (first
use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c:462: error: too many arguments to
function `help_out'
net/ipv4/netfilter/ip_nat_rtsp.c:469: error: `ip_rtsp_lock' undeclared
(first use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c:454: warning: unused variable `tcph'
net/ipv4/netfilter/ip_nat_rtsp.c:455: warning: unused variable `datalen'
net/ipv4/netfilter/ip_nat_rtsp.c: In function `fini':
net/ipv4/netfilter/ip_nat_rtsp.c:476: error: `ip_nat_rtsp_hook'
undeclared (first use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c: In function `init':
net/ipv4/netfilter/ip_nat_rtsp.c:484: error: `ip_nat_rtsp_hook'
undeclared (first use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c: At top level:
net/ipv4/netfilter/ip_nat_rtsp.c:65: warning: `ports' defined but not used
net/ipv4/netfilter/ip_nat_rtsp.c:69: warning: `num_ports' defined but not u=
sed
net/ipv4/netfilter/ip_nat_rtsp.c:367: warning: `expected' defined but not u=
sed
make[3]: *** [net/ipv4/netfilter/ip_nat_rtsp.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2
(taking rtsp module out and rebuilding modules...)
in u32 and connrate modules:
  CC [M]  net/ipv4/netfilter/ipt_time.o
  CC [M]  net/ipv4/netfilter/ipt_random.o
  CC [M]  net/ipv4/netfilter/ipt_u32.o
net/ipv4/netfilter/ipt_u32.c: In function `match':
net/ipv4/netfilter/ipt_u32.c:130: warning: unused variable `origbase'
net/ipv4/netfilter/ipt_u32.c:133: warning: unused variable `end'
  CC [M]  net/ipv4/netfilter/ipt_connrate.o
net/ipv4/netfilter/ipt_connrate.c: In function `match':
net/ipv4/netfilter/ipt_connrate.c:35: error: structure has no member
named `rate'
make[3]: *** [net/ipv4/netfilter/ipt_connrate.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2
what files are missing?
thank you in advance for any idea!

