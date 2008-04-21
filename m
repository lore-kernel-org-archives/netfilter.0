From: =?windows-1252?Q?Javier_Prieto_Mart=EDnez?= 
	<javier.prieto.ext@juntadeandalucia.es>
Subject: Re: Redirecting ports in a bridge
Date: Mon, 21 Apr 2008 08:55:38 +0200
Message-ID: <480C3A6A.3090206@juntadeandalucia.es>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <4808B26F.4060205@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4808B26F.4060205@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor escribi=F3:

 > Ok, forgive me for asking. Is this appliance multi-purpose in such=20
that it is suppose to log and redirect traffic?

Yes, It's multi-purpose:=20
http://www.eneotecnologia.com/products_en.html?TB_iframe=3Dtrue&height=3D=
510&width=3D800

    * *Firewall & QoS.-* High performance statefull firewall and qualit=
y
      of service.
    * *Web cache & content filter.-* Black and white list mode with LDA=
P
      or AD authentication.
    * *VPN.-*L2TP / IPSEC =96 X.509, NAT Traversal and high availabilit=
y.
    * *IPS / IDS.-* Snort 2.6 based with hardware acceleration.
    * *Load balancing.-* LVS based =96 L3/4 classification, different
      algorithms.
    * *High availability.-* VRRP (Router mode) and STP (Bridge mode).
    * *Malware.-* Antivirus (ClamAV, Kaspersky), antispam (DSPAM,
      Mailshell), antispyware (Kaspersky, PCTools or Sunbelt) with
      hardware acceleration.
    * *NetFlow probe.-* NetFlow v5/9 Probe.


We use it in bridge mode, mainly for traffic logging, and sometimes for=
=20
packet filtering.


 > As Jan Engelhardt has pointed out so well, you are very likely=20
dealing with (what I call)
 > a "TCP Triangle". If there is not something else in the mix doing=20
source NATing, you will
 > need to do something else to avoid the "TCP Triangle". There are man=
y=20
different options
 > available, one of which is the SNATing like you are referring to=20
(though I would be careful
 > on selecting the packets to SNAT). Another would be to have your=20
clients connect to IPs on
 > LAN 1 that are bound to the router that is DNATing traffic to LAN 2=20
and then unDNATing the
 > replies. You could also have duplicate IPs bound on server 1 and=20
server 2 and use some
 > clustering techniques to alter which MAC address / server the=20
packet(s) go to, thus
 > allowing both servers to answer with the proper IP.

I still want the bridge to be totally transparent, and I don't want to=20
mess with the real IPs, as I don't want the probe to be a single point=20
of failure. In fact, it's network cards still work as a bridge when the=
=20
machine is down.

I suppose I should use SNAT, then, as you've stated, but it doesn't see=
m=20
to work properly. I'm trying that:

# iptables -t nat -A PREROUTING -p tcp -d 192.168.2.1 --dport 80 --to-d=
estination 192.168.2.2:80 -j DNAT
# iptables -t nat -A POSTROUTING -p tcp --sport 80 -s 192.168.2.2 -d 19=
2.168.1.0/24 -j SNAT --to-source 192.168.2.1


