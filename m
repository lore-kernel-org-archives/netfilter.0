From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Subject: Re: Problem with IPv6 tunnel
Date: Thu, 9 Jul 2009 13:48:17 +0200
Message-ID: <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Lq0j8TKPqLunfBoNw+Qpfr4/qcXnuDXFg1ZYxiTWxlI=;
        b=VhdJsDHCsRncXXANnQ1+DpdmNNjpicWBRXVUoWpnaD6sy7UuHlrZJnz0JOtYs6+8U4
         TeF6JOPJvG1fFfwmRdgvnPPz74flLOgC/fuZgQ9yHxUwYCZfeihktuyD2sZrOCUFINW5
         5NdN/a1cu8YLSL+blTA0r8CT+x3NSjvMzGRbI=
In-Reply-To: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hmm, I replaced the rule as suggested, but something still does not
work correctly.

Any idea ?
Is there a way to check currently active tracked "connection" and see
there some clues as to what additional
rule(s) I need ?

Here is my current output of "iptables -t nat -L -v " :

Chain NEW (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
50876 4029K RETURN     all  --  any    any     anywhere
anywhere            limit: avg 50/sec burst 100
    0     0 DROP       all  --  any    any     anywhere             any=
where

Chain PREROUTING (policy ACCEPT 1895K packets, 199M bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
50876 4029K NEW        all  --  any    any     anywhere
anywhere            state NEW
50876 4029K prerouting_rule  all  --  any    any     anywhere
   anywhere
 9546 1060K prerouting_wan  all  --  ppp0   any     anywhere
  anywhere

Chain POSTROUTING (policy ACCEPT 168K packets, 12M bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
40337 3020K postrouting_rule  all  --  any    any     anywhere
    anywhere
39964 2984K MASQUERADE !ipv6 --  any    ppp0    anywhere             an=
ywhere

Chain OUTPUT (policy ACCEPT 17461 packets, 2006K bytes)
 pkts bytes target     prot opt in     out     source               des=
tination

Chain postrouting_rule (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination

Chain prerouting_rule (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination

Chain prerouting_wan (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
    1    60 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:21
   16   864 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:22
    7   336 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:24
    0     0 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:110
    0     0 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:230
    0     0 ACCEPT     udp  --  any    any     anywhere
anywhere            udp dpt:4500
(and a few port forwarding for the LAN here)

And the "iptables -L -v" output:

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
   32  4264 DROP       all  --  any    any     anywhere
anywhere            state INVALID
23403 2529K ACCEPT     all  --  any    any     anywhere
anywhere            state RELATED,ESTABLISHED
   81  3240 DROP       tcp  --  any    any     anywhere
anywhere            tcp option=3D!2 flags:SYN/SYN
17118 1689K input_rule  all  --  any    any     anywhere             an=
ywhere
 9236 1045K input_wan  all  --  ppp0   any     anywhere             any=
where
17094 1688K LAN_ACCEPT  all  --  any    any     anywhere             an=
ywhere
   19  1300 ACCEPT     icmp --  any    any     anywhere             any=
where
    0     0 ACCEPT     gre  --  any    any     anywhere             any=
where
 1136 57040 REJECT     tcp  --  any    any     anywhere
anywhere            reject-with tcp-reset
 9856 1051K REJECT     all  --  any    any     anywhere
anywhere            reject-with icmp-port-unreachable

Chain FORWARD (policy DROP 21 packets, 1008 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 DROP       all  --  any    any     anywhere
anywhere            state INVALID
50766 2459K TCPMSS     tcp  --  any    any     anywhere
anywhere            tcp flags:SYN,RST/SYN TCPMSS clamp to PMTU
2626K 2096M ACCEPT     all  --  any    any     anywhere
anywhere            state RELATED,ESTABLISHED
36511 2559K forwarding_rule  all  --  any    any     anywhere
   anywhere
  377 19604 forwarding_wan  all  --  ppp0   any     anywhere
  anywhere
    0     0 ACCEPT     all  --  br0    br0     anywhere             any=
where
36134 2540K ACCEPT     all  --  br0    ppp0    anywhere             any=
where

Chain LAN_ACCEPT (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
 9212 1044K RETURN     all  --  ppp0   any     anywhere             any=
where
 1799 64764 RETURN     all  --  vlan1  any     anywhere             any=
where
 6083  579K ACCEPT     all  --  any    any     anywhere             any=
where

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 DROP       all  --  any    any     anywhere
anywhere            state INVALID
33066 5111K ACCEPT     all  --  any    any     anywhere
anywhere            state RELATED,ESTABLISHED
 4131  488K output_rule  all  --  any    any     anywhere             a=
nywhere
 4131  488K ACCEPT     all  --  any    any     anywhere             any=
where
    0     0 REJECT     tcp  --  any    any     anywhere
anywhere            reject-with tcp-reset
    0     0 REJECT     all  --  any    any     anywhere
anywhere            reject-with icmp-port-unreachable

Chain forwarding_rule (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 ACCEPT     all  --  tun+   any     anywhere             any=
where

Chain forwarding_wan (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 ACCEPT     tcp  --  any    any     anywhere
192.168.200.20      tcp dpt:13789
    0     0 ACCEPT     udp  --  any    any     anywhere
192.168.200.20      udp dpt:41234
    0     0 ACCEPT     tcp  --  any    any     anywhere
192.168.200.20      tcp dpt:7234
  135  7988 ACCEPT     tcp  --  any    any     anywhere
192.168.200.21      tcp dpt:44210
    0     0 ACCEPT     tcp  --  any    any     anywhere
192.168.200.21      tcp dpt:59876
    0     0 ACCEPT     udp  --  any    any     anywhere
192.168.200.21      udp dpt:58932
    0     0 ACCEPT     tcp  --  any    any     anywhere
192.168.200.20      tcp dpt:1194
    0     0 ACCEPT     udp  --  any    any     anywhere
192.168.200.20      udp dpt:1194
    0     0 ACCEPT     tcp  --  any    any     anywhere
192.168.200.20      tcp dpt:3389
    0     0 ACCEPT     tcp  --  any    any     anywhere
192.168.200.120     tcp dpt:23966
    0     0 ACCEPT     tcp  --  any    any     anywhere
192.168.200.95      tcp dpt:5001
    0     0 ACCEPT     udp  --  any    any     anywhere
192.168.200.95      udp dpt:5002

Chain input_rule (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 ACCEPT     all  --  tun+   any     anywhere             any=
where

Chain input_wan (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
    1    60 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:21
   16   864 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:22
    7   336 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:24
    0     0 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:110
    0     0 ACCEPT     tcp  --  any    any     anywhere
anywhere            tcp dpt:230
    0     0 ACCEPT     udp  --  any    any     anywhere
anywhere            udp dpt:4500

Chain output_rule (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination


Maybe add a ACCEPT rule for proto 41 in rule "input_wan" ?

Thanks for any help!

David

2009/6/19 David Bala=C5=BEic <xerces9@gmail.com>:
> Hi!
>
> I have set up a (SixXS[1]) IPv6 tunnel on my linux router and have th=
e
> problem, that after a while I become unavailable over IPv6 for the
> outside world.
> Then I I perform some IPv6 activity, like "ping6 ipv6.google.com" I
> become accessible again for a while.
>
> A SixXS FAQ entry[2] suggests adding an iptables rule:
> =C2=A0iptables -t nat -A POSTROUTING --proto ! 41 -o [Your IPv4 Inter=
face]
> -j MASQUERADE
>
> This way I get (iptables -t nat -L ...):
>
> Chain POSTROUTING (policy ACCEPT)
> target =C2=A0 =C2=A0 prot opt source =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 destination
> postrouting_rule =C2=A0all =C2=A0-- =C2=A0anywhere =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 anywhere
> MASQUERADE =C2=A0all =C2=A0-- =C2=A0anywhere =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 anywhere
> MASQUERADE !ipv6 -- =C2=A0anywhere =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 anywhere =C2=A0# the added rule
>
> I am not an iptables expert, but to me it seems the first MASQUERADE
> rule matches all packets and the new one does not make any difference=
=2E
> Can someone confirm that ?
>
>
> More info:
>
> kernel 2.4.30 (OpenWRT 1.0 - update is not really an option, unfortun=
ately)
> iptables v1.3.3
>
> tunnel set up by AICCU 2007.01.15-console by Jeroen Massar
> tunnel config excerpt:
>
> # Protocol and server to use for setting up the tunnel (defaults: non=
e)
> #protocol <tic|tsp|l2tp>
> #server <server to use>
> protocol tic
> server tic.sixxs.net
>
> ipv6_interface sixxs
>
> Tunnel type: 6in4-heartbeat
>
> Regards,
> David
>
>
> [1] https://www.sixxs.net/
> [2] https://www.sixxs.net/faq/connectivity/?faq=3Dconntracking
>
