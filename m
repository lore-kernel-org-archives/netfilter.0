From: "John Lister" <john.lister@kickstone.com>
Subject: Re: Checking line status
Date: Wed, 2 Sep 2009 15:02:15 +0100
Message-ID: <0DB67FCC2A774AFCA834C6CD4BE5DB12@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com> <1251895652.23708.37.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

>You need to ensure that your ping packets come from the right IP and get
>routed to the right interface. Useless comment maybe, but without
>you posting your details here it is difficult to say more specific
>things ;)

One more thing, I had this (simplified) configuration, but none of the rules 
seem to be triggered, I thought local packets went through this chain

mangle(OUTPUT) -> nat (OUTPUT) -> OUTPUT -> routing decision -> mangle 
(POSTROUTING) -> nat (POSTROUTING)

ip route add 87.194.A.B/22 dev eth1 table 111
ip route add 192.168.2.0/24 dev eth0 table 111
ip route add default via 87.194.a.b dev eth1 table 111

ip route add 94.30.X.Y/29 dev eth4 table 222
ip route add 192.168.2.0/24 dev eth0 table 222
ip route add default via 94.30.x.y dev eth4 table 222

ip rule add fwmark 111 table 111
ip rule add fwmark 222 table 222

iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
iptables -t mangle -A OUTPUT -m mark --mark 0 -m state --state NEW -m 
statistic --mode nth --every 2 --packet 0 -j MARK --set-mark 111
iptables -t mangle -A OUTPUT -m mark --mark 0 -m state --state 
    -j MARK --set-mark 111
iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 87.194.a.b
iptables -t nat -A POSTROUTING -o eth4 -j SNAT --to-source 94.30.x.y


I would hope that the first set of iptables rules mark the packets before 
the routing rules forward them on their way (via a bit of SNATting), however 
it looks like the mangle OUTPUT table is skipped and no marks are added...


Thanks

John


