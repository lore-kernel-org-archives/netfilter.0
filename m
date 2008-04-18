From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting ports in a bridge
Date: Fri, 18 Apr 2008 09:44:52 -0500
Message-ID: <4808B3E4.6090009@riverviewtech.net>
References: <48086990.5060000@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48086990.5060000@juntadeandalucia.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/18/08 04:27, Javier Prieto Mart=EDnez wrote:
> 1) I have to SNAT the response. I've tried that rule:  iptables -t=20
> nat -A POSTROUTING -p tcp --sport 80 -s 192.168.2.2 -d 192.168.1.0/24=
=20
> -j SNAT --to-source 192.168.2.1

As Jan Engelhardt has pointed out so well, you are very likely dealing=20
with (what I call) a "TCP Triangle".  If there is not something else in=
=20
the mix doing source NATing, you will need to do something else to avoi=
d=20
the "TCP Triangle".  There are many different options available, one of=
=20
which is the SNATing like you are referring to (though I would be=20
careful on selecting the packets to SNAT).  Another would be to have=20
your clients connect to IPs on LAN 1 that are bound to the router that=20
is DNATing traffic to LAN 2 and then unDNATing the replies.  You could=20
also have duplicate IPs bound on server 1 and server 2 and use some=20
clustering techniques to alter which MAC address / server the packet(s)=
=20
go to, thus allowing both servers to answer with the proper IP.

> 2) I have to use ebtables, as I'm using a bridge.

I would suggest that you use EBTables seeing as how you are bridging.  =
I=20
think things will be easier to maintain and you will be using a simpler=
=20
operation.



Grant. . . .
