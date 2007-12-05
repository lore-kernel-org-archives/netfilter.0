From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: route back over same interface - traffic blocked
Date: Wed, 05 Dec 2007 12:54:21 +0100
Message-ID: <4756916D.3040001@plouf.fr.eu.org>
References: <C0641B79F7D6A44791BA8FA35BC143F914D61FB242@apollo.corelan.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C0641B79F7D6A44791BA8FA35BC143F914D61FB242@apollo.corelan.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

Peter Van Eeckhoutte a =E9crit :
>=20
> I have a rule in iptables, allowing all traffic from 192.168.0.0/24=20
> towards 192.168.3.0/24
>=20
> When clients from 192.168.0.0/24 try to connect to hosts in=20
> 192.168.3.0/24, the packet is sent to their default gateway (which is=
=20
> the firewall).
> I would have expected the firewall to forward the packet to the route=
r=20
> between 192.168.0.0 and 192.168.3.0
> But all I can see in the log is a   "DENY  in=3Deth0 out=3Deth0 "

Did you make sure that the rule is inserted before the log&drop rules ?
