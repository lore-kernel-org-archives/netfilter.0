From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Subject: Re: iptables and port 113/auth requests
Date: Tue, 4 Feb 2003 20:00:37 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c2cca1$3b8ccf40$3201a8c0@ESTACAO>
References: <000801c2cc97$6a1feb80$0201a8c0@robs>
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
To: netfilter@lists.netfilter.org, Robert Jones <rjonese@shaw.ca>


    If only a single user ( and no more than one ) requires this, you could
try forwarding in PREROUTING, like:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 113 -j DNAT --to
192.168.1.XX:113

    It should work. But this will redirect ALL ident connections that reach
your machine to internal user machine. It's impossible to know if it's an
mirc ident request or if it's a sendmail ident request for example.


    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: Robert Jones
To: netfilter@lists.netfilter.org
Sent: Tuesday, February 04, 2003 6:50 PM
Subject: iptables and port 113/auth requests


I am trying to build a firewall and i have a problem
i have redhat 8.0
2 nic cards eth0 and eth1..... eth0 being external eth1 being internal
eth0 is connected to a cable modem.  gets its ip via dhcp
i run a dhcpd server on my eth1
int lan is 192.168.1.0
trying to set up ip masquerading for my int lan
some of my users use mirc on irc servers that required an ident reply (port
113)
i would like the ident requests from the irc server to be fowarded to the
int lan so that mirc can reply to the requests
i domt know if this is even possible but was wondering if anyone could help
me


