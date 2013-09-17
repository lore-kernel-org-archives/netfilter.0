From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Wed, 18 Sep 2013 01:23:48 +0200
Message-ID: <5238E484.80802@plouf.fr.eu.org>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il> <87li2w9scf.fsf@vostro.rath.org> <43783AC5-55D5-4AAE-A629-6B2C99AAC8E4@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <43783AC5-55D5-4AAE-A629-6B2C99AAC8E4@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Alex Bligh a =E9crit :
>=20
> I don't think you need iptables. The way I've always done it is:
> * Default route to the VPN device
> * /32 route for the VPN endpoint out the physical interface to
>   the previous default route

This does not meet the following OP's requirement :

>> The hard part is to also tunnel non-VPN connections to the VPN node
>> itself. In other words how do I make sure that every connection to t=
he
>> external ip of the VPN node is tunneled through its internal ip --
>> except for the packets that form the tunnel itself?

However I am not sure this is a sensible requirement.

>> My idea was install a default route to the internal ip of the VPN no=
de,
>> use iptables to mark the VPN connections and then set up a special
>> routing table for those.

Sounds good. Make sure that packets related to the VPN connection (e.g.
ICMP error messages) are routed outside the tunnel too. I guess that ca=
n
be done with connmark (connection mark).
