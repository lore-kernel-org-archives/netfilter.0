From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables drops _some_ valid packets
Date: Tue, 19 Sep 2006 18:31:00 +0200
Message-ID: <45101B44.5060000@plouf.fr.eu.org>
References: <40fff57a0609190652n2dce5f49ie37ec04952d2d139@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <40fff57a0609190652n2dce5f49ie37ec04952d2d139@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello,

Daniel a =E9crit :
>=20
> Im having problems with iptables dropping some packets that belong to
> an established/valid connection.

If the kernel is >=3D 2.6.9 or includes the patch "tcp-window-tracking"=20
from the Netfilter patch-o-matic-ng, try to set the kernel parameter=20
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to 1.
See=20
http://www.netfilter.org/projects/patch-o-matic/pom-submitted.html#pom-su=
bmitted-tcp-window-tracking

