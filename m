From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Reject non-ipsec traffic
Date: Wed, 20 Jul 2011 21:56:01 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Ryan Whelan <rcwhelan@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2011-07-20 21:20, Ryan Whelan wrote:

>I have IPSec setup between 2 hosts and would like to stop all
>inter-host traffic thats not secured with IPSec (They have a GRE
>tunnel between them, and I want to be sure the GRE traffic fails to
>transmit if the IPSec daemon fails)
>
>iptables -A OUTPUT -p udp --dport 500 -d hostB.example.com -j ACCEPT
>iptables -A OUTPUT -p tcp --dport 500 -d hostB.example.com -j ACCEPT
>iptables -A OUTPUT -p esp -d hostB.example.com -j ACCEPT
>iptables -A OUTPUT -d hostB.example.com -j REJECT
>
>The reject rule is rejecting all traffic to that host[...]
>If i remove that rule, everything works and i
>see the packets get counted on the ESP protocol rule.=C2=A0 I thought =
the
>rules were processes in order until a match was found. Clearly I'm
>wrong.

They are indeed processed in order, and until a match is found --
and match _was_ found (packet which has dst=3DhostB, which is not
ESP, and which does not have tcpudp-500 in its headers).

A `ping hostB` would match the criteria of this 4th rules, as would
opening http://hostB.example.com in a browser, for example.
