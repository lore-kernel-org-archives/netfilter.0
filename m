From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: end iptables support
Date: Mon, 5 Oct 2020 12:31:05 +0200
Message-ID: <f6873f93-b1fe-1f76-0d66-7d55b19e3717@thelounge.net>
References: <660c1cff-64a9-13d3-e219-713d0cd44bd8@gmail.com>
 <91dc6d18-670e-4435-38b7-3998666ae772@thelounge.net>
 <dd3f6bee-3e39-48ae-586f-80f96e8da03d@gmail.com>
 <afb4ba39-24bd-52ce-ed85-350f3ec07402@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <afb4ba39-24bd-52ce-ed85-350f3ec07402@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Emilio Augusto Lazo Zaia <emiliolazozaia@gmail.com>, netfilter@vger.kernel.org



Am 05.10.20 um 12:26 schrieb Reindl Harald:
>=20
>=20
> Am 05.10.20 um 07:46 schrieb Emilio Augusto Lazo Zaia:
>> Thanks. But I'm using recent match. I can't switch to nftables if recent=
 match is not supported yet...
>=20
> you don't get it - iptables-nft supports xt_recent, connlimit, ipset and
> so on with a 100% compatible CLI syntax
>=20
> iptables-nft !=3D=3D nftables
> iptables-nft =3D=3D=3D iptables with nftables *backend*

[root@testserver:~]$ iptables-nft --verbose --list INBOUND
Chain INBOUND (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 IPST_ALL   all  --  any    any     anywhere
anywhere             recent: UPDATE seconds: 2 hit_count: 250 TTL-Match
name: limit_all_global side: source mask: 255.255.255.255
    0     0 DROP_ALL   all  --  any    any     anywhere
anywhere             recent: UPDATE seconds: 2 reap hit_count: 150
TTL-Match name: limit_all_global side: source mask: 255.255.255.255
16034  718K            all  --  any    any     anywhere
anywhere             recent: SET name: limit_all_global side: source
mask: 255.255.255.255
    0     0 LD_C_24    all  --  any    any     anywhere
anywhere             #conn src/24 > 250
    0     0 LD_C_32    all  --  any    any     anywhere
anywhere             #conn src/32 > 120
    0     0 LD_C_16    all  --  any    any     anywhere
anywhere             #conn src/16 > 500
    0     0 LD_R_SSH   tcp  --  any    any     anywhere
anywhere             tcp dpt:10022 recent: UPDATE seconds: 60 reap
hit_count: 120 TTL-Match name: limit_ssh_global side: source mask:
255.255.255.255
    1    60            tcp  --  any    any     anywhere
anywhere             tcp dpt:10022 recent: SET name: limit_ssh_global
side: source mask: 255.255.255.255
    0     0 LD_R_DNS   all  --  any    any     anywhere
anywhere             match-set DNS_PORT dst recent: UPDATE seconds: 2
reap hit_count: 60 TTL-Match name: limit_dns_global side: source mask:
255.255.255.255
   18  1029            all  --  any    any     anywhere
anywhere             match-set DNS_PORT dst recent: SET name:
limit_dns_global side: source mask: 255.255.255.255
    0     0 LD_R_FTP   tcp  --  any    any     anywhere
anywhere             tcp dpt:ftp recent: UPDATE seconds: 2 reap
hit_count: 20 TTL-Match name: limit_ftp_global side: source mask:
255.255.255.255
   13   548            tcp  --  any    any     anywhere
anywhere             tcp dpt:ftp recent: SET name: limit_ftp_global
side: source mask: 255.255.255.255
   50  2340 REJECT     all  --  any    any     anywhere
anywhere             recent: CHECK seconds: 15 reap TTL-Match name:
portscan side: source mask: 255.255.255.255 reject-with
icmp-admin-prohibited
  715 29869 LRJ_SCAN   all  --  any    any     anywhere
anywhere             match-set PORTSCAN_PORTS dst recent: SET name:
portscan side: source mask: 255.255.255.255

>> On 3/10/20 8:58 a.=C2=A0m., Reindl Harald wrote:
>>>
>>> Am 03.10.20 um 07:40 schrieb Emilio Augusto Lazo Zaia:
>>>> When is supposed to be dropped the iptables support in Linux kernel in=
 favor of nft? Currently I'm using iptables in many servers!
>>> in 99% of all cases with a recent distribution you can just switch to
>>> iptables-nft and are done
>>>
>>> at boot (it can restore iptables-legacy rules):
>>> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
>>>
>>> after that:
>>> alternatives --config iptables
>>> alternatives --config arptables
>>> alternatives --config ebtables
>>>
>>> switch to nft backend and now your well known "iptables" commands will
>>> use the "nft" backend behind the scenes
>>>
>>> done that months ago on all Fedora 31 servers here while iptables-nft is
>>> the default starting with Fedora 32
