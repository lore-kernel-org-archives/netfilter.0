From: Michal Semler <cijoml@volny.cz>
Subject: Windows CISCO VPN Client 4.0.2D behind NAT only authenticates,
	but no other data received
Date: Fri, 3 Feb 2006 23:35:56 +0100
Message-ID: <200602032335.56608.cijoml@volny.cz>
Reply-To: cijoml@volny.cz
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi Team,

I have a very simple network:

internet----ppp0-server-wlan0----clients

ppp0      Zapouzd=F8en=ED:Point-to-Point Protokol
          inet adr:10.162.144.241  P-t-P:10.160.4.6 Maska:255.255.255.255
          AKTIVOV=C1NO POINTOPOINT B=CC=AE=CD NEARP MULTICAST  MTU:1500  Me=
trika:1
          RX packets:68884 errors:316 dropped:0 overruns:0 frame:0
          TX packets:64561 errors:0 dropped:0 overruns:0 carrier:0
          koliz=ED:0 d=E9lka odchoz=ED fronty:3
          RX bytes:57629414 (54.9 MiB)  TX bytes:6763931 (6.4 MiB)

wlan0     Zapouzd=F8en=ED:Ethernet  HWadr 00:60:B3:7A:9D:35
          inet adr:192.168.56.1  V=B9esm=ECr:192.168.56.255 Maska:255.255.2=
55.0
          AKTIVOV=C1NO V=A9ESM=CCROV=C9_VYS=CDL=C1N=CD B=CC=AE=CD MULTICAST=
  MTU:1500  Metrika:1
          RX packets:5393 errors:0 dropped:1945 overruns:0 frame:0
          TX packets:6236 errors:0 dropped:0 overruns:0 carrier:0
          koliz=ED:0 d=E9lka odchoz=ED fronty:0
          RX bytes:653817 (638.4 KiB)  TX bytes:5488835 (5.2 MiB)
          P=F8eru=B9en=ED:3 Vstupn=EC/V=FDstupn=ED port:0x3100

notas:/home/cijoml# route -n
Sm=ECrovac=ED tabulka v j=E1dru pro IP
Adres=E1t         Br=E1na           Maska           P=F8=EDzn Metrik Odkaz =
 U=BEt=20
Rozhran=ED
10.160.4.6      0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
192.168.56.0    0.0.0.0         255.255.255.0   U     0      0        0 wla=
n0
0.0.0.0         0.0.0.0         0.0.0.0         U     0      0        0 ppp0

Clients has 192.168.56.2-246

My script looks like:

MODPROBE=3D/sbin/modprobe
NETWORK=3D192.168.56.0
NETMASK=3D255.255.255.0
$MODPROBE iptable_nat
$MODPROBE ip_conntrack_ftp
$MODPROBE ip_nat_ftp
$MODPROBE ip_nat_irc
case "$1" in
        start)
        echo "Starting IP Masquerading"
        iptables -t nat -A POSTROUTING -o ppp0 -s $NETWORK/24 -d 0/0 -j=20
MASQUERADE
        iptables -A FORWARD -s $NETWORK/24 -d 0/0 -j ACCEPT
        echo 1 > /proc/sys/net/ipv4/ip_forward
        #firewall pro CISCO VPN CLIENT
        iptables -A FORWARD -p 50 -j ACCEPT                     #ESP protok=
ol
        iptables -A FORWARD -p udp --dport 500 -j ACCEPT        #IKE daemon
        iptables -A FORWARD -p udp --dport 10000 -j ACCEPT

#NAT-T
iptables -A FORWARD -p udp --dport 4500 -j ACCEPT

=2D---
notas:/home/cijoml# lsmod
Module                  Size  Used by
ip_gre                 12448  0
arc4                    1920  0
ieee80211_crypt_wep     4736  0
iptable_filter          2944  1
ipt_MASQUERADE          3328  1
ip_nat_irc              2560  0
ip_conntrack_irc        6640  1 ip_nat_irc
ip_nat_ftp              3200  0
ip_conntrack_ftp        7536  1 ip_nat_ftp
iptable_nat             7428  1
ip_nat                 17196  4=20
ipt_MASQUERADE,ip_nat_irc,ip_nat_ftp,iptable_nat
ip_tables              19584  3 iptable_filter,ipt_MASQUERADE,iptable_nat
ip_conntrack           48940  7=20
ipt_MASQUERADE,ip_nat_irc,ip_conntrack_irc,ip_nat_ftp,ip_conntrack_ftp,ipta=
ble_nat,ip_nat
hostap_cs              54936  3
hostap                 97796  1 hostap_cs
ieee80211_crypt         6016  2 ieee80211_crypt_wep,hostap
acerhk                 28156  0
snd_pcm_oss            46752  0
snd_mixer_oss          16768  1 snd_pcm_oss
bsd_comp                5760  0
ppp_async              10624  1
crc_ccitt               2176  1 ppp_async
ppp_generic            25620  6 bsd_comp,ppp_async
slhc                    6656  1 ppp_generic
hci_usb                14740  6
bnep                   14848  2
rfcomm                 35352  11
hidp                   15616  2
l2cap                  23556  14 bnep,rfcomm,hidp
bluetooth              44260  17 hci_usb,bnep,rfcomm,hidp,l2cap
ide_cd                 36996  0
cdrom                  34208  1 ide_cd
parport_pc             32324  0
parport                33736  1 parport_pc
8139too                24320  0
mii                     5376  1 8139too
snd_intel8x0m          16396  4
8250_pci               18688  0
8250                   20308  1 8250_pci
serial_core            19968  1 8250
snd_intel8x0           30108  0
snd_ac97_codec         82464  2 snd_intel8x0m,snd_intel8x0
snd_ac97_bus            2304  1 snd_ac97_codec
snd_pcm                80648  6=20
snd_pcm_oss,snd_intel8x0m,snd_intel8x0,snd_ac97_codec
snd_timer              22916  1 snd_pcm
snd                    48996  13=20
snd_pcm_oss,snd_mixer_oss,snd_intel8x0m,snd_intel8x0,snd_ac97_codec,snd_pcm=
,snd_timer
snd_page_alloc         10248  3 snd_intel8x0m,snd_intel8x0,snd_pcm
ehci_hcd               30344  0
cdc_acm                13600  2
usbhid                 34976  0
uhci_hcd               29712  0
nls_iso8859_2           4736  1
ntfs                  193424  1
rtc                    12724  0

Client has logged to the network, but no data received.=20
Can you please help? I need many clients working at same time, if possible.

Can you please fix my iptables entries to get this work?
All other services are working fine.

Thanks

Michal

