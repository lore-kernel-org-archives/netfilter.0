From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: iptables not forwarding port 443
Date: Thu, 8 Jul 2010 19:34:33 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007081934260.7962@obet.zrqbmnf.qr>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C349458.6010202@plouf.fr.eu.org> <BAY145-w34B5B06EDA4912362F831AF3B30@phx.gbl>,<4C349696.2030807@plouf.fr.eu.org> <BAY145-w825259CF116567A201C97F3B30@phx.gbl>,<4C34A25D.4090704@plouf.fr.eu.org>
 <BAY145-w46F9DB792CC508DC7A0843F3B40@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-w46F9DB792CC508DC7A0843F3B40@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Webster" <webster_jack@hotmail.com>
Cc: pascal.mail@plouf.fr.eu.org, netfilter@vger.kernel.org

On Thursday 2010-07-08 18:12, J. Webster wrote:

>
>Is it a postrouting issue?
>So,
>-A POSTROUTING -s 172.16.0.0/255.255.255.0 -o eth0 -j SNAT --to-source xx.xxx.xxx.199
>
>As an aside, when I open up iptraf, it gives me a network called lo, which I don't seem to be able to get rid of. I think I created it by accident a while back.


Haha, good one.
