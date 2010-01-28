From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: fwmark & iptables
Date: Thu, 28 Jan 2010 14:35:00 +0100
Message-ID: <4B619284.5030905@plouf.fr.eu.org>
References: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>	 <4B6176A9.3030404@plouf.fr.eu.org> <fcfe0b071001280526t75cdc774x8d3a91497e8af2cf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fcfe0b071001280526t75cdc774x8d3a91497e8af2cf@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Matt Hakim a =E9crit :
>=20
>> Either select the source address in the application or SNAT/MASQUERA=
DE
>> on ppp0 for IPv4 traffic.
>=20
> Tried that. Worked outbound, but inbound I could only LOG the packets
> at mangle PREROUTING (I think),  and then they disappeared. No idea
> why.

=46orgot about that, sorry. Make sure sysctl net.ipv4.conf.ppp0.rp_filt=
er
is set to 0 after ppp0 is created, otherwise the packet is discarded at
the input routing decision stage. sysctl net.ipv4.conf.default.rp_filte=
r
contains the value that will be set for any new interface.
