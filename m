From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: SYNPROXY *NAT/redirects etc.
Date: Tue, 23 Jun 2015 23:33:00 +0200
Message-ID: <5589D08C.1000601@plouf.fr.eu.org>
References: <e662686ca44f5edf617a50d78fa4444d@qasl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e662686ca44f5edf617a50d78fa4444d@qasl.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Ruppert <idl0r@qasl.de>
Cc: netfilter@vger.kernel.org

Christian Ruppert a =E9crit :
>=20
> I noticed that neither *NAT nor redirects will work when using the=20
> SYNPROXY module with e.g. those settings:
> net.netfilter.nf_conntrack_tcp_loose=3D0
> sysctl -w net.ipv4.tcp_syncookies=3D1
> sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0
> sysctl -w net.ipv4.tcp_timestamps=3D1
>=20
> iptables -t raw -I PREROUTING -p tcp -m tcp --syn -j CT --notrack

This rule disables connection tracking which is required for stateful
NAT operation.

> iptables -I INPUT -p tcp -m tcp -m conntrack --ctstate INVALID,UNTRAC=
KED=20
> -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
> iptables -A INPUT -m conntrack --ctstate INVALID -j DROP


