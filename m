From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables not forwarding port 443
Date: Wed, 07 Jul 2010 17:00:38 +0200
Message-ID: <4C349696.2030807@plouf.fr.eu.org>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C349458.6010202@plouf.fr.eu.org> <BAY145-w34B5B06EDA4912362F831AF3B30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-w34B5B06EDA4912362F831AF3B30@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Webster" <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

(Please don't top post)

J. Webster a =E9crit :
> So, change it to this?
> -A PREROUTING -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -j DNAT --t=
o-ports 1194

man iptables. DNAT expects "--to-destination <address>:<port>".

> I had udp open as I was planning to change the vpn to udp in the near=
 future.

AFAICS you don't have UDP open in your filter rules, you just redirect
it (useless as it will be dropped).
