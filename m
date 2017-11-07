From: paulo bruck <paulobruck1@gmail.com>
Subject: packages leaving interface wrongly using loadbalance
Date: Tue, 7 Nov 2017 10:05:56 -0200
Message-ID: <CANSGRxQkCfa8FSQ+RPdZ2sv54hL=srh0G80Rdad7tyZ6Ude_TA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=KXmBUZm1lEi1HUrogxvG7yzOZ0kjmMRu2oP8Wj1VExA=;
        b=K9KOns+m4J1H73gry7dMOlokj6C5xOfeN5Fu+UmJi1QEsLZyu85xwJNBnmUDI5NAnj
         VKjqi/eESRblZKzYLD9ck1alAOfdLm/wpJuK5r2zBQaqYgD9dpBEjAnpDNsqm8Fj+G0U
         colffzK8X8vnB1IXtsjQxjLyvHvWMjHriSYYMZjxyXxk6fN2+ylO6R1ucr+akA5lrIml
         EgdywS9mUvlocqlDa0Zjq7rHDMFaKlbRtHP4EXQgbQZ3geVCNJTHSOGnxubzeNFt3pMH
         Tllly3/xY+TUxIQpfPr+jmmyiDeINf36Eme7UOfNpIMCY9wskLypU6sEaA4nTsqDp/vX
         GCRw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hy Guys

I have been looking at a lot of articles about loadbalance using
CONNMARK and MARK and last one that I've been using is this one:
http://www.system-rescue-cd.org/networking/Load-balancing-using-iptables-wi=
th-connmark/

What I have

                 |- enp7s0/192.168.1.2  ----
192.168.10.0/24  ------- bridge--- firewall with squid and   |
                 INTERNET
LAN                       lan         KVM witch email server |-
enp6s1/201.6.110.xxx ---

One of my problems is this:
17 109 src=3D192.168.10.21 dst=3D203.40.114.110 sport=3D51413 dport=3D27363
src=3D203.40.114.110 dst=3D201.6.110.xxx sport=3D27363 dport=3D51413 [ASSUR=
ED]
mark=3D1 use=3D1                  ^^^^^^^^^^^^^^
^^^^^^

How can a package with mark=3D1 ( interface enp7s0) with
dst=3D201.6.110.xxx ( interface enp6s1) ???

Second problem that I see is a lot of packages leaving interface
wrongly, some witn LAN source??? and other with wrong ip...

root@zeus:~# tcpdump -nlpqti enp7s0 host ! 192.168.1.2 and ! arp and ! ip6
listening on enp7s0, link-type EN10MB (Ethernet), capture size 262144 bytes
IP 192.168.10.21.51997 > 90.218.125.212.47783: tcp 68 ( leaving enp7s0
with lan IP???? )
IP 201.6.110.xxx.57758 > 101.161.18.62.40501: tcp 0 ( leaving enp7s0
with ip of enp6s1 ????)
IP 201.6.110.xxx.59994 > 122.60.107.155.46882: tcp 0

Need a little help to understand what is going on. Its a routing
problem or a wrong iptables rule?

  -----cut ---- long description........8)

lan bridge:
iface lan inet static
    address 192.168.10.1
    netmask 24
    bridge_ports enp2s0

ip r l
default
        nexthop via 192.168.1.1  dev enp7s0 weight 95
        nexthop via 201.6.110.xx  dev enp6s1 weight 5
192.168.1.0/24 dev enp7s0 proto kernel scope link src 192.168.1.2
192.168.10.0/24 dev lan proto kernel scope link src 192.168.10.1
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1
201.6.110.0/24 dev enp6s1 proto kernel scope link src 201.6.110.xxx

ip rule list
0:      from all lookup local
32764:  from all fwmark 0x2 lookup WAN2
32765:  from all fwmark 0x1 lookup WAN1
32766:  from all lookup main
32767:  from all lookup default

ip r list table WAN1
default via 192.168.1.1 dev enp7s0
127.0.0.0/8 dev lo scope link
192.168.1.0/24 via 192.168.1.2 dev enp7s0
192.168.10.0/24 via 192.168.10.1 dev lan
192.168.122.0/24 via 192.168.122.1 dev virbr0
201.6.110.0/24 via 201.6.110.xxx dev enp6s1

ip r l table WAN2
default via 201.6.110.1 dev enp6s1
127.0.0.0/8 dev lo scope link
192.168.1.0/24 via 192.168.1.2 dev enp7s0
192.168.10.0/24 via 192.168.10.1 dev lan
192.168.122.0/24 via 192.168.122.1 dev virbr0
201.6.110.0/24 via 201.6.110.xxx dev enp6s1

nat
:PREROUTING ACCEPT [1237557:94155847]
:INPUT ACCEPT [645507:33422396]
:OUTPUT ACCEPT [490708:24863013]
:POSTROUTING ACCEPT [450139:21814195]
-A PREROUTING -d 192.168.1.2/32 -i enp7s0 -p tcp -m multiport --dports
25 -m comment --comment "mercurio#6" -j DNAT --to-destination
192.168.122.2
-A PREROUTING -d 201.6.110.xxx/32 -i enp6s1 -p tcp -m multiport
--dports 25 -m comment --comment "mercurio#7" -j DNAT --to-destination
192.168.122.2

