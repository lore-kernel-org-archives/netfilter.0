From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Transparent proxy with IPv6 on Linux [REDIRECT target is gone]
Date: Mon, 04 Apr 2011 08:28:50 +0200
Message-ID: <4D996522.4050705@univ-nantes.fr>
References: <4D995361.9030301@gmail.com>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D995361.9030301@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Brian G <unixman83@gmail.com>
Cc: netfilter@vger.kernel.org

Le 04/04/2011 07:13, Brian G a =E9crit :
> Hi, on Linux with netfilter: previously I could do "iptables -j=20
> REDIRECT" to create a IPv4 transparent proxy. However, this is=20
> unsupported on IPv6.
>
> How can I achieve this? iptables6 removed the REDIRECT target because=
=20
> it does not support Network Address Translation in IPv6.
>
> I need the transparent proxy to work with IPv6 under Linux. How are=20
> people doing this?
>
> - Brian
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Hi,

you need at least, a 2.6.37 kernel with the tproxy module:
CONFIG_NETFILTER_TPROXY=3Dm
CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
and the last iptables release:

root@test-jp-2:~# ip6tables -t mangle -nvL
Chain PREROUTING (policy ACCEPT 5584 packets, 416K bytes)
  pkts bytes target     prot opt in     out     source              =20
destination
    60  4400 DIVERT     tcp      *      *       ::/0                =20
::/0                 socket
     0     0 TPROXY     tcp      *      *       ::/0                =20
::/0                 tcp dpt:80 TPROXY redirect :::50080 mark 0x1/0x1

Regards.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

