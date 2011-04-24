From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: only direct port 80 traffic from client
Date: Sun, 24 Apr 2011 11:08:42 -0300
Message-ID: <BANLkTinxD9eE97CUTtkU32voAgu+emHjiA@mail.gmail.com>
References: <4DAFE343.3070603@googlemail.com>
	<BANLkTi=ZpD83qOpn5FEK7dQgU27Xa2p3CQ@mail.gmail.com>
	<4DB2FCE4.4090606@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB2FCE4.4090606@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: J Webster <jw.jwebster@gmail.com>
Cc: netfilter@vger.kernel.org

I've thought that you had branch office with others Firewalls
connected to head office so this way would be as I've suggested....

I think that you can solve your problem searching in OpenVPN forum to
iptables/netfilter.

because you have handle traffic from client no in your firewall rules.




Em 23 de abril de 2011 13:23, J Webster <jw.jwebster@gmail.com> escreve=
u:
>
>> You can use iproute2 to split your traffic.
>>
>> http://lartc.org/howto/
>>
>> follow a tip:
>>
>>
>> 1- create a table with name bradesco
>>
>> echo 200 bradesco>> =A0/etc/iproute2/rt_tables
>>
>> 2- Marking the packages desirable ( 192.100.100.0/24> =A0branch offi=
ce
>> inside network, 128.2.0.0/16 head office inside network )
>>
>> /sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -=
d
>> 128.2.0.0/16 -p tcp --dport 80 -j MARK --set-mark 1
>> /sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -=
d
>> 128.2.0.0/16 -p tcp --dport 443 -j MARK --set-mark 1
>>
>> 3- Add packages have been marked with tag 1 to table bradesco
>>
>> ip rule add fwmark 1 table bradesco prio 20
>>
>> 4- Add a gateway for table bradesco
>>
>> ip route add default via tun0 table bradesco
>>
>> where tun0 it's your address VPN tunnel
>>
> But this is on the server isn't it?
> It is the traffic from the client and all clients are outside of the
> network.
> So, a client from 88.11.11.11 connects to my VPN on fixed IP
> 123.123.123.123. Another client from 78.22.11.22 connects to
> 123.123.123.123.
> I only want them to send port 80 traffic to the server but they shoul=
d
> direct all their email traffic and other apps through their normal IS=
P.
> iptables cannot bounce the traffic back to the client because the cli=
ent
> won;t know where to send it after that?
>
