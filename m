From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: can't port forward on multihome
Date: Mon, 29 Dec 2008 12:24:23 +0100
Message-ID: <4958B367.8060308@plouf.fr.eu.org>
References: <gih0o4$45n$1@ger.gmane.org> <494CD1CB.6040602@plouf.fr.eu.org> <gj8ovd$3li$1@ger.gmane.org> <gj8reg$bq3$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gj8reg$bq3$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

sean darcy a =E9crit :
> sean darcy wrote:
>> Pascal Hambourg wrote:
>>>
>>> As you used DNAT, you may use the --ctorigdst option of the=20
>>> 'conntrack' match and mark reply packets based on the original=20
>>> destination address of the connection.
>>>
>>> iptables -t mangle -A PREROUTING -i eth1 \
>>>   -m connmark --ctorigdst $ETH0_IP_ADDR -j MARK --set-mark 0x1
>>> ip rule add fwmark 0x1 table 128 prio 127
[...]
>> As you can see ctorigdst didn't work with iptables in fedora 9:
>>
>> iptables v1.4.1.1: Unknown arg `--ctorigdst`

My mistake, I meant "-m conntrack", not "-m connmark".

>> Also, I see you set the new ip rule with priority 127. Am I right th=
at=20
>> higher priority numbers override lower priority number in case of a=20
>> conflict? Or does it determine the order in which rules are applied,=
=20
>> smaller numbers first?

Rules with a lower priority number are examined first. I set a differen=
t=20
priority because I thought there could be only one rule per priority,=20
but I was wrong. However I don't know in which order rules with the sam=
e=20
priority are examined, so setting different priorities may be safer if=20
the rule ordering matters.

> ## this should make all packets from the * server go out over broadvi=
ew
> iptables -t mangle -A PREROUTING -i eth1 \
>    -s 10.10.10.180 -j MARK --set-mark 0x1
> ip rule add fwmark 0x1 table 128 prio 127
>=20
> adding this work fine I can ssh and make voip connections to the voip=
=20
> server.
>=20
> But if add this, I can no longer make a voip connection to the voip s=
erver.
>=20
> ## this is supposed to make all packets replying to eth0
> ## go out eth0
> iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW \
>     -j CONNMARK --set-mark 0x1
> iptables -t mangle -A PREROUTING -i eth1 -j CONNMARK --restore-mark

Which VoIP protocol are you using ? If it is SIP or H.323, are the=20
corresponding conntrack and NAT helper modules loaded ? I believe they=20
are required so that the connection tracking can set the connection mar=
k=20
to the related voice traffic.
