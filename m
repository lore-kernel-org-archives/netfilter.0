From: David Alanis <canito@dalan.us>
Subject: Re: about install leyer7
Date: Tue, 04 Oct 2011 17:21:59 -0500
Message-ID: <20111004172159.b3wgyogdppoook0g@mail.dalan.us>
References: <e573f7a0910ef894971791a90ca7feab.squirrel@mail.fisica.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e573f7a0910ef894971791a90ca7feab.squirrel@mail.fisica.uh.cu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org

Quoting julioarr@fisica.uh.cu:

> Hi all
>
> I need something like the match layer7, or just leyer7!
>
> I have in my system:
>
> debian squeeze (linux-image-2.6.32-5-amd64      2.6.32-35squeeze2)
> iptables        1.4.8-3
> iptables-dev    1.4.8-3
> xtables-addons-common   1.26-2+b1
> xtables-addons-modules-2.6.32-5-amd64   1.26-2+2.6.32-35
> xtables-addons-source   1.26-2
>
> Does it stable layer7 with my kernel version?
> Why don=92t appear leyer7 in xtables-addons?
> How I can install layer7?
> I need rebuild the kernel?
> Where are the sources of layer7?
>
> Regards,
>
> julio
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Hola Julio-

I don't use Debian but I was able to find some useful links using googl=
e.

 From what I can read Debian doesn't come with the layer7 or l7 module =
=20
for iptables and it looks like you'll need to recompile the kernel:

Links:

Spanish
http://www.ecualug.org/2009/07/12/blog/razametal/debian_kernel_26301_l7=
filter_ipp2p

http://www.howtoforge.com/lan-management-system-lms-on-debian-squeeze-r=
outer-howto

http://stackoverflow.com/questions/7552720/how-to-integrate-l7-filter-o=
ption-with-linux-iptables-in-debian-squeeze

http://adminhowtos.com/index.php?topic=3D15.0

http://www.mastershaper.org/forum/index.php?topic=3D689.0

Lots of juicy information, so I hope that helps.

Saludos-

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

