From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: Re: RTSP and iptables
Date: Tue, 23 Feb 2010 13:43:01 +0100
Message-ID: <20100223134301.10925v26w7fpomo8@ek2pim.upc.edu>
References: <20100222103547.251334awhmdhuvi8@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100222103547.251334awhmdhuvi8@ek2pim.upc.edu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org, vhuertas@indra.es

I solved it.

It is only necessary to add a PREROUTING rule indicating that any UDP =20
packet coming from the media server in a determined range of ports has =
=20
to be DNATed to the local IP of the client.

Something like this:

iptables -t nat -A PREROUTING --src 10.1.xx.xx -p udp --sport =20
xxxx:yyyy -j DNAT --to-destination 192.168.50.4:xxxx-yyyy

I hope it can help people in the same situation that I was.

Rebeca

rebeca.martinez-garcia@estudiant.upc.edu escribi=F3:

>
> Hello all,
>
> I have the following scenario:
>
> Private client <-------- > Firewall machine <----------> Streaming Se=
rver
>
> The streaming Server offers two types of services: VoD (by means of =20
> RTSP) as well as broadcasting. The last one is running without =20
> problems once I included some rules in my iptables configuration and =
=20
> with the help of igmpproxy.
>
> However, there is no way I can make the client display the unicast =20
> video. The firewall permits the ports agreement (TCP), but then with =
=20
> the UDP messages it answers both the client and the server with an =20
> ICMP Destination unreachable message.
>
> My iptables configuration is like this:
>
> # Forward:
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> #iptables -A FORWARD -i eth1 -o ppp0 -j ACCEPT
> iptables -A FORWARD -p udp --dport 5060 -j ACCEPT
> iptables -A FORWARD -p udp --dport 4060 -j ACCEPT
>
> # Enabling VLC streaming broadcast:
> iptables -I FORWARD -s 10.1.xx.xx/24 -d 224.0.0.0/4 -j ACCEPT
> iptables -I INPUT -d 224.0.0.0/4 -j ACCEPT
> iptables -I FORWARD -d 224.0.0.0/4 -j ACCEPT
>
> #Enabling VLC VoD:
> iptables -A INPUT -s 192.168.50.0/24 -m tcp -p tcp --dport =20
> 30000:65000 -j ACCEPT
> iptables -A INPUT -s 192.168.50.0/24 -m udp -p udp --dport =20
> 30000:65000 -j ACCEPT
> iptables -A INPUT -s 10.1.xx.xx/24 -m tcp -p tcp --dport 30000:65000 =
=20
> -j ACCEPT
> iptables -A INPUT -s 10.1.xx.xx/24 -m udp -p udp --dport 30000:65000 =
=20
> -j ACCEPT
> iptables -A FORWARD -s 192.168.50.0/24 -m tcp -p tcp --dport =20
> 30000:65000 -j ACCEPT
> iptables -A FORWARD -s 192.168.50.0/24 -m udp -p udp --dport =20
> 30000:65000 -j ACCEPT
> iptables -A FORWARD -s 10.1.xx.xx/24 -m tcp -p tcp --dport =20
> 30000:65000 -j ACCEPT
> iptables -A FORWARD -s 10.1.xx.xx/24 -m udp -p udp --dport =20
> 30000:65000 -j ACCEPT
>
> Please, there is anybody who has any tip or could help me?
>
> Thanks in advance,
> Rebeca Martinez
>


