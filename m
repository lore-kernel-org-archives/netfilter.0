From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: fwmark & iptables
Date: Fri, 29 Jan 2010 07:24:12 +0100
Message-ID: <4B627F0C.8050305@plouf.fr.eu.org>
References: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>	 <4B6176A9.3030404@plouf.fr.eu.org>	 <fcfe0b071001280526t75cdc774x8d3a91497e8af2cf@mail.gmail.com>	 <4B619284.5030905@plouf.fr.eu.org>	 <fcfe0b071001281250u13539aa3o82520e8044dee59f@mail.gmail.com> <fcfe0b071001281506p2380ef45t99cbf9733b074f1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fcfe0b071001281506p2380ef45t99cbf9733b074f1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Hakim <thepigs@gmail.com>
Cc: netfilter@vger.kernel.org

Matt Hakim a =E9crit :
> On Fri, Jan 29, 2010 at 7:50 AM, Matt Hakim <thepigs@gmail.com> wrote=
:
>>
>>> Forgot about that, sorry. Make sure sysctl net.ipv4.conf.ppp0.rp_fi=
lter
>>> is set to 0 after ppp0 is created, otherwise the packet is discarde=
d at
>>> the input routing decision stage. sysctl net.ipv4.conf.default.rp_f=
ilter
>>> contains the value that will be set for any new interface.
>>
>> Didn't seem to help.
>=20
> OK its working now, after I did various:
>=20
> echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
> echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter

What is the kernel version ? In 2.6.31 and newer versions, because of
the previous addition of "loose mode" to reverse path filtering in
version 2.6.30 (see Documentation/networking/ip-sysct.txt [1]), the
combination of net.ipv4.conf.$interface.rp_filter and
net.ipv4.conf.all.rp_filter to produce the functional value for
$interface was changed from a logical AND into an arithmetic MAX, so
net.ipv4.conf.all.rp_filter must also be set to 0 to disable reverse
path filtering on an interface. However it should not be necessary to
set rp_filter to 0 for eth0 too if it is not used for advanced routing.

> Thanks for your help,

You're welcome. This is a common but tricky issue.

[1] Note for myself : ask to change "conf/all/rp_filter must also be se=
t
to non-zero to do source validation on the interface" in ip-sysctl.txt
which is no longer true and thus misleading.
