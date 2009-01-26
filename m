From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: --iif argument unrecognized by iptables
Date: Mon, 26 Jan 2009 10:57:14 +0100
Message-ID: <497D88FA.2060005@plouf.fr.eu.org>
References: <f8a02f3e0901251559q6324e3faqc75af6d16eba8038@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f8a02f3e0901251559q6324e3faqc75af6d16eba8038@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Andy Theuninck a =E9crit :
>=20
> # iptables -t mangle -A INPUT -d 192.168.1.2 -s !
> 192.168.1.0/255.255.255.0 -p udp --dport 500 -j ROUTE --iif eth0:1
> iptables v1.3.5: Unknown arg `--iif'
> Try `iptables -h' or 'iptables --help' for more information.

Maybe your iptables was build without the ROUTE support. What is the=20
output of :

iptables -j ROUTE -h

Unrelated to the error message, eth0:0 is not an interface name but an=20
IP alias label. Iptables rules require interface names such as eth0, no=
t=20
aliases.
