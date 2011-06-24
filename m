From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Conntracking on a multihomed server
Date: Fri, 24 Jun 2011 19:27:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106241925440.28194@frira.zrqbmnf.qr>
References: <4E04BEE9.5030603@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E04BEE9.5030603@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>


On Friday 2011-06-24 18:44, G=C3=A1sp=C3=A1r Lajos wrote:
>
> So, I am running an UDP service ON the firewall. (It is not bound to =
any
> specific interface.)

bind(2) controls binding to a particular socket address (does not have
much to do with interfaces).

> As I see:
> - The client initiates a connection to the firewall public IPs (in a
> round-robin manner).
> - The service sees a connection that came from a lan. (Remember that =
is not
> bound to any interface.)
> - The service reply with the corresponding local IP of the firewall.

Then your service program is faulty. It should reuse the socket address
that was used to contact it in the first place.
