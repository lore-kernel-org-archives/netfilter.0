From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 12:14:29 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110051214190.20695@frira.zrqbmnf.qr>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Netravali Ganesh <gnetravali@sonusnet.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-10-05 06:24, Netravali Ganesh wrote:

>Hi..
>
>I have multiple Ethernet =C2=A0interface on the system. I need to enab=
le the ssh on eth0 and block the ssh on all the other interfaces. Below=
 is the iptables rules I am using. This is not working form pls lls let=
 me know what is wrong. I am using RHEL6.1 system.

You don't seem to receive any such packets.

>
>=C2=A0[root@localhost ~]# iptables -A INPUT -i eth1 -p tcp -m tcp --dp=
ort 22 -j DROP
>=C2=A0[root@localhost ~]# iptables -L -v -n
>Chain INPUT (policy ACCEPT 40 packets, 5240 bytes)
>=C2=A0pkts bytes target=C2=A0=C2=A0=C2=A0=C2=A0 prot opt in=C2=A0=C2=A0=
=C2=A0=C2=A0 out=C2=A0=C2=A0=C2=A0=C2=A0 source=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destinatio=
n
>=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 0 DROP=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 tcp=C2=A0 --=C2=A0 eth1=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0.0.0.0/0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0.0.0.0/0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 tcp dpt:22
>
>Thanks
>Ganesh
>
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" i=
n
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

