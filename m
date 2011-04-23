From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: only direct port 80 traffic from client
Date: Sat, 23 Apr 2011 11:31:13 -0300
Message-ID: <BANLkTi=ZpD83qOpn5FEK7dQgU27Xa2p3CQ@mail.gmail.com>
References: <4DAFE343.3070603@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DAFE343.3070603@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: J Webster <jw.jwebster@gmail.com>
Cc: netfilter@vger.kernel.org

You can use iproute2 to split your traffic.

http://lartc.org/howto/

follow a tip:


1- create a table with name bradesco

echo 200 bradesco >> /etc/iproute2/rt_tables

2- Marking the packages desirable ( 192.100.100.0/24 > branch office
inside network, 128.2.0.0/16 head office inside network )

/sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -d
128.2.0.0/16 -p tcp --dport 80 -j MARK --set-mark 1
/sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -d
128.2.0.0/16 -p tcp --dport 443 -j MARK --set-mark 1

3- Add packages have been marked with tag 1 to table bradesco

ip rule add fwmark 1 table bradesco prio 20

4- Add a gateway for table bradesco

ip route add default via tun0 table bradesco

where tun0 it's your address VPN tunnel















2011/4/21 J Webster <jw.jwebster@gmail.com>:
> I have a public OpenVPN service on my server authenticated by certifi=
cates.
> I only want to route port 80 and 1935 traffic from the client. All ot=
her
> client traffic should go to the normal ISP.
> How can I make sure that clients do not send normal traffic through t=
o the
> VPN server? As far as I understoof iptables rules would only act on t=
he
> server so if I blocked email traffic it would just be dropped.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
