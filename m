From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: Groups in iptables
Date: Sat, 29 Nov 2003 16:06:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c3b6ab$d569cf10$8b00000a@casa>
References: <000301c3b69e$3e4122d0$6400a8c0@pfontenot>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: paul@pitbull-racing.com, "Net Filter (E-mail)" <netfilter@lists.netfilter.org>


    Source and destination addresses cannot be given as a 'group of IPs'.
It's true that source and destination addresses CAN be always written as
net.work.address/mask, thus allowing you to specify a whole C
(your.net.work.0/24 ) network of even networks with different masks.

    In your case, 192.168.0.25, 192.168.0.26 and 192.168.0.27 cannot be
written as network/mask. So you CANNOT write one SINGLE rule to do what you
want. You'll probably need to write a single rule for each address.

    But if you're one of those who are not afraid of source code and
recompiling things, you may wanna try iprange iptables module that can be
found on patch-o-matic. This module makes possible to specify any given
range of IPs as source and/or destination.

[root@firewall root]# iptables -m iprange --help
iptables v1.2.9
[ ..... looooooots of information ...... ]

iprange match v1.2.9 options:
[!] --src-range ip-ip        Match source IP in the specified range
[!] --dst-range ip-ip        Match destination IP in the specified range


    Anyway, neither iprange can be used if your IP addresses are completly
different from each other (192.168.0.20, 10.10.2.1, 172.16.3.1,
200.201.202.203) .... in this case you'll for sure have to give several
rules, one for each address.

    Hope this helps you :)

    Sincerily,
    Leonardo Rodrigues


----- Original Message ----- 
From: "Paul Fontenot" <paul@pitbull-racing.com>
To: "Net Filter (E-mail)" <netfilter@lists.netfilter.org>
Sent: Saturday, November 29, 2003 2:28 PM
Subject: Groups in iptables


> I would imagine the answer to this is yes, but I haven't found anything on
> the subject. If you wanted to limit outbound traffic for a certain port to
> certain group of servers is that possible?
>
> For example, can I create a group:
>
> MAILSERVERS = 192.168.0.25, 192.168.0.26, 192.168.0.27
>
> and use that in a ruleset:
> -A INSIDE_ACCESS_OUT -s $MAILSERVERS -p tcp -m tcp --dport 25 --tcp-flags
> SYN,RST,ACK SYN -j ACCEPT
>
> and then drop the rest:
> -A INSIDE_ACCESS_OUT -p tcp -m tcp --dport 25 -j DROP
>
>
>


