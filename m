From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Correct Chains to Apply Rules
Date: Tue, 17 May 2011 23:29:03 +0200
Message-ID: <4DD2E89F.30801@plouf.fr.eu.org>
References: <1305666891.6262.1453014301@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305666891.6262.1453014301@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@buglecreek.com
Cc: netfilter@vger.kernel.org

Hello,

netfilter@buglecreek.com a =E9crit :
>=20
> In the following scenario.  Someone makes a new HTTP request from the
> Internet that is allowed inbound on eth0 and goes out of the eth1
> interface to the HTTP server in the server network.=20
> The HTTP server in the server network sends the response to the origi=
nal
> requester. =20
>=20
> Does the response ever hit the INPUT chain of ETH1?

No.

> Or does it immediately go to the FORWARD chain

Yes.

> and out the OUTPUT chain of eth0. =20

No.
The three filter chains are mutually exclusive : a packet can only go
through one of them. Forwarded packets only go through the FORWARD chai=
n.
