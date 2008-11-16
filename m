From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: where are my udp packets going?
Date: Sun, 16 Nov 2008 17:01:41 +0100
Message-ID: <492043E5.1080903@plouf.fr.eu.org>
References: <gfndh9$n0s$1@ger.gmane.org> <gfnngg$gvn$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gfnngg$gvn$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

sean darcy a =E9crit :
> sean darcy wrote:
>> I'm trying to setup port forwarding for a VOIP server that uses IAX=20
>> packets, port 4569:
>>
>> + /sbin/iptables -t nat -A PREROUTING -i eth0 -p udp --dport 4569 -j=
=20
>> DNAT --to 10.10.10.180:4569
>> + /sbin/iptables -A FORWARD -p udp -m state --state NEW -d=20
>> 10.10.10.180 --dport 4569 -j ACCEPT
>>
>> but the packets aren't showing up at 10.10.10.180.
[...]
> Well, they're going to input.
[...]
> In other words, it's port forwarding all iax except from 76.

This happens probably because your NAT box started to receive UDP/4569=20
packets from 76.zzz.xxx.yyy before the DNAT rule was created and=20
continually receives packets since then. The netfilter connection=20
tracking created a conntrack entry without any NAT operation so=20
subsequent UDP/4569 packets from 76.zzz.xxx.yyy use that same conntrack=
=20
entry and skip the nat chains, until the entry expires. If the box=20
continally sees UDP/4569 packets from 76.zzz.xxx.yyy, then the entry=20
never expires. If you pull the ethernet wire off eth0 for a couple of=20
minutes, the conntrack entry should expire.

Rationale : don't allow any traffic before all rules are created. A=20
simple way to achieve it is to create the rules before network=20
interfaces are UP.
