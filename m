From: Dimitri GOURDON <dgourdon@itool.com>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 17:44:25 +0200
Message-ID: <4884AED9.8010306@itool.com>
References: <48847F16.8040604@itool.com> <488487E3.2020906@bock.nu> <48849E47.30901@itool.com> <48849FB7.7070607@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48849FB7.7070607@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bernhard Bock <mailinglists@bock.nu>, netfilter@vger.kernel.org

Bernhard Bock a =E9crit :
> Dimitri GOURDON wrote:
>> There are 2 parameters that can perhaps help me :
>>
>> cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
>> 65520
>> cat /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets
>> 8190
>>
>> I can modify the first on the fly (the problem is the same : no chan=
ge)
>> But not the second...
>
> Depending on your kernel version, you may have to set the value when=20
> loading the module. Try to insert the following line in=20
> /etc/modprobe.conf (or similar, depending on your linux distribution)=
:
>
> options nf_conntrack hashsize=3D16384
>
> best regards
> Bernhard
=46inally, I've successed to modify the 2 parameters. I have respective=
ly=20
modify them with 131072 and 16384. And the problem stay entire...

Thanks.

Have you other ideas ???
