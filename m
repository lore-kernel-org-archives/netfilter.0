From: =?iso-8859-2?Q?Pawe=B3_Staszewski?= <pstaszewski@artcom.pl>
Subject: Re: Help with alias interfaces
Date: Mon, 21 Jun 2004 19:11:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003301c457b2$d516e860$1930090a@paol>
References: <FLECICIIDHIEIENHHOOLKEDOCCAA.esanz@minorplanetusa.com>
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
To: netfilter@lists.netfilter.org

Hello
Try this:
ip link set eth0:x name shit1

and then...
iptables -A FORWARD -i shit1 -do something


----- Original Message ----- 
From: "Erick Sanz" <esanz@minorplanetusa.com>
To: <netfilter@lists.netfilter.org>
Sent: Monday, June 21, 2004 6:45 PM
Subject: Help with alias interfaces


>
> All,
>
> I have multiple interfaces in a system (eth1, eth1:0, eth1:1 and eth1:2),
> and I need to forward things for several ports to them.
>
> Since IPtables do not understand eth1:1, my rules look something like
> this:
>
> # Ftp server
>     iptables -t nat -A PREROUTING -p tcp -d $FTP_IPADDR --dport 21 -j
> DNAT --to $FTP_SERVER
>     iptables -A FORWARD -i eth1 -p tcp -d $FTP_SERVER --dport 21 -m
> state --state NEW -j ACCEPT
>
> # Web server
>     iptables -t nat -A PREROUTING -p tcp -d $WEB_IPADDR --dport 80 -j
> DNAT --to $WEB_SERVER
>     iptables -A FORWARD -i eth1 -p tcp -d $WEB_SERVER --dport 80 -m
> state --state NEW -j ACCEPT
>
> eth1 is my WAN interface... Is this correct?
>
> Also, for the life of my I don't seem to be able to get DNS resulution to
> my
> DNS server; my rules are as follows:
>
>     iptables -t nat -A PREROUTING -p udp -d $DNS_1 --dport 53 -j DNAT --to
> $DNS_SERVER1
>     iptables -t nat -A PREROUTING -p tcp -d $DNS_1 --dport 53 -j DNAT --to
> $DNS_SERVER1
>
>     iptables -t nat -A PREROUTING -p udp -d $DNS_2 --dport 53 -j DNAT --to
> $DNS_SERVER2
>     iptables -t nat -A PREROUTING -p tcp -d $DNS_2 --dport 53 -j DNAT --to
> $DNS_SERVER2
>
>     iptables -A FORWARD -i eth1 -p udp -d $DNS_SERVER1 --dport 53 -m
> state --state NEW -j ACCEPT
>     iptables -A FORWARD -i eth1 -p tcp -d $DNS_SERVER1 --dport 53 -m
> state --state NEW -j ACCEPT
>
>     iptables -A FORWARD -i eth1 -p udp -d $DNS_SERVER2 --dport 53 -m
> state --state NEW -j ACCEPT
>     iptables -A FORWARD -i eth1 -p tcp -d $DNS_SERVER2 --dport 53 -m
> state --state NEW -j ACCEPT
>
> Besides those rules, I also allow ping to those interfaces.
>
> Does anybody host their own DNS, if so, could you share your rules
(without
> IP addresses, to protect the identity of the inocent...)    ;)
>
> Beforehand, thank you for your help!
>
> Best regards,
> Erick Sanz
>
>
>
> This email message has been scanned for viruses.
>
>
>
>



