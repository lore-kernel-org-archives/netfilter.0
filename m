From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rule for more than one target
Date: Thu, 26 Jan 2012 23:23:36 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201262323310.22535@frira.zrqbmnf.qr>
References: <CAMTjHrzUgXbHviHAYmaBZyTzV-pwXJYpOR4puWxgQ1WCf2TDYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrzUgXbHviHAYmaBZyTzV-pwXJYpOR4puWxgQ1WCf2TDYQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Usu=C3=A1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thursday 2012-01-26 21:12, Usu=C3=A1rio do Sistema wrote:

>Hello everyone, what I want is add an rule in my firewall with more
>than an destination target. for exemplo:
>
>/sbin/iptables -t mangle -I PREROUTING -s 10.10.10.10 -d !
>192.100.100.8 10.254.253.1 172.16.0.1  -j MARK --set-mark 5
>
>when I try add this rule appear
>
>Bad argument `10.254.253.1'
>Try `iptables -h' or 'iptables --help' for more information.
>
>I need add some "-d ! x y z ..."

http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.gener=
al/43488
