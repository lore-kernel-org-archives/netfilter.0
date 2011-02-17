From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to use DNAT
Date: Thu, 17 Feb 2011 21:05:08 +0100
Message-ID: <4D5D7F74.3090809@plouf.fr.eu.org>
References: <4D5D6D2C.7010109@dcc.ufba.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D5D6D2C.7010109@dcc.ufba.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org

Hello,

Italo Valcy a =E9crit :
>=20
> I'm in doubt about the correct use of DNAT, if I should use an alias
> interface (like eth0:0) with the original target IP address

Target ? Do you mean the original destination address ?

> or I should
> use something to advertise the arp-reply for that IP (like farpd).

As long as incoming packets reach the interface, it does not matter how=
=2E

> I'm asking this because when I tried to use the alias interface I've =
got
> *some* packages being processed by INPUT chain of the filter table...

Please provide some details about the rule, packets...
Note that iptables' NAT ignores packets in the INVALID state.
