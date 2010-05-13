From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 22:09:16 +0200
Message-ID: <4BEC5C6C.1010704@plouf.fr.eu.org>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr> <hsheni$h51$1@dough.gmane.org> <hshf8e$jpn$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hshf8e$jpn$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org

Hello,

Markus Feldmann a =E9crit :
> So NEW means the IP was never seen before and the SYN flag means, tha=
t a=20
> new connection begins? So the first packet from a source adress is NE=
W=20
> whether or nor it has the SYN flag set ?

Not exactly. The connection tracking works per connection, not per
source address. NEW means that the packet belongs to a connection that
was not seen by the connection tracking before. SYN (without RST nor
ACK) means that the packet purpose is to start a new TCP connection, bu=
t
it could be a duplicate SYN for an already established connection.

> If this is the case, than i need only the SYN flag to let establish=20
> incoming connection to my apache-Server?

It depends on your needs.
