From: Lopsch <lopsch@lopsch.com>
Subject: error compiling ipt_connlimit.c
Date: Thu, 18 Nov 2004 21:30:52 +0100
Message-ID: <419D067C.70206@lopsch.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

Is connlimit from patch-o-matic-ng-20041114 incompatible with the kernel=20
version 2.6.9? I=B4m getting this error:

net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
net/ipv4/netfilter/ipt_connlimit.c:100: error: structure has no member=20
named `infos'
net/ipv4/netfilter/ipt_connlimit.c:107: error: structure has no member=20
named `infos'
make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

I think it=B4s because of the changing in the structures in the conntrack=
=20
as of 2.6.9. Any ideas to solve the problem?


