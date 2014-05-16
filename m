From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: randomly SNATed devices after reboot
Date: Fri, 16 May 2014 22:25:10 +0200
Message-ID: <53767426.8080003@plouf.fr.eu.org>
References: <20140515104238.26ce6626@pulsar>	<53759AB5.6050101@atc.tcs.com>	<537660A1.9060907@plouf.fr.eu.org> <20140516165931.274ae0c2@pulsar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140516165931.274ae0c2@pulsar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter <netfilter@vger.kernel.org>

Ethy H. Brito a =E9crit :
>=20
>> If you don't want this to happen, just DROP all FORWARDed traffic un=
til
>> the SNAT rule is active.
>=20
> <side comment>
> Hmmm! I am looking to Jan Engelhardt's Packet Flow picture (2014-Feb-=
28) and
> can not find conntrack in the output path for forwarded packets. I th=
ink we
> found a glitch in his drawing. Does he read this list?
> </side comment>

The conntrack for forwarded packets is in the PREROUTING path.

> Nope. I think this is not a ultimate solution because packets still m=
ay flow
> before FORWARD DROP rule is in place. Your suggestion does not kill t=
he race
> condition.

Well, that's because I put filtering rules in place with default DROP
before enabling the network for obvious safety reasons, and assumed
everyone did the same.

> This is what I see, please correct me if I'm wrong:
> 	1) IP stack is in place during boot=20
> 	2) network parameters are configured (ip addrs, routes, etc)
> 	3) nf modules are loaded (/etc/modules.d??)
> 	4) conntrack modules are loaded (also /etc/modules.d)
> 	5) user scripts are loaded (iptables snat or FORWARD rules included)

The order is sysadmin-dependent. You decide. My iptables initscript is
run before the network is configured and activated.

> I need to ensure no packet cross at least before conntrack is loaded

Not necessarily. You're also safe if any forwarded packet is dropped (o=
r
forwarding is disabled) until the SNAT rule is in place. The packets
will be discarded and the conntrack entry will be destroyed immediately=
=2E
