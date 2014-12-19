From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: NAT and listen on random ports
Date: Fri, 19 Dec 2014 22:25:21 +0100
Message-ID: <549497C1.2000103@plouf.fr.eu.org>
References: <CALPbv1-PYS25HSkMvCD_otVVd0iPpN9jBL+D2dh6GQCRJDeObA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv1-PYS25HSkMvCD_otVVd0iPpN9jBL+D2dh6GQCRJDeObA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vijay Viswanathan <vijay.vishy@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hello,

Vijay Viswanathan a =E9crit :
> With MASQUERADE & DNAT
> Iam able to run servers on veth and be able to access network.
(...)
> Lot of protocols go out on random ports and listen on the same source=
 port .
> How do I achieve network access for protocols that goes out on random
> ports and listen on random ports ?

If the protocol is connection-oriented, i.e. packets in opposite
directions have swapped source/destination ports and addresses, then
conntrack handles the flow as a connection, so all you need is
MASQUERADE or SNAT.
