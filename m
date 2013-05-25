From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: IPTables - Going Stateless
Date: Sat, 25 May 2013 15:35:41 +0200
Message-ID: <51A0BE2D.3020105@plouf.fr.eu.org>
References: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>	<ACBD9B315535B2489252E981FF05808602C2A0A034@EDBCL19EX001.edb.local>	<CAGWRaZYbbKFeeRViAcbrV3LGv1s_fcbVk4qbcJjQKD4sy5i7uA@mail.gmail.com> <CAGWRaZZxhStfEHDVZrtzZvZxKH66DEZ0gL+hs0RUFPv2EtdWAg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGWRaZZxhStfEHDVZrtzZvZxKH66DEZ0gL+hs0RUFPv2EtdWAg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nick Khamis <symack@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Nick Khamis a =E9crit :
>=20
> # Set Log Limit
> LOGLIMIT=3D"2/s"
> LOGLIMITBURST=3D"10"
>=20
> $IPTABLES -A LOGINPUT -i $INTIF1 -p icmp -j LOG --log-prefix "ICMP
> LOGINPUTDROP: " --log-tcp-options --log-ip-options -m limit --limit
> $LOGLIMIT
>=20
> I am getting the following error: iptables: No chain/target/match by =
that name
> And it's due to the "limit" flag.
>=20
> lsmod
> Module                  Size  Used by
> xt_LOG                  6531  7
> ipt_REJECT              1917  6
> iptable_filter           988  1
> ip_tables               8370  1 iptable_filter
> e100                   28046  0

Looks like the "limit" match is not enabled in your kernel. Check
CONFIG_NETFILTER_XT_MATCH_LIMIT in your kernel config file.
