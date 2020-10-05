From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: end iptables support
Date: Mon, 5 Oct 2020 12:26:41 +0200
Message-ID: <afb4ba39-24bd-52ce-ed85-350f3ec07402@thelounge.net>
References: <660c1cff-64a9-13d3-e219-713d0cd44bd8@gmail.com>
 <91dc6d18-670e-4435-38b7-3998666ae772@thelounge.net>
 <dd3f6bee-3e39-48ae-586f-80f96e8da03d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <dd3f6bee-3e39-48ae-586f-80f96e8da03d@gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Emilio Augusto Lazo Zaia <emiliolazozaia@gmail.com>, netfilter@vger.kernel.org



Am 05.10.20 um 07:46 schrieb Emilio Augusto Lazo Zaia:
> Thanks. But I'm using recent match. I can't switch to nftables if recent =
match is not supported yet...

you don't get it - iptables-nft supports xt_recent, connlimit, ipset and
so on with a 100% compatible CLI syntax

iptables-nft !=3D=3D nftables
iptables-nft =3D=3D=3D iptables with nftables *backend*

> On 3/10/20 8:58 a.=C2=A0m., Reindl Harald wrote:
>>
>> Am 03.10.20 um 07:40 schrieb Emilio Augusto Lazo Zaia:
>>> When is supposed to be dropped the iptables support in Linux kernel in =
favor of nft? Currently I'm using iptables in many servers!
>> in 99% of all cases with a recent distribution you can just switch to
>> iptables-nft and are done
>>
>> at boot (it can restore iptables-legacy rules):
>> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
>>
>> after that:
>> alternatives --config iptables
>> alternatives --config arptables
>> alternatives --config ebtables
>>
>> switch to nft backend and now your well known "iptables" commands will
>> use the "nft" backend behind the scenes
>>
>> done that months ago on all Fedora 31 servers here while iptables-nft is
>> the default starting with Fedora 32

