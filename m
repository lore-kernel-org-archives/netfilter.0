From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: transparent proxying NTP
Date: Sun, 27 Jun 2004 17:19:12 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006401c45c84$05827250$8b00000a@casa>
References: <Pine.LNX.4.33.0406272137520.29785-100000@muur.intranet.vanheusden.com>
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
To: Folkert van Heusden <folkert@vanheusden.com>, netfilter@lists.netfilter.org


    I think SNATing to 127.0.0.1 would break things, unless this linux
router IS your timeserver, which i believe isn't. You should SNAT to your
linux router IP not 127.0.0.1.

    Also note that the order of the rules is important. If you have some
other rule with ACCEPT in PREROUTING before the DNAT rule, packet will be
allowed to go out and DNAT will never be reached. A full 'iptables -t
nat -nL -v' would help us to check this.

    Last ...... are you sure protocol used for time syncing works fine when
DNATted ?? I dont know, never tried this.

    Sincerily,
    Leonardo Rodrigues

----- Original Message ----- 
From: "Folkert van Heusden" <folkert@vanheusden.com>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, June 27, 2004 4:43 PM
Subject: transparent proxying NTP


> Hi,
>
> I'm trying to do transparent proxying for NTP.
> I want to do that as some access points I have over here want to sync
their
> time to some server in Amerika. Not so efficient as I live in europe and
> have in fact my own local stratum 1 timeserver.
> So, I tried this:
> iptables -t nat -A PREROUTING -i eth1 -s ! 192.168.64.1 -p udp --dport
123 -j DNAT --to 192.168.64.1:123
> iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/16 -d
192.168.64.1 -j SNAT --to 127.0.0.1
>
> But when I do a tcpdump on ppp0 of my gateway (the adsl connection) and do
> netdate ntp.xs4all.nl from a host on my lan (192.168.64.99), I still see
> requests coming from that host to the internet!
> I guess I'm doing something obvious wrong here but I'm not sure what.
> Could someone please enlighten me?


