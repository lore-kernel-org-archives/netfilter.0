From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: NAT and listen on random ports
Date: Sat, 20 Dec 2014 13:25:23 +0100
Message-ID: <54956AB3.9030809@plouf.fr.eu.org>
References: <CALPbv1-PYS25HSkMvCD_otVVd0iPpN9jBL+D2dh6GQCRJDeObA@mail.gmail.com>	<549497C1.2000103@plouf.fr.eu.org> <CALPbv1-=kdO+9J3EVgi_oGj0EmwY57WojwX0ZK2-EtQrcaix4A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv1-=kdO+9J3EVgi_oGj0EmwY57WojwX0ZK2-EtQrcaix4A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vijay Viswanathan <vijay.vishy@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Vijay Viswanathan a =E9crit :
> Thanks,
> 1) what about non-connection oriented ?
> 2) broadcast/multicast ( Upnp searches that need to go one extra hop
> if dlna is run on veth ? )

These are cases where the addresses and ports in the reply packet does
not match the ones in the original packet. In such case, the standard
conntrack (connection tracking) won't treat the reply packet as
belonging to the same connection as the original packet. The stateful
NAT relies on conntrack to tell which connection a packet belongs to in
order to apply the required mapping.

=46or any such protocols, a specific conntrack/NAT helper pair must be
written in order to allow them through NAT. Examples : SIP, H.323, TFTP=
=2E

