From: benjamin fernandis <benjo11111@gmail.com>
Subject: internet sharing issue
Date: Tue, 4 Jan 2011 08:45:44 +0530
Message-ID: <AANLkTik6WP-fKZK+a4x7E4r8vW10TLH+6=HSWp2MQvry@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=n7+qxU9GdHmGUBv83sGUX5ijqRvM7mmPSb+Z92uQLSw=;
        b=k9KoPmKw9MAjQrFVyO8wahc8NnA/l3WRTlGuQG6uqGw5man6hHCDGTCGKLTXj5wJrO
         h14XxbkySEKv9RKptJAUte4dKQigahdUiiJm1HpAS/qGP2J5EUys2PQJ+tDpWppPMtRO
         jmF06Ai1LCCXgEVSgxcNI/VN38kv0V2av9E4A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Friends,

I have rhel 5.5 on that i compiled kernel 2.6.36.2 and iptables 1.4.9 .

After that i configured basic internet sharing setings in iptables.

Iptables rule :
[root@localhost ~]# iptables -L -nvx -t nat
Chain PREROUTING (policy ACCEPT 9 packets, 1068 bytes)
    pkts      bytes target     prot opt in     out     source
     destination

Chain INPUT (policy ACCEPT 1 packets, 28 bytes)
    pkts      bytes target     prot opt in     out     source
     destination

Chain OUTPUT (policy ACCEPT 58 packets, 6477 bytes)
    pkts      bytes target     prot opt in     out     source
     destination

Chain POSTROUTING (policy ACCEPT 55 packets, 6225 bytes)
    pkts      bytes target     prot opt in     out     source
     destination
       3      252 MASQUERADE  all  --  *      *       10.10.10.0/24
    0.0.0.0/0
[root@localhost ~]#

and also i enabled ip_forward.

net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 4294967295
kernel.shmall = 268435456

at my gateway internet is working fine.But from my client net is not working.

At gateway I have 2 lan card.

eth0 ----- LAN
eth2 ------ WAN

[root@localhost ~]# ping google.com
PING google.com (209.85.175.105) 56(84) bytes of data.
64 bytes from 209.85.175.105: icmp_seq=1 ttl=54 time=131 ms
64 bytes from 209.85.175.105: icmp_seq=2 ttl=53 time=132 ms
64 bytes from 209.85.175.105: icmp_seq=3 ttl=54 time=1416 ms
^C
--- google.com ping statistics ---
4 packets transmitted, 3 received, 25% packet loss, time 3011ms
rtt min/avg/max/mdev = 131.257/560.093/1416.379/605.485 ms, pipe 2

When try to ping from lan interface :

[root@localhost ~]# ping -I eth0 google.com
PING google.com (209.85.175.99) from 10.10.10.1 eth0: 56(84) bytes of data.
From 10.10.10.1 icmp_seq=1 Destination Host Unreachable
From 10.10.10.1 icmp_seq=2 Destination Host Unreachable
From 10.10.10.1 icmp_seq=3 Destination Host Unreachable
^C
--- google.com ping statistics ---
5 packets transmitted, 0 received, +3 errors, 100% packet loss, time 4307ms
, pipe 3
[root@localhost ~]#


But i can see traffic in iptables counter,

Chain POSTROUTING (policy ACCEPT 60 packets, 6563 bytes)
    pkts      bytes target     prot opt in     out     source
     destination
       4      336 MASQUERADE  all  --  *      *       10.10.10.0/24
    0.0.0.0/0

But internet is not workig.


lsmod

[root@localhost ~]# lsmod
Module                  Size  Used by
iptable_filter           820  0
iptable_mangle           884  0
i915                  240533  3
drm_kms_helper         18783  1 i915
drm                   120886  4 i915,drm_kms_helper
i2c_algo_bit            3386  1 i915
ipt_MASQUERADE          1062  1
iptable_nat             2607  1
nf_nat                  9665  2 ipt_MASQUERADE,iptable_nat
nf_conntrack_ipv4       6760  3 iptable_nat,nf_nat
nf_conntrack           34118  4
ipt_MASQUERADE,iptable_nat,nf_nat,nf_conntrack_ipv4
nf_defrag_ipv4           783  1 nf_conntrack_ipv4
ip_tables               7407  3 iptable_filter,iptable_mangle,iptable_nat
x_tables                9216  5
iptable_filter,iptable_mangle,ipt_MASQUERADE,iptable_nat,ip_tables
loop                    9424  0
dm_multipath           11843  0
scsi_dh                 3552  1 dm_multipath
sbs                     8372  0
sbshc                   2640  1 sbs
power_meter             6654  0
hwmon                    969  1 power_meter
battery                 7924  0
ac                      2339  0
ipv6                  185553  16
parport_pc             16614  0
lp                      6265  0
parport                22051  2 parport_pc,lp
snd_hda_codec_realtek   185743  1
snd_hda_intel          16812  1
snd_hda_codec          50969  2 snd_hda_codec_realtek,snd_hda_intel
snd_hwdep               3843  1 snd_hda_codec
option                 12746  0
usb_wwan                5852  1 option
usbserial              20864  2 option,usb_wwan
video                  10243  1 i915
snd_seq_dummy            895  0
r8169                  27425  0
via_rhine              15349  0
output                  1168  1 video
sg                     20335  0
8139too                14258  0
8139cp                 13340  0
serio_raw               3000  0
mii                     2694  4 r8169,via_rhine,8139too,8139cp
snd_seq_oss            19639  0
sr_mod                 10982  0
snd_seq_midi_event      3672  1 snd_seq_oss
snd_seq                33166  5 snd_seq_dummy,snd_seq_oss,snd_seq_midi_event
cdrom                  25596  1 sr_mod
snd_seq_device          3597  3 snd_seq_dummy,snd_seq_oss,snd_seq
floppy                 41084  0
button                  3658  1 i915
rtc_cmos                6782  0
tpm_tis                 5316  0
tpm                     7833  1 tpm_tis
rtc_core                8821  1 rtc_cmos
rtc_lib                 1309  1 rtc_core
snd_pcm_oss            29291  0
snd_mixer_oss          11302  1 snd_pcm_oss
tpm_bios                3732  1 tpm
i2c_i801                6214  0
pcspkr                  1239  0
i2c_core               12479  5 i915,drm_kms_helper,drm,i2c_algo_bit,i2c_i801
snd_pcm                47344  3 snd_hda_intel,snd_hda_codec,snd_pcm_oss
snd_timer              12188  2 snd_seq,snd_pcm
snd                    32851  13
snd_hda_codec_realtek,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_seq_oss,snd_seq,snd_seq_device,snd_pcm_oss,snd_mixer_oss,snd_pcm,snd_timer
soundcore               3641  1 snd
snd_page_alloc          4933  2 snd_hda_intel,snd_pcm
dm_snapshot            23326  0
dm_zero                  755  0
dm_mirror               9902  0
dm_region_hash          5184  1 dm_mirror
dm_log                  6599  2 dm_mirror,dm_region_hash
dm_mod                 47695  14
dm_multipath,dm_snapshot,dm_zero,dm_mirror,dm_log
ata_piix               17583  2
libata                116074  1 ata_piix
sd_mod                 21375  3
scsi_mod              129490  5 scsi_dh,sg,sr_mod,libata,sd_mod
ext3                   93629  3
jbd                    31506  1 ext3
uhci_hcd               15194  0
ohci_hcd               16145  0
ehci_hcd               28370  0
[root@localhost ~]#

Please guide me for the same.

Is there any configuration issue or.............?

Thanks,
Benjamin
