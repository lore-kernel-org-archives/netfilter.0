From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: What happened to ipt_physdev.c ?
Date: Sat, 25 Nov 2006 13:56:36 +0100
Message-ID: <45683D84.6030202@plouf.fr.eu.org>
References: <1164206481.456461916ec06@mail.third-rock.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1164206481.456461916ec06@mail.third-rock.net>
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
To: netfilter@lists.netfilter.org

Hello,

Paul Reilly a =E9crit :
> In recent kernels, 2.6.16.x   there is no longer any
>=20
> net/ipv4/netfilter/ipt_physdev.c

Yes, since 2.6.16 it was replaced by net/netfilter/xt_physdev.c.

> and no option in kernel config to enable CONFIG_NETFILTER_XT_MATCH_PHYS=
DEV

Yes there is. I just checked in vanilla 2.6.16 and 2.6.16.20.

> So I have no physdev in /proc/net/ip_tables_matches
> and my rules which include a -m physdev fail with:
>=20
> iptables: No chain/target/match by that name
>=20
> Has PHYSDEV been moved somewhere else?

Since 2.6.16 the corresponding module is named xt_physdev.ko and depends=20
on x_tables and bridge.

> How do I enable it?

Symbol: NETFILTER_XT_MATCH_PHYSDEV [=3Dm]
Prompt: "physdev" match support
   Defined at net/netfilter/Kconfig:282
   Depends on: NET && NETFILTER && NETFILTER_XTABLES && BRIDGE_NETFILTER
   Location:
     -> Networking
       -> Networking support (NET [=3Dy])
         -> Networking options
           -> Network packet filtering (replaces ipchains) (NETFILTER [=3D=
y])
             -> Core Netfilter Configuration
               -> Netfilter Xtables support (required for ip_tables)=20
(NETFILTER_XTABLES [=3Dm])

CONFIG_NETFILTER_XT_MATCH_PHYSDEV is located in the "Core Netfilter=20
Configuration" submenu and depends on CONFIG_NETFILTER_XTABLES=20
(Netfilter Xtables support) and CONFIG_BRIDGE_NETFILTER (Bridged IP/ARP=20
packets filtering) which depends on CONFIG_BRIDGE (802.1d Ethernet=20
Bridging).

