From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Sun, 28 Nov 2010 19:59:18 +0100
Message-ID: <4CF2A686.4000309@plouf.fr.eu.org>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Secure-SIP-Server a =E9crit :
>=20
> I'm suffering on a Denial-of-Service attack on my SIP(VoIP) UDP port =
5060,=20
> getting more then 70 REGISTER requests per second since yesterday. Al=
l=20
> comming from the Japanese IP 59.146.75.111:5088.
[...]
> Now my 2nd question:
> How can this requests (UDP) be from a ESTABLISHED connection??? They =
passed=20
> the firewall in the first two examples and therefore they must be=20
> ESTABLISHED!?!

UDP being connectionless by nature, the notion of "UDP connection" is
rather loose. Therefore a continuous flow of packets with the same port=
s
and addresses can be considered as one sigle connection even if they ar=
e
actually unrelated requests.

> 3rd question:
> Is there a way to tell iptables to lock only a specific IP:PORT for a=
 while=20
> if this IP transmits more then 50 requests per second? If so, how?

Check the "recent" match. Be sure you read carefully the man page about
its default limits.
