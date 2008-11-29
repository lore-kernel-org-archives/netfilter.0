From: Zagato <zagato.gekko@gmail.com>
Subject: Re: NAT for locahost to IP LAN for mail services
Date: Fri, 28 Nov 2008 23:06:13 -0500
Message-ID: <98028b00811282006r3dff45a9v7d52ec67077c7109@mail.gmail.com>
References: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com>
	 <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>
	 <492F3057.8010007@plouf.fr.eu.org>
	 <98028b00811271627n45966505pf4fcd3aed4814700@mail.gmail.com>
	 <492FD4BF.6030101@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=QDtADJS5S0Q1C1CQ4fahylDPsnrsHzByqIoJQaLBKsI=;
        b=d0TQyKTAQ0J0TGE44ggjjDijIjQmlO3bhh5TKrO/L0P8+FjMqiszyaiZDPslTqngUT
         RImTuiribquu+10RfCbt+WMeTgMBoz9DcNV1PTxTHHKvZlbkMQBE6aw53K+8zd8GyzFa
         /Wxcu5xzRH/PE3LNY6dp1+SBVLcU5zNSCiQwI=
In-Reply-To: <492FD4BF.6030101@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi.. thanks for the answer... but i really sure that my old rules
works fine on centos 4.2, when i upgrade to 5.2 psql -h localhost -p
5432 test have the same symptomatic, maybe a kernel module that i need
to modoprobe ? what chage that my old rules doesn't work anymore... ?

Centos 5.2 kernel: 2.6.18-92.el5

# lsmod
Module                  Size  Used by
gfs                   306300  1
lock_dlm               56649  2
gfs2                  526189  2 gfs,lock_dlm
dlm                   153441  8 lock_dlm
configfs               62301  2 dlm
xt_mark                35265  1
xt_tcpudp              36417  44
xt_MARK                35649  8
iptable_mangle         36033  1
ip_nat_ftp             36545  0
ip_conntrack_ftp       41489  1 ip_nat_ftp
ipt_MASQUERADE         36801  3
iptable_nat            40773  1
ip_nat                 53100  3 ip_nat_ftp,ipt_MASQUERADE,iptable_nat
ip_conntrack           91237  5
ip_nat_ftp,ip_conntrack_ftp,ipt_MASQUERADE,iptable_nat,ip_nat
nfnetlink              40457  2 ip_nat,ip_conntrack
iptable_filter         36161  1
ip_tables              55329  3 iptable_mangle,iptable_nat,iptable_filt=
er
x_tables               50377  6
xt_mark,xt_tcpudp,xt_MARK,ipt_MASQUERADE,iptable_nat,ip_tables
drbd                  245928  4
ipv6                  420481  57
xfrm_nalgo             43845  1 ipv6
crypto_api             42177  1 xfrm_nalgo
autofs4                57289  2
hidp                   83521  2
rfcomm                104809  0
l2cap                  89281  10 hidp,rfcomm
bluetooth             118597  5 hidp,rfcomm,l2cap
sunrpc                198025  1
dm_mirror              60617  0
dm_multipath           52945  0
dm_mod                 99736  2 dm_mirror,dm_multipath
video                  53197  0
sbs                    49921  0
backlight              39873  1 video
i2c_ec                 38593  1 sbs
button                 40545  0
battery                43849  0
asus_acpi              50917  0
acpi_memhotplug        40133  0
ac                     38729  0
lp                     47121  0
snd_hda_intel          56033  0
snd_hda_codec         308929  1 snd_hda_intel
snd_seq_dummy          37061  0
snd_seq_oss            65473  0
snd_seq_midi_event     41025  1 snd_seq_oss
snd_seq                87777  5 snd_seq_dummy,snd_seq_oss,snd_seq_midi_=
event
snd_seq_device         41557  3 snd_seq_dummy,snd_seq_oss,snd_seq
snd_pcm_oss            77505  0
snd_mixer_oss          49985  1 snd_pcm_oss
snd_pcm               116681  3 snd_hda_intel,snd_hda_codec,snd_pcm_oss
sg                     69993  0
nvidia               7844008  0
snd_timer              57161  2 snd_seq,snd_pcm
snd                    95977  9
snd_hda_intel,snd_hda_codec,snd_seq_oss,snd_seq,snd_seq_device,snd_pcm_=
oss,snd_mixer_oss,snd_pcm,snd_timer
soundcore              41825  1 snd
i2c_i801               41685  0
i2c_core               56129  3 i2c_ec,nvidia,i2c_i801
snd_page_alloc         44113  2 snd_hda_intel,snd_pcm
ide_cd                 73697  0
pcspkr                 36289  0
shpchp                 70765  0
8139too                61121  0
e1000e                133889  0
parport_pc             62313  1
serio_raw              40517  0
8139cp                 58049  0
mii                    38849  2 8139too,8139cp
cdrom                  68713  1 ide_cd
parport                73165  2 lp,parport_pc
r8169                  65737  0
sata_sil               45769  0
ata_piix               54981  6
libata                192345  2 sata_sil,ata_piix
sd_mod                 56257  8
scsi_mod              188665  3 sg,libata,sd_mod
raid1                  56001  3
ext3                  167249  1
jbd                    93873  1 ext3
uhci_hcd               57433  0
ohci_hcd               54493  0
ehci_hcd               65741  0


On Fri, Nov 28, 2008 at 6:23 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Zagato a =E9crit :
>>
>> cant't i redirect the packect from 127.0.0.1 to 192.168.0.5 and then
>> 192.168.0.3 ?... so 127.0.0.1 and 192.168.0.5 are in the same host a=
nd
>> 0.3 its  another phisical PC.... this it's possible ?
>
> Not using iptables. However it is possible using a TCP relay/proxy su=
ch as
> rinetd, socat, redir, stone, simpleproxy... which opens a listening s=
ocket
> on the local machine and forwards any connection to a remote host. Th=
is does
> not require NAT at all.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



--=20
=46arewell.
http://www.youtube.com/zagatogekko
ruby << __EOF__
  puts [ 111, 116, 97, 103, 97, 90 ].collect{|v| v.chr}.join.reverse
__EOF__
