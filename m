From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: eth - NAT - Bridge - veth
Date: Fri, 27 Jun 2014 19:51:35 +0200
Message-ID: <53ADAF27.5070505@plouf.fr.eu.org>
References: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>	<53AD4B1F.1000705@plouf.fr.eu.org> <CALPbv1-ur2xyv9MUe4UWR1ZeGZwaqgA40-J-8+H_vC58ie20bw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv1-ur2xyv9MUe4UWR1ZeGZwaqgA40-J-8+H_vC58ie20bw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vijay Viswanathan <vijay.vishy@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Vijay Viswanathan a =E9crit :
> I cannot use the host network for container/veth IPs, so it looks lik=
e
> I need a NAT.

Indeed.

Enable IP forwarding on the host (sysctl net.ipv4.ip_forward=3D1).
Set default route in the container (seems to be set already).
Set port forwarding (DNAT) on the host to the container.

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 2300 \
  -j DNAT --to 192.168.10.2:2300

Optionally, set masquerading (SNAT) on the host for the containers.

iptables -t nat -A POSTROUTING -o eth1 -s 192.168.10.0/24 \
  -j MASQUERADE

