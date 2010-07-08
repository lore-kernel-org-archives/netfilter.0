From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables not forwarding port 443
Date: Thu, 08 Jul 2010 20:56:49 +0200
Message-ID: <4C361F71.7090402@plouf.fr.eu.org>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C349458.6010202@plouf.fr.eu.org> <BAY145-w34B5B06EDA4912362F831AF3B30@phx.gbl>,<4C349696.2030807@plouf.fr.eu.org> <BAY145-w825259CF116567A201C97F3B30@phx.gbl>,<4C34A25D.4090704@plouf.fr.eu.org> <BAY145-w46F9DB792CC508DC7A0843F3B40@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-w46F9DB792CC508DC7A0843F3B40@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Webster" <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

J. Webster a =E9crit :
> Is it a postrouting issue?

Only you can tell. You did not provide enough details.

> As an aside, when I open up iptraf, it gives me a network called lo,
> which I don't seem to be able to get rid of. I think I created it by
> accident a while back.

lo is the loopback interface used for network communication between
local processes. It is created by the IP stack at startup and AFAIK
cannot be removed. It can be deactivated, but be aware that this may
cause issues.
