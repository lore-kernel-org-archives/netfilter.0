From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: Working example for NETLINK_FIREWALL protocol
Date: Fri, 07 Oct 2011 10:44:40 +0400
Message-ID: <1317969880.8681.5.camel@hakkenden.homenet>
References: <CAG+XuE4feu1qKw4HGu5vivJRrFaZyFHFGRw362QvPJR4TGkNig@mail.gmail.com>
	 <1317964165.8681.2.camel@hakkenden.homenet>
	 <CAG+XuE7hDq_j2mTEFd9v9fi7PZO1ECdpScwEV_1JtMg4GqKeNw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG+XuE7hDq_j2mTEFd9v9fi7PZO1ECdpScwEV_1JtMg4GqKeNw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Prashant Batra <prashant0100@gmail.com>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=9F=D1=82=D0=BD, 07/10/2011 =D0=B2 11:55 +0530, Prashant Batr=
a =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Fri, Oct 7, 2011 at 10:39 AM, Nikolay S. <nowhere@hakkenden.ath.cx=
> wrote:
> > =D0=92 =D0=9F=D1=82=D0=BD, 07/10/2011 =D0=B2 10:29 +0530, Prashant =
Batra =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> Hello,
> >>
> >> Can anyone help me out with a working code sample for receiving
> >> filtered packets using NETLINK_FIREWALL protocol in the user space=
=2E
> >> I have tried out the things in "http://smacked.org/docs/netlink.pd=
f"
> >> But these are not working.
> >>
> >> Any help would be highly appreciated.
> >
> > Hi, ip_queue is considered deprecated.
> > Try this instead
> > http://www.netfilter.org/projects/libnetfilter_queue/index.html
> >
> Thanks Nikolay, I have installed libnetfilter_queue.
> But now when I am trying to run the sameple provided "nfqnl_test.c" i=
t
> is failing at trying to unbind AF_INET moudule "unbinding existing
> nf_queue handler for AF_INET".
> My kernel is 2.6.38 and the lsmod looks like this -
>=20
> Module                  Size  Used by
> nfnetlink_queue        17273  0
> nfnetlink              12786  1 nfnetlink_queue
> ip_queue               12869  0
> hmac                   12649  0
> nfs                   281445  2
> nfsd                  246977  8
> lockd                  70662  2 nfs,nfsd
> nfs_acl                12501  2 nfs,nfsd
> auth_rpcgss            36685  2 nfs,nfsd
> sunrpc                174292  19 nfs,nfsd,lockd,nfs_acl,auth_rpcgss
> exportfs               12603  1 nfsd
> autofs4                27554  2
> af_packet              26084  2
> pcspkr                 12515  0
> igb                   101765  0
> ixgbe                 125623  0
> mdio                   12552  1 ixgbe
> bnx2                   72220  0
> i2c_i801               17021  0
> i2c_core               23154  1 i2c_i801
> pata_acpi              12664  0
> ata_generic            12469  0
> sr_mod                 21697  0
> cdrom                  40849  1 sr_mod
> iTCO_wdt               17018  0
> joydev                 17402  0
> usb_storage            35510  0
> usb_libusual           16728  1 usb_storage
> option                 20689  0
> usb_wwan               17188  1 option
> usbserial              31523  2 option,usb_wwan
> usbhid                 26894  0
> ehci_hcd               44245  0
> uhci_hcd               27054  0
> usbcore               117975  9
> usb_storage,usb_libusual,option,usb_wwan,usbserial,usbhid,ehci_hcd,uh=
ci_hcd
> dm_mod                 67615  0
> sctp                  178747  6
> crc32c                 12630  1
> libcrc32c              12394  1 sctp
> ext3                  124843  1
> jbd                    45806  1 ext3
> mbcache                12890  1 ext3
> unix                   26736  27
> aacraid                70536  0
> ata_piix               25526  2
> libata                163811  3 pata_acpi,ata_generic,ata_piix
> sd_mod                 34830  3
> cciss                  99716  0
> aic7xxx               120611  0
> megaraid_sas           71987  0
> megaraid_mbox          35020  0
> megaraid_mm            17163  1 megaraid_mbox
> mptsas                 48651  0
> scsi_transport_sas     24478  1 mptsas
> mptspi                 17848  0
> scsi_transport_spi     23215  2 aic7xxx,mptspi
> mptscsih               26812  2 mptsas,mptspi
> mptbase                65266  3 mptsas,mptspi,mptscsih
> scsi_mod              135240  14
> sr_mod,usb_storage,aacraid,libata,sd_mod,cciss,aic7xxx,megaraid_sas,m=
egaraid_mbox,mptsas,scsi_transport_sas
> ,mptspi,scsi_transport_spi,mptscsih
>=20
> Could you please point out the problem.

What is the errno value?
You can use perror() to see helpful error message


>=20
>=20
> > There are also several useful examples
> > http://www.netfilter.org/projects/libnetfilter_queue/doxygen/module=
s.html
> >
> >
> >> -- Thanks
> >> Prashant Batra
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> >
>=20
>=20
>=20


