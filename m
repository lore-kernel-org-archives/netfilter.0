From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: can single linux box with dual gateway provide two separate connection
 ?
Date: Tue, 08 Dec 2009 15:25:13 +0530
Message-ID: <4B1E2281.3040109@infoservices.in>
References: <4B1CCCFF.9080205@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B1CCCFF.9080205@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

J. Bakshi wrote:
> Hello list,
>
> This is not the traditional load-balancing or fail over technique whi=
ch
> I like to achieve through iptables but the objective is different.  I
> have 2 different ISP connections. The Linux server is presently using
> one ISP as well as do ip-forward to make it available for the LAN
> users.  I have achieved this by
>
> ` ` `
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> iptables -A FORWARD -i ${WAN_IFACE} -o ${LAN_IFACE} -s 192.168.0.0/24=
 -m \
> conntrack --ctstate NEW -j ACCEPT
> iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACC=
EPT
> iptables -A POSTROUTING -t nat -j MASQUERADE
> ` ` `
>
> cool. Now Some thing extra which I like to achieve. I like to put the
> second ISP too into the server and use the above style iptables to
> forward it to another lan card so that both the connection will be
> available *separately* from the same server. Obviously server can cho=
ose
> any one of these as its own gateway. Got the idea ? not a load-balanc=
ing
> setup but the server will act as two separate modem actually to provi=
de
> two connections. I have followed
>
>  http://www.generationip.com/documentation/network-documentation/93-h=
owto-setup-multi-default-gateway-on-linux
>
>
> to configure the routing tables for these two ISPs. Frankly telling y=
ou
> I have become a little confused now. Shall I now simply apply the abo=
ve
> iptable rules for the two connections or some thing more is required =
to
> achieve this ? Obviously I can continue doing experiment to know the
> answer but the server where I am working is acting as the default
> gateway;  hence my liberty is also restricted to do this very
> experiment.  could any one help me out to come out from this very
> confusing stage ?
> Thanks
>
>  =20

Any hints from anyone ?


--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

