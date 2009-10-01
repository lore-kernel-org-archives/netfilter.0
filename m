From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: SSH Port Forwarding with iptables
Date: Thu, 01 Oct 2009 12:37:02 +0200
Message-ID: <4AC4864E.4020404@plouf.fr.eu.org>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com> <a0017e7e0909290914v7a4efac0u69f7cfdeaf7bb4e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a0017e7e0909290914v7a4efac0u69f7cfdeaf7bb4e2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Hendrickson <wjhendrickson@gmail.com>
Cc: netfilter list <netfilter@vger.kernel.org>

Hello,

Bill Hendrickson a =E9crit :
> okay, i simplified my script, and tried MASQUERADE vs FORWARD, and go=
t
> it to work:
>=20
> iptables -t nat -P PREROUTING ACCEPT
> iptables -t nat -P POSTROUTING ACCEPT
> iptables -t nat -P OUTPUT ACCEPT
> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 2022 -j DNAT
> --to-destination 172.16.0.101:22
> iptables -t nat -A POSTROUTING -j MASQUERADE
>=20
> why does this way work?

Because MASQUERADE replaces the original source address (which the SSH
server cannot reach due to a missing default or subnet route) with the
address of the output interface eth1 (which the SSH server can reach).

The server did not reply to the SYN packets because there is no route i=
n
its routing table for the client address.

> what are the ramifications of using
> masquerading, i.e., any reason i shouldn't adopt this method?

You don't need SNAT nor masquerade. It hides the real source address
from the server. You just need to add a proper route on the server so i=
t
knows how to reach the client address via the router.

Besides, the SNAT rule proposed by Gaspar could not help because it
works on the external interface, while the missing route on the server
requires SNAT/MASQUERADE on the internal interface.

>> $IPT -A OUTPUT -o $EXT_IFACE -m state --state ESTABLISHED,RELATED -j=
 ACCEPT
>> $IPT -A OUTPUT -o $INT_IFACE -m state --state ESTABLISHED,RELATED -j=
 ACCEPT

You don't need all the ACCEPT rules when the default policies are ACCEP=
T
and there are no DROP/REJECT rules.

>> $IPT -t nat -A PREROUTING -p tcp -i $EXT_IFACE -d $EXT_IP --dport
>> $SSH_PORT --sport 1024:65535 -j DNAT --to $SSH_HOST:22
>> $IPT -A FORWARD -p tcp -i $EXT_IFACE -o $INT_IFACE -d $SSH_HOST
>> --dport $SSH_PORT --sport 1024:65535 -m state --state NEW -j ACCEPT

In the FORWARD chain the destination port has already been changed by
the DNAT rule just like the destination address, so this rule must matc=
h
on destination port 22, not on the original destination port.
