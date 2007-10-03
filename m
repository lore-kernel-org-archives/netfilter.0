From: "Amos Jeffries" <squid3@treenet.co.nz>
Subject: Re: [netfilter mailing list] squid cache mess in openvpn
Date: Wed, 3 Oct 2007 15:35:57 +1300 (NZDT)
Message-ID: <2987.130.217.140.56.1191378957.squirrel@webmail.treenet.co.nz>
References: <521068.63911.qm@web55404.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <521068.63911.qm@web55404.mail.re4.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pedro noticioso <cucnews@yahoo.com>
Cc: netfilter@vger.kernel.org

>
>
> hi list, I just added a squid cache on the same server where an openvpn
> server is running.
>
> This is a diagram of how things are atm
>
> [adsl2:192.168.2.254]
>      |
>
>      |
> [SWITCH]================[LAN]
>      |
>
>      |
> [eth1:192.168.2.99]
>      |
>
> [DEBIAN4/OPENVPN/SQUID]
>      |
>
> [eth0:192.168.101.253]
>      |
>
>      |
> [ADSL1:92.168.101.254]
>
>
>
> so, before squid, they where using this:
>
>
> iptables -A PREROUTING -i eth1 -t mangle -p tcp -m multiport --dport
> http,smtp,pop3,ftp,https,1863 -j MARK --set-mark 1
>
> echo 200 web.out >> /etc/iproute2/rt_tables
> ip rule add fwmark 1 table web.out
> ip rule ls
> ip route add default via 192.168.2.254 dev eth1 table web.out
> ip route flush cache
>
>
> But after squid, it was setup as transparent, and added this line
>
> iptables -t nat -A PREROUTING -i eth1 -s 192.168.2.0/24 -p tcp --dport 80
> -j REDIRECT --to-port 3128
>
>
> so now, all http traffic goes into the vpn, slow internet and slow vpn :S
> ..so I gave my sense of humor a shot, and tried POSTROUTING to try to send
> squids outgoing traffic back to ADSL2
>
>
> iptables -A POSTROUTING -o eth0 -t mangle -p tcp -m multiport --dport
> http,smtp,pop3,ftp,https,1863 -j MARK --set-mark 2
> echo 202 www.out >> /etc/iproute2/rt_tables
> ip rule add fwmark 2 table www.out
> ip route add default via 192.168.2.254 dev eth1 table www.out
> ip route flush cache
>
>
> unfortunatelly, I stilll see packets going into ADSL1
>
> and I see this error when I run the fw script
>
> RTNETLINK answers: File exists
>
>
> so, here I am, asking for help, please and thanks.
>
> I hope I gave you enough info :s
>

You need to do two things:
 - configure tcp_outgoing_address in squid itself to set squid
origin-address to 192.168.2.* facing. That will prevent the ADSL1
traffic.
 - exempt traffic coming out of the squid machine from redirection rule.

With that physical configuration you are going to have twice the traffic
over [SWITCH] and any path between it and the squid box. As traffic gets
sent to squid then bounce out again via the switch, slow is a relative
term.


Amos
Squid Development Team


