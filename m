From: "Gary Smith" <gary@primeexalia.com>
Subject: Problem compiling TARPIT into kernel
Date: Fri, 22 Oct 2004 09:44:50 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <21245695958BF041875A6C39D08F9EBA1C3C02@vjo-mails-03.primeexalia.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
=20
I've been trying to get the TARPIT module to compile into RHEL3 with =
iptables 1.2.8 using patch-o-matic-20031219.  There seems to be a call =
to a function ip_route_output which doesn't exist.  I've looked around =
the list and haven't been able to find anything pertaining to this (BTW, =
is there a searchable list?).
=20
I did a make mrproper, make menuconfig, make and then finally a make =
modules (which is where the error occured.
=20
Here is the specific error:
ipt_TARPIT.c: In function `tarpit_tcp':
ipt_TARPIT.c:182: warning: implicit declaration of function =
`ip_route_output'
ipt_TARPIT.c:192: structure has no member named `pmtu'
make[2]: *** [ipt_TARPIT.o] Error 1
make[2]: Leaving directory =
`/usr/src/linux-2.4.21-20.EL/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.21-20.EL/net'
=20
Any help would be greatly appriciated.
=20
Gary Smith

