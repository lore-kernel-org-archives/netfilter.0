From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Redirecting ports in a bridge
Date: Wed, 23 Apr 2008 17:24:28 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804231722570.13697@fbirervta.pbzchgretzou.qr>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480888CE.3080400@juntadeandalucia.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Javier_Prieto_Mart=C3=ADnez?= <javier.prieto.ext@juntadeandalucia.es>
Cc: netfilter@vger.kernel.org


On Friday 2008-04-18 13:41, Javier Prieto Mart=C3=ADnez wrote:

> I need the bridge because the appliance is supposed to be totally
> trasparent to the network, as its main use is logging traffic.

Often layer-2 transparency is not needed, but what do I know.
If you just log layer-3 (IP addrs) and up without caring about
MAC addresses, make a standard routing setup, i.e.
192.168.1.0/22 on eth0, 192.168.2.0/22 on eth1, and
enable forwarding; kinda like that.
And let hosts use 192.168.1.1/192.168.2.1 as a default gw
(as they already should do).
