From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: loopback between tun and eth
Date: Fri, 10 May 2013 11:28:54 +0200
Message-ID: <518CBDD6.4060407@plouf.fr.eu.org>
References: <CAODtcdeizmjL37M_E+bYckJQtz+UE=QDXOfpwfcGdy1O51pGNg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAODtcdeizmjL37M_E+bYckJQtz+UE=QDXOfpwfcGdy1O51pGNg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Al Grant <bigal.nz@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Hello,

Al Grant a =E9crit :
>=20
> I have a QNAP NAS which I have setup as a OpenVPN server. The NAS is
> behind a modem/router which is also the gateway to the internet.
>=20
> I have a routed OpenVPN connection to the QNAP NAS.
>=20
> The QNAP subnet is 10.1.1.0
> The OpenVPN subnet is 10.8.0.0
> My LAN (client) is 192.168.150.0
>=20
> In the router on the VPN server LAN I have a static route for 10.8.0.=
0
> to 10.1.1.2 (QNAP NAS IP and also OpenVPN IP) - so there is a return
> path so to speak for clients on the remote lan when accessed by VPN
> clients.
>=20
> The strange issue is that when I connect to the remote LAN I can
> connect to all remote clients using the remote LAN subnet addresses
> (10.1.1.0) *except* for the QNAP iteself (10.1.1.2).

Maybe the filtering rules in the INPUT chain on the NAS do no allow
packets received on the tun interface with a destination address other
than the address of the tun interface.

> Apparently this behavious is due to no loopback connection between th=
e
> tun and eth (someone suggested QNAP did this by design, but I dont
> know why).

Sounds like bullshit. There is no such thing as a "loopback connection"
between network interfaces in the Linux kernel.

> Anyway, the question is - is there a way using iptables I can fix thi=
s
> loopback problem so I can access the QNAP/OpenVPN server on its remot=
e
> LAN IP? (10.1.1.2)

Please post the iptables ruleset on the NAS, preferably with
iptables-save or iptables -S if the former is not available.
