From: sean darcy <seandarcy2@gmail.com>
Subject: Re: can't port forward on multihome
Date: Sun, 28 Dec 2008 15:53:00 -0500
Message-ID: <gj8ovd$3li$1@ger.gmane.org>
References: <gih0o4$45n$1@ger.gmane.org> <494CD1CB.6040602@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <494CD1CB.6040602@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Hello,
>=20
> sean darcy a =E9crit :
>> I have a multihomed server: eth0 is a static T1, and eth3 is a Veriz=
on=20
>> dsl line. I want eth3 as the default for general traffic, and eth0 f=
or=20
>> VOIP traffic.
>>
>> eth1 is the internal interface. eth3 works fine as the masquerade ou=
t=20
>> for NAT'd lan.
>>
>> I've used ip to set up eth0 so I can ssh into it:
>>
>> ## eth0 is static
>> ETH0_IP_ADDR=3Dwww.xxx.yyy.zzz
>> ip rule add from $ETH0_IP_ADDR/32 table 128 priority 128
>> ## this is the route through the gateway ip
>> ip route add default via <eth0 gateway ip> table 128
>>
>> and that works. Which is important since that's the static address;=20
>> the Verizon dsl address is dynamic.
>>
>> The VOIP server ( asterisk ) is on the lan. I've tried to port forwa=
rd=20
>> ssh to the voip server:
>>
>> $IPT -t nat -A PREROUTING  -p tcp --dport 2280 -j DNAT --to=20
>> 10.10.10.180:22
>> $IPT -A FORWARD -p tcp --dport 22 -m state --state NEW -d 10.10.10.1=
80=20
>> -j ACCEPT
>>
>> This works if I ssh to the eth3, the dynamic dsl interface:
>>
>> ssh -p 2280 voip@<dsl ip address>
>>
>> I get an ssh session on the voip server.
>>
>> But:
>>
>> ssh -p 2280 voip@<static ip address>
>>
>> doesn't work. But I need to have others access the voip server using=
 a=20
>> static ip, but not give them access to the multihomed server.
>=20
>=20
> The ip rule won't work for reply packets sent by the server, because =
=2E=20
> source address mangling occurs after the routing decision so the sour=
ce=20
> address is 10.10.10.180, not (yet) eth0's address. If Verizon drops=20
> packets sent with a source address other than the one assigned to eth=
3,=20
> then the client won't receive any reply and the connection will fail.
>=20
> In order to route the reply packets using table 128, you need to=20
> identify them. I guess that 10.10.10.180:22 as the source address:por=
t=20
> is not discriminant enough, as it matches connections forwarded from=20
> eth3 too.
>=20
> You can use the CONNMARK target to mark the incoming connection on et=
h0=20
> and copy the connection mark to the reply packets on eth1. Then you c=
an=20
> use the packet mark in an ip rule.
>=20
> iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW \
>   -j CONNMARK --set-mark 0x1
> iptables -t mangle -A PREROUTING -i eth1 -j CONNMARK --restore-mark
> ip rule add fwmark 0x1 table 128 prio 127
>=20
> As you used DNAT, you may use the --ctorigdst option of the 'conntrac=
k'=20
> match and mark reply packets based on the original destination addres=
s=20
> of the connection.
>=20
> iptables -t mangle -A PREROUTING -i eth1 \
>   -m connmark --ctorigdst $ETH0_IP_ADDR -j MARK --set-mark 0x1
> ip rule add fwmark 0x1 table 128 prio 127


Thanks for the quick response. I, on the other hand, took some time off=
=20
around xmas.

As always, it takes time for me to think through these ip/iptables=20
problems. But I realized you'd pointed me in the direction of how to=20
solve my general problem, not just ssh. I realized I could have all=20
packets from the voip server go out the T1 interface quite simply:

#!/sh/bin
## eth0 is static to broadview
ETH0_IP_ADDR=3Dwww.xxx.yyy.zzz
ip rule add from $ETH0_IP_ADDR/32 table 128 priority 128
## this is the route through broadview gateway ip
ip route add default via <eth0 gateway ip> table 128

## this should make all packets from the * server go out over broadview
iptables -t mangle -A PREROUTING -i eth1 \
   -s 10.10.10.180 -j MARK --set-mark 0x1
## this is supposed to make all packets replying to eth0
## go out eth0
iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW \
    -j CONNMARK --set-mark 0x1
iptables -t mangle -A PREROUTING -i eth1 -j CONNMARK --restore-mark
## this won't work on iptables 1.4.1
# iptables -t mangle -A PREROUTING -i eth1 \
#  -m connmark --ctorigdst $ETH0_IP_ADDR -j MARK --set-mark 0x1
ip rule add fwmark 0x1 table 128 prio 127

so now all traffic, including the voip packets, from the voip server go=
=20
out over the T1, but only the reply traffic from the rest of the lan=20
goes out the T1.

As you can see ctorigdst didn't work with iptables in fedora 9:

iptables v1.4.1.1: Unknown arg `--ctorigdst`

which is puzzling, but...

Also, I see you set the new ip rule with priority 127. Am I right that=20
higher priority numbers override lower priority number in case of a=20
conflict? Or does it determine the order in which rules are applied,=20
smaller numbers first?

Thanks for the help.

sean


