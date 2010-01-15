From: =?UTF-8?Q?Henno_T=C3=A4ht?= <henno.taht@diara.ee>
Subject: Re: Double NAT port forward
Date: Fri, 15 Jan 2010 14:06:42 +0200
Message-ID: <6bc5618e1001150406y1ae2b31akc04f5a7b1108c414@mail.gmail.com>
References: <6bc5618e1001141233k5cd1513fnbd5a41902aff12c6@mail.gmail.com> 
	<4B50552B.5090608@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B50552B.5090608@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Fri, Jan 15, 2010 at 13:44, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Consider using addresses in the special range 192.0.2.0/24 reserved f=
or
> examples and documentation instead of random addresses that are not
> allocated to you. See RFC 3330.

Thanks for the information!

> > root@pm-inner-gw:~# tshark -Nm -i eth0 host ! 192.168.1.1
> > Running as user "root" and group "root". This could be dangerous.
> > Capturing on eth0
> > =C2=A0 0.000000 1.1.1.1 -> 192.168.1.2 =C2=A0TCP 1271 > 222 [SYN] S=
eq=3D0
> > Win=3D65535 Len=3D0 MSS=3D1460
> > =C2=A0 0.439790 =C2=A0192.168.1.2 -> 1.1.1.1 ICMP Destination unrea=
chable (Host
> > unreachable)
>
> ICMP host unreachable usually indicates an ARP failure for the next h=
op
> address. What happens on INNER_GW's eth1 and HOST's eth0 (IP or ARP) =
?

Nothing happened. Complete silence.

But I got it working by specifying a larger subnet (27->24). And I'm
sure that INNER_GW's
internal interface and HOSTS IPs  weren't on different subnets. :-)
