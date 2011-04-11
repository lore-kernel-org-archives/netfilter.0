From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: load balanced between tunnel VPN and an Normal Link Internet
Date: Mon, 11 Apr 2011 17:20:41 -0300
Message-ID: <BANLkTinWE_Uc_DoSXhHRr1w-T1Zx7ib1kw@mail.gmail.com>
References: <BANLkTimW+nay6YkXxWnHtP6GKv6Eopac7w@mail.gmail.com>
	<1302549669.1551.20.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302549669.1551.20.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Thank for all tips!

now it's working!

maybe I wasn't very clear in my question.

I have two ISPs in my branch office. one only for VPN ( ISP1 ) and
other ( ISP2 ) for Traffic Internet ( include port 80 )

my firewall gateway is the ISP1  where is my VPN.so to reach my aim
has been necessary created more one table route with iproute2. thus
it's possible forward packages to destination is port 80 by ISP2. the
rule below makes this.

/sbin/iptables -t mangle -A PREROUTING -s 0/0 -d ! 128.2.0.0/16 -p tcp
--dport 80 -j MARK --set-mark 1

ip rule del fwmark 1
ip route flush table internet
ip rule add fwmark 1 table internet prio 20
ip route add default via 200.108.139.1 table internet ( ISP2 )
ip route flush cache

when destination it's different at the 128.2.0.0/16 ( my head office
inside network where are my web servers ) would have be forward by
ISP2.

the problem it was flow data to 128.2.0.0 too had been be by ISP2
insted tunnel VPN.

I've compiled my firewall again and all it's Working..... I don't know
where it was the ERROR but now the Traffic to destination 128.2.0.0
port 80
it's be forwar to tunel VPN.


thank











Em 11 de abril de 2011 16:21, Andrew Beverley <andy@andybev.com> escrev=
eu:
> On Sun, 2011-04-10 at 15:55 -0300, Usu=E1rio do Sistema wrote:
>> Hello everyone, I'm new in this maillist and I would like receive he=
lp
>> about my problem......
>>
>
> Welcome.
>
>>
>> I have a Firewall ( with fwbuider - Red-Hat 5.6 ) in my branch offic=
e
>> connected to my head office by openvpn. I'm with a problem when flow
>> data is to destination port 80 from my branch office to my head
>> office.
>>
>> in my branch office firewall has 3 device Ethernet:
>>
>> eth0 - inside network 192.100.100.0/24
>> eth1 - wan 1 VPN
>> eth2 - wan 2 only for Internet Traffic
>>
>> I'm marking all traffic for port 80 go out upon wan 2 - eth2.
>
> Why are you doing this? The default route should do this for you.
>
>> =A0but,
>> it's a problem because when an user tries access an service at the
>> port 80 in my head office it isen't work!
>>
>> the firewall toward to eth2 insted to VPN the traffic from inside
>> network to my head office when destinatio is port 80. =A0I've try so=
lve
>> this with rule below but it isen't work.occur the same problem.
>>
>> my head office inside network is 128.2.0.0/16 where I have my web
>> servers at the port 80.
>>
>> rules created in firewall branch office
>>
>> /sbin/iptables -t mangle -A PREROUTING -s 0/0 -d ! 128.2.0.0/16 -p t=
cp
>> --dport 80 -j MARK --set-mark 1
>> ip rule del fwmark 1
>> ip route flush table internet
>> ip rule add fwmark 1 table internet prio 20
>> ip route add default via 200.108.139.1 table internet ( it's eth2 )
>> ip route flush cache
>
> You shouldn't need to do any of the above. If you had your routing
> tables correct, then any traffic for your head office network should =
go
> out on the VPN (eth1) and all other traffic (default) should go out o=
n
> eth2.
>
>> part from my route main table
>>
>> 128.2.0.0 =A0 =A0 =A0 192.168.200.101 255.255.0.0 =A0 =A0 UG =A0 =A0=
0 =A0 =A0 =A00 =A0 =A0 =A0 =A00 tun0
>> 169.254.0.0 =A0 =A0 0.0.0.0 =A0 =A0 =A0 =A0 255.255.0.0 =A0 =A0 U =A0=
 =A0 0 =A0 =A0 =A00 =A0 =A0 =A0 =A00 eth3
>> 0.0.0.0 =A0 =A0 =A0 =A0 190.128.173.97 =A00.0.0.0 =A0 =A0 =A0 =A0 UG=
 =A0 =A00 =A0 =A0 =A00
>> 0 eth1 > where is my VPN
>>
>
> If think it would help if you could post a diagram of your setup (wit=
h
> IP addresses) and your full routing table. I don't fully understand t=
hat
> table above. For example, what is 192.168.200.101, what is eth3, and
> what is 190.128.173.97? I assume that 200.108.139.1 is your public IP
> address?
>
>>
>> any Tip ?? I wish that packages from inside networ 192.100.100.0/24 =
to
>> 128.2.0.0/16 port 80 go out for tun0 insted by eth2
>
> Surely you want *any* traffic to 128.2.0.0/16 to go to tun0?
>
> Andy
>
>
>
