From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: Re: IP Accounting and performance
Date: Mon, 9 Dec 2002 07:53:09 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006901c29f71$29724270$3201a8c0@leonardo>
References: <AB18D92A-0AF2-11D7-96A2-00039376F59E@gerry.de>
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
Cc: gerry@gerry.de


    I'm sure more efficient designed rules can help you. Just in case, you
can try to create new rules for your C-classes, one for inbound and one for
outbound. like:

iptables -N C_class_1_inbound
iptables -A C_class_1_inbound -s 10.0.0.1
iptables -A C_class_1_inbound -s 10.0.0.2

iptables -N C_class_2_inbound
iptables -A C_class_2_inbound -s 10.0.1.1
iptables -A C_class_2_inbound -s 10.0.1.2

iptables -N C_class_1_outbound
iptables -A C_class_1_outbound -s 10.0.0.1
iptables -A C_class_1_outbound -s 10.0.0.2

iptables -N C_class_2_outbound
iptables -A C_class_2_outbound -s 10.0.1.1
iptables -A C_class_2_outbound -s 10.0.1.2


    and then using them

/sbin/iptables -A FORWARD -i eth0 -s 10.0.0.0/24 -j C_class_1_inbound
/sbin/iptables -A FORWARD -o eth0 -s 10.0.0.0/24 -j C_class_1_outbound
/sbin/iptables -A FORWARD -i eth0 -s 10.0.1.0/24 -j C_class_2_inbound
/sbin/iptables -A FORWARD -o eth0 -s 10.0.1.0/24 -j C_class_2_outbound

    I'm sure this kind of approach will make things go faster ..... you can
even have some simple bash script with some FORs doing the job of creating
all those rules for you, so you can easily adjust them.

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Gerald Galster" <Gerry@gerry.de>
To: <netfilter@lists.netfilter.org>
Cc: "Gerald Galster" <Gerry@gerry.de>
Sent: Sunday, December 08, 2002 6:18 PM
Subject: IP Accounting and performance


> Hi all,
>
> Perhaps you can give me some hints on a performance problem that I'm
> currently experiencing with iptables.
>
> The situation is as follows:
>
> I have a firewall currently running kernel 2.4.20, Celeron 1 GHz and
> 512 MB of RAM
> that should do traffic accounting based on single IP addresses. I
> thought it would be more
> efficient to use iptables than writing a standalone application using
> pcap or the like.
>
> I need to add filtering rules like
>
> /sbin/iptables -A FORWARD -o eth0 -s ip_address/32
> /sbin/iptables -A FORWARD -i eth0 -d ip_address/32
>
> for about six class-C networks (this means about 3000 iptables rules).
>
> The average throughput is around 3 Mbits / second.
>
> After I've added those rules, the latency in ping times to a machine
> behind
> the firewall increases from 30 ms to over 200 ms ...
>
> Now my question is if I can speed those things up ... do you have any
> ideas?
>
> Thanks in advance.
>
> Regards,
> Gerald
>
>


