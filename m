From: "Fabricio Veloso" <fabricio_veloso@yahoo.com.br>
Subject: ip_conntrack_core
Date: Thu, 14 Nov 2002 10:50:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005701c28be4$e1023da0$0207a8c0@FVeloso>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

What is this?

ip_conntrack_core.c: In function `ip_conntrack_init':
ip_conntrack_core.c:1118: `ip_conntrack_sysctl_header' undeclared (first
use in this function)
ip_conntrack_core.c:1118: (Each undeclared identifier is reported only
once
ip_conntrack_core.c:1118: for each function it appears in.)
ip_conntrack_core.c:1118: `ip_conntrack_root_table' undeclared (first
use in this function)
make[2]: *** [ip_conntrack_core.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.19/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.19/net'
make: *** [_mod_net] Error 2

Thanks

Fabr=3DEDcio Veloso
S=3DE3o Paulo - Brazil

_______________________________________________________________________
Yahoo! Encontros
O lugar certo para encontrar a sua alma g=EAmea.
http://br.encontros.yahoo.com/

