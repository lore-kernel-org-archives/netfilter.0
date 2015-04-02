From: Dmitry Melekhov <dm@belkam.com>
Subject: Re: connmark and nat
Date: Thu, 02 Apr 2015 08:22:19 +0400
Message-ID: <551CC3FB.2070903@belkam.com>
References: <551A484A.7050208@belkam.com> <551C6A12.6020404@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <551C6A12.6020404@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

02.04.2015 01:58, Pascal Hambourg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Dmitry Melekhov a =C3=A9crit :
>> I'm trying to do DNAT/SNAT on the same host with connmark and can't =
get
>> it working.
>>
>> My host has static ip 192.168.22.252 and it can get address
>> 192.168.22.99 from VRRP, so bind doesn't listen on 192.168.22.99,
> Why not ?

because there is no such address on interface, it becomes available onl=
y=20
at VRRP state change to master :-)

>> but if host got this address it has to answer on it the same as on
>> 192.168.22.252.
>>
>> So , if traffic goes to 192.168.22.99 port 53 udp, I need to redirec=
t it
>> to 192.168.22.252:53,
> Not if you can have BIND to listen on 192.168.22.99 when your host ge=
ts
> the address.

Yes, really, I can, but I'd like to solve this by using iptables, just=20
for fun, you know ;-)

>> and if it was to 192.168.22.99 host need to reply from this address.
> This is automatic with stateful destination NAT (DNAT).

Really not, bind uses udp, so it will reply from 192.168.22.252, i.e.=20
from address it listens.
>
>> DNAT part works:
>>
>> #mark
>> iptables -t mangle -A PREROUTING -d 192.168.22.99 -p udp --dport 53 =
-j
>> CONNMARK --set-mark 0x100
>>
>> #restore mark inside connection
>> iptables -t mangle -A PREROUTING -d 192.168.22.99 -p udp --dport 53 =
-j
>> CONNMARK --restore-mark
>>
>> #do NAT
>> iptables -t nat -A PREROUTING -m mark --mark 0x100 -j DNAT
>> --to-destination 192.168.22.252
> What a complicated setup. Why not just this :
>
> iptables -t nat -A PREROUTING -d 192.168.22.99 -p udp --dport 53 \
>    -j DNAT --to-destination 192.168.22.252

Please, see above, in this case replies are go from

192.168.22.252

and clients just drop such packets.

>
>> But SNAT doesn't:
>>
>> #restore mark
>> iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
>>
>> #do nat
>> iptables -t nat -A POSTROUTING -m mark --mark 0x100 -j SNAT --to-sou=
rce
>> 192.168.22.99
>>
>> I see that no packets hit rule:
> Of course not. Stateful NAT automatically takes care of reply packets
> and replaces addresses as expected by the original sender. Only the
> first packet of a new connection goes throught the chains of the nat =
table.
Sorry, no.

