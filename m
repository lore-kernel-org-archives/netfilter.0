From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: TTL target
Date: 03 Nov 2002 13:35:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036326932.9037.1.camel@elendil>
References: <31347F3CE518D6118ACB00A0246AD0560B23FE@mx.snizek.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <31347F3CE518D6118ACB00A0246AD0560B23FE@mx.snizek.ch>
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
To: mailinglists@belfin.ch
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Le ven 01/11/2002 =E0 13:46, mailinglists@belfin.ch a =E9crit :
> + iptables -t mangle -A PREROUTING -i eth1 -j TTL --ttl-inc 1
> iptables: No chain/target/match by that name
> modprobe ipt_ttl is in my script.
> According to=20
> http://cert.uni-stuttgart.de/archive/usenet/comp.os.linux.security/2002=
/08/m
> sg00458.html
> there should be two ttl modules in
> /lib/modules/2.4.18-4GB/kernel/net/ipv4/netfilter/.
> ipt_TTL for the target
> ipt_ttl for matching.
> ipt_TTL isnt in the modules directory.
[...]
> System is Suse 8.0, Kernel 2.4.18, iptables 1.2.25

You have to build your kernel and last iptables version (1.2.7a) using
patch-o-matic. TTL target is not yet part of mainstream.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

