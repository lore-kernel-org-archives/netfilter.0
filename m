From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Packet Flags & ICMP errors
Date: 18 May 2003 10:35:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053246920.764.2.camel@elendil.intranet.cartel-securite.net>
References: <KOELJFLIIGOBCCBACPGBCEEHCAAA.cldavis@speakeasy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <KOELJFLIIGOBCCBACPGBCEEHCAAA.cldavis@speakeasy.net>
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
To: Christopher Davis <cldavis@speakeasy.net>
Cc: netfilter@lists.netfilter.org

Le dim 18/05/2003 =E0 05:27, Christopher Davis a =E9crit :
> I'm trying to setup an iptables rule to bounce back an icmp error
> message on a firewall if a packet is sent with the syn and fin flags
> only --
> =20
> A packet with SYN flag set only -- accept
> A packet with FIN flag set only -- accept
> A packet with SYN & FIN flag -- reject Is it possible to choose the
> error code?

Yes of course. See REJECT target :

root@elendil:~# iptables -j REJECT --help
iptables v1.2.7a
[...]
REJECT options:
--reject-with type              drop input packet and send back
                                a reply packet according to type:
Valid reject types:
    icmp-net-unreachable        ICMP network unreachable
    net-unreach                 alias
    icmp-host-unreachable       ICMP host unreachable
    host-unreach                alias
    icmp-proto-unreachable      ICMP protocol unreachable
    proto-unreach               alias
    icmp-port-unreachable       ICMP port unreachable (default)
    port-unreach                alias
    icmp-net-prohibited         ICMP network prohibited
    net-prohib                  alias
    icmp-host-prohibited        ICMP host prohibited
    host-prohib                 alias
    tcp-reset                   TCP RST packet
    tcp-reset                   alias

Then, you match packets using --tcp-flags and use appropriate reject
type for REJECT target.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

