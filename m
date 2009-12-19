From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Returning nat packets vanishing after mangle:PREROUTING and conntrack
   processing
Date: Sat, 19 Dec 2009 14:12:29 +0100
Message-ID: <4B2CD13D.504@plouf.fr.eu.org>
References: <7ad63010a18944d3264b5ba158c236df@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7ad63010a18944d3264b5ba158c236df@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Shambarger <scott-netfilter@shambarger.net>
Cc: netfilter@vger.kernel.org

Hello,

Scott Shambarger a =E9crit :
> I have a multi-homed server, and have been routing packets selectivel=
y
> between the public interfaces using iptables marking and iproute2 tab=
les.
[...]
> With the setup below, bringing down either public interface results i=
n
> normal conntrack behavior (packets are correctly nat'd back to their
> source).

It may be a source validation issue, which is common in multihomed
setups. If sysctl net.ipv4.conf.<input_interface>.rp_filter is set to 1=
,
does setting it to 0 fix the problem ?

[...]
> And that's where the packet dissappears... it apparently has been see=
n by
> conntrack, but fails to appear in the nat:PREROUTING chain.

AFAIK, only the first NEW packet of a connection appears in the nat
chains. Subsquent packets don't. If the packet does not appear in the
=46ORWARD nor INPUT chain, chances are it was dropped at the routing
decision stage, where source validation is performed.
