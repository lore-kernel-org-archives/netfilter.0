From: Prashant Batra <prashant0100@gmail.com>
Subject: Re: Working example for NETLINK_FIREWALL protocol
Date: Fri, 7 Oct 2011 16:04:19 +0530
Message-ID: <CAG+XuE422ezp2JgCedHMbLVzvQp0hYkfjqbeZFxdE7qKOSre=A@mail.gmail.com>
References: <CAG+XuE4feu1qKw4HGu5vivJRrFaZyFHFGRw362QvPJR4TGkNig@mail.gmail.com>
	<1317964165.8681.2.camel@hakkenden.homenet>
	<CAG+XuE7hDq_j2mTEFd9v9fi7PZO1ECdpScwEV_1JtMg4GqKeNw@mail.gmail.com>
	<1317969880.8681.5.camel@hakkenden.homenet>
	<CAG+XuE4w7Z8MgvWViKom85bK68rZzXq403Nfj_RhcEpUVACwrA@mail.gmail.com>
	<1317981623.8681.17.camel@hakkenden.homenet>
	<CAG+XuE7A7L-P13yt-+riP=9Gjgqi2Eom9iW_s=joQCOCkuHRpA@mail.gmail.com>
	<1317983194.8681.19.camel@hakkenden.homenet>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=vcGGfAl3hGR1GPgfcMfAPxOya4y787oJYKZUDQ0vpA8=;
        b=G1WVlj52Kv0CfMz8nB751g8NxrjWWCPI7Dmx0ewyzI/SRvhB3doec0po1sMZ4Edtq4
         7xq/iDSwwPxyXF25o7BRIDup6iWfavP6RMnagOxW/hlugUuusv7YgXZH9u+qyoWDl5zF
         KbnCYGExmTWDR0+BdAkzp55VIxLwmPKxkvWak=
In-Reply-To: <1317983194.8681.19.camel@hakkenden.homenet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

This works.

Thanks a lot. To increase my knowledge, can you tell, why this was not
working with ip_queue module loaded.



On Fri, Oct 7, 2011 at 3:56 PM, Nikolay S. <nowhere@hakkenden.ath.cx> w=
rote:
> =D0=92 =D0=9F=D1=82=D0=BD, 07/10/2011 =D0=B2 15:55 +0530, Prashant Ba=
tra =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> cat /proc/net/netfilter/nf_queue
>> =C2=A00 NONE
>> =C2=A01 NONE
>> =C2=A02 ip_queue
>> =C2=A03 NONE
>> =C2=A04 NONE
>> =C2=A05 NONE
>> =C2=A06 NONE
>> =C2=A07 NONE
>> =C2=A08 NONE
>> =C2=A09 NONE
>> 10 NONE
>> 11 NONE
>> 12 NONE
>>
>
> Can you please unload ip_queue module and run the sample one more tim=
e?
>
>>
>> On Fri, Oct 7, 2011 at 3:30 PM, Nikolay S. <nowhere@hakkenden.ath.cx=
> wrote:
>> > =D0=92 =D0=9F=D1=82=D0=BD, 07/10/2011 =D0=B2 12:20 +0530, Prashant=
 Batra =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> >> perror gives : Invalid argument (errno 22)
