From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: RTP  stream before DNAT rule
Date: Sun, 08 Feb 2009 16:43:38 +0100
Message-ID: <498EFDAA.1040307@plouf.fr.eu.org>
References: <loom.20090208T105052-760@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20090208T105052-760@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Jimbo a =E9crit :
>=20
> I want to dynamically create DNAT rules for RTP streams (port-mapping=
 for a SIP
> proxy).

Why don't you use the netfilter NAT helper module for SIP instead ? It=20
is designed to handle SIP-related mappings and is available in kernel=20
versions 2.6.18 and above. Its name is ip_nat_sip or nf_nat_sip.

> This works fine when I add a rule before the first packet of the RTP =
stream hits
> the port. But, if the RTP stream begins before the rule is in place, =
it never
> matches.

Because DNAT rules have no effect on already existing "connections".
You could use the 'conntrack' tool (available at the netfilter site) to=
=20
delete an existing matching connection entry from the conntrack table,=20
so the DNAT rule would match the next packet.
