From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: fwmark & iptables
Date: Thu, 28 Jan 2010 12:36:09 +0100
Message-ID: <4B6176A9.3030404@plouf.fr.eu.org>
References: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Matt Hakim a =E9crit :
> Hi,
> I want to mark packets for a particular user (iptables -t mangle -A
> OUTPUT -mowner --uid-owner rtorrent -j MARK --set-mark 1), and then
> route these packets to a VPN (ip rule add fwmark 1 lookup 200; ip
> route add default dev ppp0 table 200). Unfortunately, after I do this
> tcpdump shows that the default interfaces source address is being put
> out on the ppp0 link which I don't understand, as I would have
> expected the ppp0 interface address to be the source address.

The source address is selected before when the packet is created, befor=
e
it enters the OUTPUT chain and gets marked and then rerouted according
to the mark. Rerouting only updates the output interface and nexthop, i=
t
cannot update the source address.

> Any tips? I'll hack around in the source now see what i can find.

Either select the source address in the application or SNAT/MASQUERADE
on ppp0 for IPv4 traffic. The former is not always possible (applicatio=
n
does not allow it, or address is not fixed) and the latter is not
applicable to IPv6 as Linux has no IPv6 NAT and will hopefully never.

Couldn't there be a way to achieve proper source address selection,
maybe by the use of a "virtual" packet that would be sent through
iptables' OUTPUT chains and MARKed/DNATed as part of the source address
selection prior to sending the real packet ?
