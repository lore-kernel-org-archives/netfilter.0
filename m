From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting ports in a bridge
Date: Mon, 21 Apr 2008 20:30:10 -0500
Message-ID: <480D3FA2.4050000@riverviewtech.net>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <4808B26F.4060205@riverviewtech.net> <480C3A6A.3090206@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480C3A6A.3090206@juntadeandalucia.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/21/2008 1:55 AM, Javier Prieto Mart=EDnez wrote:
> Yes, It's multi-purpose:=20
> http://www.eneotecnologia.com/products_en.html?TB_iframe=3Dtrue&heigh=
t=3D510&width=3D800
> - Firewall & QoS. High performance statefull firewall and quality of=20
> service.
> - Web cache & content filter. Black and white list mode with LDAP or=20
> AD authentication.
> - VPN. L2TP / IPSEC =96 X.509, NAT Traversal and high availability.=20
> - IPS / IDS. Snort 2.6 based with hardware acceleration.
> - Load balancing. LVS based =96 L3/4 classification, different=20
> algorithms.
> - High availability. VRRP (Router mode) and STP (Bridge mode).
> - Malware. Antivirus (ClamAV, Kaspersky), antispam (DSPAM,=20
> Mailshell), antispyware (Kaspersky, PCTools or Sunbelt) with hardware=
=20
> acceleration.
> - NetFlow probe. NetFlow v5/9 Probe.

*nod*

> We use it in bridge mode, mainly for traffic logging, and sometimes=20
> for packet filtering.

Ok, to me logging is recording information and filtering is either=20
allowing traffic to pass or not.  Based on your original post it sounds=
=20
like you are wanting to do some re-direction of traffic too.  Is this=20
correct?

> I still want the bridge to be totally transparent, and I don't want=20
> to mess with the real IPs, as I don't want the probe to be a single=20
> point of failure. In fact, it's network cards still work as a bridge=20
> when the machine is down.

The bridge can not be totally transparent and change things at the same=
=20
time.  If you are having the bridge change things, the network will=20
operate differently with it in verses out of service.  Please clarify=20
what you are wanting.

> I suppose I should use SNAT, then, as you've stated, but it doesn't=20
> seem to work properly. I'm trying that:
>=20
> # iptables -t nat -A PREROUTING -p tcp -d 192.168.2.1 --dport 80=20
> --to-destination 192.168.2.2:80 -j DNAT
> # iptables -t nat -A POSTROUTING -p tcp --sport 80 -s 192.168.2.2 -d=20
> 192.168.1.0/24 -j SNAT --to-source 192.168.2.1


Remember that IPTables operates on layer 3 and EBTables operates on=20
layer 2.  So unless you have your kernel configured to do such, IPTable=
s=20
will not see layer 2 traffic.  So, either you need to use EBTables=20
(preferred in my opinion) or you need to configure your kernel so that=20
IPTables sees layer 2 traffic.



Grant. . . .
