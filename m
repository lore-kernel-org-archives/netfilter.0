From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: bug in iptables-restore and "recent" module
Date: Mon, 16 Feb 2015 00:08:41 +0100
Message-ID: <54E126F9.6050609@plouf.fr.eu.org>
References: <20150215133147.6fb4589991419ad29180222a@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150215133147.6fb4589991419ad29180222a@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

richard lucassen a =E9crit :
> When using the "recent" module and when the hitcount max (defaults to
> 20) is violated, "iptables-restore" is testing the file OK, but fails
> on loading the filter table:
>=20
> The file "iptables.save" contains the rule (note: "--hitcount 21"
> exceeds the default max of 20):
>=20
> -A INPUT  -m state --state NEW -p tcp --dport 443 -m recent --update
> --name https --seconds 50 --hitcount 21 -j REJECT
>=20
> The -t option (test file) shows an OK:
> But:
>=20
> # iptables-restore < iptables.save
> iptables-restore: line 180 failed
>=20
> On line 180 there is the "COMMIT" of the filter table.

That sounds like expected behaviour. Where's the bug ?
