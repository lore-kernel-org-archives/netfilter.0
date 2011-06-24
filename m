From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Conntracking on a multihomed server
Date: Fri, 24 Jun 2011 19:37:55 +0200
Message-ID: <4E04CB73.8020609@plouf.fr.eu.org>
References: <4E04BEE9.5030603@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E04BEE9.5030603@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>

Hello,

G=E1sp=E1r Lajos a =E9crit :
>=20
> - The client initiates a connection to the firewall public IPs (in a=20
> round-robin manner).
> - The service sees a connection that came from a lan. (Remember that =
is=20
> not bound to any interface.)
> - The service reply with the corresponding local IP of the firewall.
> - The client drops the packets because they are not from the expected=
=20
> public IPs.
>=20
> How can I make it work?

By fixing the broken client, service or application protocol.
Either the application protocol specification states that :
- the service should reply with the same address (and the service is
broken),
- or the service may reply with any address (and the client is broken),
- or it is left unspecified (and the protocol is broken).

UDP deals with independent datagrams. It does not have such notions as
"request", "reply", or "connection".

> Is it a conntracking, routing or IP stack problem?

Neither. It is an application layer problem.
