From: "Danilo Magat" <danny@ezelink.com>
Subject: RE: ebtables vlan captive portal
Date: Sat, 14 Mar 2015 15:13:34 +0400
Message-ID: <003201d05e47$eb3f7d80$c1be7880$@ezelink.com>
References: <e83b24aadd74fe6ca9f82d7d4a38de82@ezelink.com> <CAOkSjBgGu80ajXEE3Z3GWfXOjn3BcpBKAt=XevswvsshV+y7TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBgGu80ajXEE3Z3GWfXOjn3BcpBKAt=XevswvsshV+y7TQ@mail.gmail.com>
Content-language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 'Arturo Borrero Gonzalez' <arturo.borrero.glez@gmail.com>
Cc: 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

Hi guys,

Any Idea about this?:

[root@localhost nftables]# make
make  all-recursive
make[1]: Entering directory `/root/nftables'
Making all in src
make[2]: Entering directory `/root/nftables/src'
make  all-am
make[3]: Entering directory `/root/nftables/src'
  CC     main.o
In file included from ../include/netlink.h:10,
                 from main.c:25:
/usr/include/linux/netlink.h:35: error: expected specifier-qualifier-li=
st before =E2=80=98sa_family_t=E2=80=99
make[3]: *** [main.o] Error 1
make[3]: Leaving directory `/root/nftables/src'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/root/nftables/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/root/nftables'
make: *** [all] Error 2


=20
Thanks & Best Regards,=20
Danilo Magat=20
eZeLink Telecom
www.ezelink.com
Ph: +971 4 457 2218 Ext: 110 =20
=46acebook - Twitter - LinkedIn - G+ - Pinterest - Instagram
Bay Square Building 06 - Office No 105 - Business Bay
P.O Box 111581, Dubai, UAE
Note: My Email Id is changed from danny@sb-ps.ae to danny@ezelink.com, =
please update in your record.



-----Original Message-----
=46rom: Arturo Borrero Gonzalez [mailto:arturo.borrero.glez@gmail.com]=20
Sent: Thursday, March 12, 2015 3:27 PM
To: danny@ezelink.com
Cc: Netfilter Users Mailing list
Subject: Re: ebtables vlan captive portal

On 12 March 2015 at 04:39,  <danny@ezelink.com> wrote:
> http://s16.postimg.org/e5nu6g1md/bridgevlancaptive.png
>
> The above image link is based on my project about captive portal. As=20
> you can see on the image i have a diagram on LEFT side which is=20
> WORKING without a problem on a normal scenario without any vlan.
>
> On RIGHT side however, it is similar to the setup on left side but it=
=20
> is with multiple VLAN.
>
> I am having difficulties on finding the solution on this. need your i=
nput.
>
> Currently im looking at ebtables form the link
>

If you're planning a new project based on ebtables, would you consider =
taking a look into nftables?

best regards.
--
Arturo Borrero Gonz=C3=A1lez

