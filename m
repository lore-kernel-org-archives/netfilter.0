From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: simple netfilter machine redirection
Date: Mon, 17 Mar 2008 11:29:50 +0100
Message-ID: <47DE481E.3090804@plouf.fr.eu.org>
References: <200803162323.m2GNNXe3013255@dell2.home> <alpine.DEB.1.00.0803161825030.19487@p34.internal.lan> <47DDA102.4060607@netoyen.net> <200803170010.m2H0ABFV016415@dell2.home>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803170010.m2H0ABFV016415@dell2.home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marty Leisner <leisner@rochester.rr.com>
Cc: netfilter@vger.kernel.org

Hello,

Marty Leisner a =E9crit :
>=20
> Right, I don't want any NAT -- I just want it to act as a tcp port re=
layer
> (connection A-B is reflected on connection B-C)

Then you don't want to use iptables but a TCP relay such as socat or=20
6tunnel. However this can be done with iptables's NAT, as Mouss wrote.