-A POSTROUTING -s 192.168.122.2/32 -o enp6s1 -m comment --comment
redir_externo_do_email -j SNAT --to-source 201.6.110.xxx
-A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -m comment
--comment " saida padr=C3=A3o do POSTROUTING da placa VIRBR0" -j MASQUERADE
-A POSTROUTING -o enp7s0 -m comment --comment " saida padr=C3=A3o do
POSTROUTING da 192.168.1.2" -j SNAT --to-source 192.168.1.2
-A POSTROUTING -o enp6s1 -m comment --comment " saida padr=C3=A3o do
POSTROUTING da 201.6.110.xxx" -j SNAT --to-source 201.6.110.xxx

mangle
-A PREROUTING -s 192.168.122.2/32 -d 192.168.10.0/24 -i virbr0 -j ACCEPT
-A PREROUTING -i virbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A PREROUTING -s 192.168.122.2/32 -i virbr0 -p tcp -m multiport
--dports 25 -m comment --comment "mercurio#5" -m conntrack --ctstate
NEW -j MARK --set-xmark 0x2/0xffffffff
-A PREROUTING -i virbr0 -j CONNMARK --save-mark --nfmask 0xffffffff
--ctmask 0xffffffff
-A PREROUTING -d 192.168.122.0/24 -i lan -j ACCEPT
-A PREROUTING -i lan -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A PREROUTING -i lan -p udp -m multiport --dports 15000:16000 -m
comment --comment saida_do_80_e_443_preferencial_pelo_SPeedy -m
conntrack --ctstate NEW -j MARK --set-xmark 0x1/0xffffffff
-A PREROUTING -i lan -p tcp -m multiport --dports
80,443,8080,873,15000:16000 -m comment --comment
saida_do_80_e_443_preferencial_pelo_SPeedy -m conntrack --ctstate NEW
-j MARK --set-xmark 0x1/0xffffffff
-A PREROUTING -i lan -j CONNMARK --save-mark --nfmask 0xffffffff
--ctmask 0xffffffff
-A PREROUTING -d 192.168.122.0/24 -i lan -j ACCEPT
-A PREROUTING -i lan -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A PREROUTING -i lan -m conntrack --ctstate NEW -m statistic --mode
random --probability 0.95000000019 -j CONNMARK1
-A PREROUTING -i lan -m conntrack --ctstate NEW -m statistic --mode
random --probability 0.04999999981 -j CONNMARK2
-A PREROUTING -d 192.168.10.0/24 -i virbr0 -j ACCEPT
-A PREROUTING -i virbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A PREROUTING -i virbr0 -m conntrack --ctstate NEW -m statistic --mode
random --probability 0.95000000019 -j CONNMARK1
-A PREROUTING -i virbr0 -m conntrack --ctstate NEW -m statistic --mode
random --probability 0.04999999981 -j CONNMARK2

-A PREROUTING -i enp7s0 -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A PREROUTING -i enp7s0 -m conntrack --ctstate NEW -j MARK --set-xmark
0x1/0xffffffff
-A PREROUTING -i enp7s0 -j CONNMARK --save-mark --nfmask 0xffffffff
--ctmask 0xffffffff
-A PREROUTING -i enp6s1 -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A PREROUTING -i enp6s1 -m conntrack --ctstate NEW -j MARK --set-xmark
0x2/0xffffffff
-A PREROUTING -i enp6s1 -j CONNMARK --save-mark --nfmask 0xffffffff
--ctmask 0xffffffff

-A OUTPUT -o enp7s0 -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A OUTPUT -o enp7s0 -p tcp -m multiport --dports
21,21,80,443,563,15000:16000 -m comment --comment "pacotes do squid
via link1" -m conntrack --ctstate NEW -j MARK --set-xmark
0x1/0xffffffff
-A OUTPUT -o enp7s0 -p udp -m multiport --dports 15000:16000 -m
comment --comment "pacotes do squid via link1" -m conntrack --ctstate
NEW -j MARK --set-xmark 0x1/0xffffffff
-A OUTPUT -o enp7s0 -j CONNMARK --save-mark --nfmask 0xffffffff
--ctmask 0xffffffff
-A OUTPUT -o enp7s0 -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A OUTPUT -o enp7s0 -m conntrack --ctstate NEW -j MARK --set-xmark
0x1/0xffffffff
-A OUTPUT -o enp7s0 -j CONNMARK --save-mark --nfmask 0xffffffff
--ctmask 0xffffffff
-A OUTPUT -o enp6s1 -m conntrack --ctstate RELATED,ESTABLISHED -j
CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A OUTPUT -o enp6s1 -m conntrack --ctstate NEW -j MARK --set-xmark
0x2/0xffffffff
-A OUTPUT -o enp6s1 -j CONNMARK --save-mark --nfmask 0xffffffff
--ctmask 0xffffffff
-A CONNMARK1 -j MARK --set-xmark 0x1/0xffffffff
-A CONNMARK1 -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xfffffff=
f
-A CONNMARK2 -j MARK --set-xmark 0x2/0xffffffff
-A CONNMARK2 -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xfffffff=
f
COMMIT


any help would be very appreciated

thanks in advanced


--=20
Paulo Ricardo Bruck consultor
tel 011 3596-4881/4882  011 98140-9184 (TIM)
http://www.contatogs.com.br
http://www.protejasuarede.com.br
gpg AAA59989 at wwwkeys.us.pgp.net