>> >
>> > Could you please
>> > cat /proc/net/netfilter/nf_queue
>> > ?
>> >
>> >>
>> >> On Fri, Oct 7, 2011 at 12:14 PM, Nikolay S. <nowhere@hakkenden.at=
h.cx> wrote:
>> >> > =D0=92 =D0=9F=D1=82=D0=BD, 07/10/2011 =D0=B2 11:55 +0530, Prash=
ant Batra =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> >> >> On Fri, Oct 7, 2011 at 10:39 AM, Nikolay S. <nowhere@hakkenden=
=2Eath.cx> wrote:
>> >> >> > =D0=92 =D0=9F=D1=82=D0=BD, 07/10/2011 =D0=B2 10:29 +0530, Pr=
ashant Batra =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> >> >> >> Hello,
>> >> >> >>
>> >> >> >> Can anyone help me out with a working code sample for recei=
ving
>> >> >> >> filtered packets using NETLINK_FIREWALL protocol in the use=
r space.
>> >> >> >> I have tried out the things in "http://smacked.org/docs/net=
link.pdf"
>> >> >> >> But these are not working.
>> >> >> >>
>> >> >> >> Any help would be highly appreciated.
>> >> >> >
>> >> >> > Hi, ip_queue is considered deprecated.
>> >> >> > Try this instead
>> >> >> > http://www.netfilter.org/projects/libnetfilter_queue/index.h=
tml
>> >> >> >
>> >> >> Thanks Nikolay, I have installed libnetfilter_queue.
>> >> >> But now when I am trying to run the sameple provided "nfqnl_te=
st.c" it
>> >> >> is failing at trying to unbind AF_INET moudule "unbinding exis=
ting
>> >> >> nf_queue handler for AF_INET".
>> >> >> My kernel is 2.6.38 and the lsmod looks like this -
>> >> >>
>> >> >> Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0Size =C2=A0Used by
>> >> >> nfnetlink_queue =C2=A0 =C2=A0 =C2=A0 =C2=A017273 =C2=A00
>> >> >> nfnetlink =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01278=
6 =C2=A01 nfnetlink_queue
>> >> >> ip_queue =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1286=
9 =C2=A00
>> >> >> hmac =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 12649 =C2=A00
>> >> >> nfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 281445 =C2=A02
>> >> >> nfsd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0246977 =C2=A08
>> >> >> lockd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A070662 =C2=A02 nfs,nfsd
>> >> >> nfs_acl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
12501 =C2=A02 nfs,nfsd
>> >> >> auth_rpcgss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A036685 =C2=
=A02 nfs,nfsd
>> >> >> sunrpc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
174292 =C2=A019 nfs,nfsd,lockd,nfs_acl,auth_rpcgss
>> >> >> exportfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1260=
3 =C2=A01 nfsd
>> >> >> autofs4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
27554 =C2=A02
>> >> >> af_packet =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02608=
4 =C2=A02
>> >> >> pcspkr =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 12515 =C2=A00
>> >> >> igb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 101765 =C2=A00
>> >> >> ixgbe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
125623 =C2=A00
>> >> >> mdio =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 12552 =C2=A01 ixgbe
>> >> >> bnx2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 72220 =C2=A00
>> >> >> i2c_i801 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1702=
1 =C2=A00
>> >> >> i2c_core =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2315=
4 =C2=A01 i2c_i801
>> >> >> pata_acpi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01266=
4 =C2=A00
>> >> >> ata_generic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012469 =C2=
=A00
>> >> >> sr_mod =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 21697 =C2=A00
>> >> >> cdrom =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A040849 =C2=A01 sr_mod
>> >> >> iTCO_wdt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1701=
8 =C2=A00
>> >> >> joydev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 17402 =C2=A00
>> >> >> usb_storage =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A035510 =C2=
=A00
>> >> >> usb_libusual =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16728 =C2=A01 =
usb_storage
>> >> >> option =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 20689 =C2=A00
>> >> >> usb_wwan =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1718=
8 =C2=A01 option
>> >> >> usbserial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03152=
3 =C2=A02 option,usb_wwan
>> >> >> usbhid =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 26894 =C2=A00
>> >> >> ehci_hcd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4424=
5 =C2=A00
>> >> >> uhci_hcd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2705=
4 =C2=A00
>> >> >> usbcore =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11797=
5 =C2=A09
>> >> >> usb_storage,usb_libusual,option,usb_wwan,usbserial,usbhid,ehci=
_hcd,uhci_hcd
>> >> >> dm_mod =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 67615 =C2=A00
>> >> >> sctp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0178747 =C2=A06
>> >> >> crc32c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 12630 =C2=A01
>> >> >> libcrc32c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01239=
4 =C2=A01 sctp
>> >> >> ext3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0124843 =C2=A01
>> >> >> jbd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A045806 =C2=A01 ext3
>> >> >> mbcache =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
12890 =C2=A01 ext3
>> >> >> unix =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 26736 =C2=A027
>> >> >> aacraid =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
70536 =C2=A00
>> >> >> ata_piix =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2552=
6 =C2=A02
>> >> >> libata =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
163811 =C2=A03 pata_acpi,ata_generic,ata_piix
>> >> >> sd_mod =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 34830 =C2=A03
>> >> >> cciss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A099716 =C2=A00
>> >> >> aic7xxx =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12061=
1 =C2=A00
>> >> >> megaraid_sas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 71987 =C2=A00
>> >> >> megaraid_mbox =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A035020 =C2=A00
>> >> >> megaraid_mm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017163 =C2=
=A01 megaraid_mbox
>> >> >> mptsas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 48651 =C2=A00
>> >> >> scsi_transport_sas =C2=A0 =C2=A0 24478 =C2=A01 mptsas
>> >> >> mptspi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 17848 =C2=A00
>> >> >> scsi_transport_spi =C2=A0 =C2=A0 23215 =C2=A02 aic7xxx,mptspi
>> >> >> mptscsih =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2681=
2 =C2=A02 mptsas,mptspi
>> >> >> mptbase =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
65266 =C2=A03 mptsas,mptspi,mptscsih
>> >> >> scsi_mod =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013524=
0 =C2=A014
>> >> >> sr_mod,usb_storage,aacraid,libata,sd_mod,cciss,aic7xxx,megarai=
d_sas,megaraid_mbox,mptsas,scsi_transport_sas
>> >> >> ,mptspi,scsi_transport_spi,mptscsih
>> >> >>
>> >> >> Could you please point out the problem.
>> >> >
>> >> > What is the errno value?
>> >> > You can use perror() to see helpful error message
>> >> >
>> >> >
>> >> >>
>> >> >>
>> >> >> > There are also several useful examples
>> >> >> > http://www.netfilter.org/projects/libnetfilter_queue/doxygen=
/modules.html
>> >> >> >
>> >> >> >
>> >> >> >> -- Thanks
>> >> >> >> Prashant Batra
>> >> >> >> --
>> >> >> >> To unsubscribe from this list: send the line "unsubscribe n=
etfilter" in
>> >> >> >> the body of a message to majordomo@vger.kernel.org
>> >> >> >> More majordomo info at =C2=A0http://vger.kernel.org/majordo=
mo-info.html
>> >> >> >
>> >> >> >
>> >> >> >
>> >> >>
>> >> >>
>> >> >>
>> >> >
>> >> >
>> >> >
>> >>
>> >>
>> >>
>> >> --
>> >> Prashant Batra
>> >> Follow the dreams!!
>> >> NrybX=C7=A7v^)=DE=BA{.n+z=D7=AB{ay =CA=87=DA=99,j fhz w j:+vwjm z=
Z+=DD=A2j"!
>> >
>> >
>> >
>>
>>
>>
>
>
>



--=20
Prashant Batra
=46ollow the dreams!!
