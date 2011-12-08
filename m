From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: Sending ICMP echo request out
Date: Thu, 08 Dec 2011 23:59:04 +0400
Message-ID: <1323374344.5818.1.camel@hakkenden.homenet>
References: <CAGZFCEEux4TBE+JAqzx9CDJ1HGdNXnqQBHBxhJ8TXEQh3Zq7_w@mail.gmail.com>
	 <CAHGPgw1bL7XF6Ef29N_YQ-dAW3RYQe7j4-2zuWhFXQddW+Yg_g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-newbie-owner@vger.kernel.org>
In-Reply-To: <CAHGPgw1bL7XF6Ef29N_YQ-dAW3RYQe7j4-2zuWhFXQddW+Yg_g@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: anil dahiya <anildahiya80@gmail.com>
Cc: linux-newbie <linux-newbie@vger.kernel.org>, Netfilter mailing list <netfilter@vger.kernel.org>, linux-net@vger.kernel.org

=D0=92 =D0=9F=D1=82., 09/12/2011 =D0=B2 00:00 +0530, anil dahiya =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> Hi ,
>=20
> I have following setup with routing table as shown below:
>=20
> +-----------------------+
> |    System-1      |
> |     "client"         |
> |------------------------|
> |  192.168.11.5   |
> +----------------------+
>        |
>        |
> +------+-----+
> |   Switch   +----------------------+
> +------+-----+                        |
>        |                                 |
>        |                       +-------------------------+
>        |                        |  192.168.11.1      |
>        |                        |---------------------------|
>        |                        |     Router            |
>        |                        |-------------------------- |
>        |                        |   192.168.12.1     |
>        |                       +--------------------------+
>        |                                    |
>        |                                    |
> +------------------------+                |
> |  192.168.11.6      |                |
> |--------------------------|                |
> |   System-2        |                |
> |--------------------------|                |
> |   192.168.12.6    |                |
> |                          |----------------+
> +------------------------+
>=20
> Routing table details of setup
> ------------------------------------------
> System-1
> -----
> $route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    U=
se Iface
> 192.168.11.0    0.0.0.0         255.255.255.0   U     1      0       =
 0 eth1
> 0.0.0.0         192.168.11.1    0.0.0.0         UG    0      0       =
 0 eth1
>=20
>=20
> Router
> -----------
> $route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    U=
se Iface
> 192.168.12.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth1
> 192.168.11.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth0
>=20
>=20
> System-2
> ------
> $route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    U=
se Iface
> 192.168.12.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth1
> 192.168.11.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth0
> 0.0.0.0         192.168.12.1    0.0.0.0         UG    0      0       =
 0 eth1
>=20
>=20
> When I do ping from system-1 192.168.11.5 to system-2 192.168.12.6 ,
> ping echo packet is reaching on system-2 through NIC 192.168.12.6 but
> system is not sending any response to 192.168.11.5 using either of NI=
C
> i.e 192.168.11.6 or 192.168.12.6 ? Why this is happening ? Can you
> help me ?
>=20
> I have observed same type of symtoms when I do SSH from 192.168.11.5
> to 192.168.12.6
>=20
> FYI,
> ip_forwarding is enable on router and iptables are no configured on
> any of system .

I think, reverse path filtering is the problem here.

>=20
> Thanks,
> Anil
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe linux-newbie"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
