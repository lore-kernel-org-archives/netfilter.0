From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ignorance about combining two net connections
Date: Sun, 14 Oct 2007 15:57:00 +0200
Message-ID: <4712202C.9060301@plouf.fr.eu.org>
References: <20071014123703.GA30106@crowfix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071014123703.GA30106@crowfix.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

felix@crowfix.com a =E9crit :
[...]
> For instance, I know that when a client connects to a
> remote server's port 25, when the server accept()s the connection, it
> assigns a new temporary port to that connection.

Huh ? What are you talking about ? Aren't you confusing with FTP ?

> Suppose I have an iptables rule which sends all outgoing traffic with
> a destination port of 25 down the static pipe.

You need more thant a simple iptables rule. Iptables will just mark the=
=20
packets and do some NAT if required, you need also advanced routing to=20
route marked packets through the proper interface. See the LARTC howto.=
=20
Do not forget to disable source address validation (rp_filter).

[cut irrelevant stuff]
> Incoming to the local SMTP server doesn't need any attention, right?

Reply traffic of incoming connections must be routed through the same=20
ISP, because the other ISP may consider it as IP spoofing and drop it.=20
This also requires advanced routing.
