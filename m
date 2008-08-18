From: devel@thom.fr.eu.org
Subject: Routing from ppp to ipsec tunnel
Date: Mon, 18 Aug 2008 19:24:19 +0200 (CEST)
Message-ID: <1289.10.211.10.2.1219080259.squirrel@mail.thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

I have two sites connected using an IPSEC Tunnel (Linux 2.6/KAME Tools)=
=2E
I can also have "roadwarriors" clients (Windows based) connect to eithe=
r
site using an L2TP/IPSEC tunnel.
I would like to know if it's possible to route packets from the
roadwarrior client (sent out through my ppp interface) through the inte=
r
site ipsec tunnel and back.
So far, the only way I could have this work was by SNATing the traffic
from my ppp network destined to the other site network to the local lan
interface address, but I'd rather not use SNAT to achieve this.

Anybody can help ?

Thanks

=46ran=E7ois

--=20


