From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Compile error rtsp
Date: Sat, 8 Jul 2006 08:10:06 +0200 (CEST)
Message-ID: <1123.10.0.1.3.1152339006.squirrel@webmail.sterenborg.info>
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

Hi,

I'm getting a compile error when compiling kernel 2.6.17.3, patched with
pom-ng-20060707, with RTSP as a module.

Now, I'm not a programmer and I don't know how to solve this. Looking aro=
und
for "ip_nat_rtsp.c:368" I saw only a few posts without an answer..

Is there someone who can help me getting this right?


Thanks,
Rob

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  CC [M]  net/ipv4/netfilter/ip_nat_rtsp.o
net/ipv4/netfilter/ip_nat_rtsp.c: In function `rtsp_mangle_tran':
net/ipv4/netfilter/ip_nat_rtsp.c:167: warning: implicit declaration of
function `ip_conntrack_change_expect'
net/ipv4/netfilter/ip_nat_rtsp.c: In function `expected':
net/ipv4/netfilter/ip_nat_rtsp.c:368: error: storage size of `mr' isn't k=
nown
net/ipv4/netfilter/ip_nat_rtsp.c:368: warning: unused variable `mr'
net/ipv4/netfilter/ip_nat_rtsp.c: In function `help_out':
net/ipv4/netfilter/ip_nat_rtsp.c:411: error: structure has no member name=
d `seq'
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: `ct' undeclared (first use i=
n
this function)
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: (Each undeclared identifier =
is
reported only once
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: for each function it appears=
 in.)
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: incompatible type for argume=
nt 2
of `rtsp_mangle_tran'
net/ipv4/netfilter/ip_nat_rtsp.c:431: warning: passing arg 3 of
`rtsp_mangle_tran' from incompatible pointer type
net/ipv4/netfilter/ip_nat_rtsp.c:431: warning: passing arg 4 of
`rtsp_mangle_tran' from incompatible pointer type
net/ipv4/netfilter/ip_nat_rtsp.c:431: warning: passing arg 5 of
`rtsp_mangle_tran' makes integer from pointer without a cast
net/ipv4/netfilter/ip_nat_rtsp.c:431: error: too many arguments to functi=
on
`rtsp_mangle_tran'
net/ipv4/netfilter/ip_nat_rtsp.c: At top level:
net/ipv4/netfilter/ip_nat_rtsp.c:450: error: parameter `ct_rtsp_info' has=
 just
a forward declaration
net/ipv4/netfilter/ip_nat_rtsp.c:449: error: parameter `ctinfo' has just =
a
forward declaration
net/ipv4/netfilter/ip_nat_rtsp.c:448: error: parameter `pskb' has just a
forward declaration
net/ipv4/netfilter/ip_nat_rtsp.c: In function `help':
net/ipv4/netfilter/ip_nat_rtsp.c:462: error: too many arguments to functi=
on
`help_out'
net/ipv4/netfilter/ip_nat_rtsp.c:454: warning: unused variable `tcph'
net/ipv4/netfilter/ip_nat_rtsp.c:455: warning: unused variable `datalen'
net/ipv4/netfilter/ip_nat_rtsp.c: In function `fini':
net/ipv4/netfilter/ip_nat_rtsp.c:475: error: 	p_nat_rtsp_hook' undeclared
(first use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c: In function 	nit':
net/ipv4/netfilter/ip_nat_rtsp.c:483: error: 	p_nat_rtsp_hook' undeclared
(first use in this function)
net/ipv4/netfilter/ip_nat_rtsp.c: At top level:
net/ipv4/netfilter/ip_nat_rtsp.c:65: warning: `ports' defined but not use=
d
net/ipv4/netfilter/ip_nat_rtsp.c:69: warning: `num_ports' defined but not=
 used
net/ipv4/netfilter/ip_nat_rtsp.c:367: warning: `expected' defined but not=
 used
make[3]: *** [net/ipv4/netfilter/ip_nat_rtsp.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2



