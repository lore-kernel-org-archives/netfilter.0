From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: transparent proxying NTP
Date: Sun, 27 Jun 2004 17:46:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00e301c45c87$e6e2cc60$8b00000a@casa>
References: <Pine.LNX.4.33.0406272137520.29785-100000@muur.intranet.vanheusden.com> <40DF2B43.8060609@bofh.bg>
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
To: Dimitar Katerinski <train@bofh.bg>, netfilter@lists.netfilter.org


    If the DNATted machine is NOT the linux router that is doing the DNAT,
you WILL need the SNAT rule too. If you dont use, DNATted machine will try
to answer directly to the machine that requested the update. And that
machine is not expecting anything from that IP. So, SNATting to linux router
IP is needed if DNATting to a machine in the network.

    Sincerily,
    Leonardo Rodrigues


----- Original Message ----- 
From: "Dimitar Katerinski" <train@bofh.bg>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, June 27, 2004 5:17 PM
Subject: Re: transparent proxying NTP
> Well if you think how transparent www proxy works, you may figure out how
to do transparent ntp proxying.
> The following rule should do the job:
> iptables -t nat -A PREROUTING -i eth1 -s $LAN_SUBNET -p udp --dport 123 -j
REDIRECT --to-ports 123
> also I think
> iptables -t nat -A PREROUTING -i eth1 -s $LAN_SUBNET -p udp --dport 123 -j
DNAT --to-destination 192.168.64.1:124
> might work, as I test it. You dont need the SNAT rule though. Test these
and give feedback.
>


