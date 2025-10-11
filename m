Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52C12AD20
	for <netfilter@vger.kernel.org>; Sat, 11 Oct 2025 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760191053; cv=none; b=SMNQWrSADgvLAYGpP/ntaW5H6kLXqQLmNvjh2G4AjiuP+6mQu0MZ7Qza/nSy7r/AdYQcQKSLQIPfVb8K/tmlGJo3h4JZH8FEirioQOlHknEq/3txEJ+pkKSJB8E9QYrg3uopdVq186qtTmhOfURGdEU0f6tLJymt1VxgBFhH050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760191053; c=relaxed/simple;
	bh=G6Zx6iJ5Q8JPW7part/wAonculuWAFFXotqgjUWhoh8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=gW6lcSjTERD++FvkrHOEe79SOWeMWWkVXibosUPFofaHrqmn/m0Zv3rOXHfnoQK1mFMNRwpjTXaFzlulOZwtfuu/9S3PfshM//uj0jvu3TsOVWCjiWDiHD/yJ6QSSUZ6P2DFZUnxcNCRlosBTbkZowvoL+ENFNRXgfqzUZK5UEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=sR499NpT; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="sR499NpT"
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 007E7DF9A52
	for <netfilter@vger.kernel.org>; Sat, 11 Oct 2025 15:57:26 +0200 (CEST)
Received: from zimbra62-e11.priv.proxad.net (unknown [172.20.243.212])
	by smtp4-g21.free.fr (Postfix) with ESMTP id D82D219F5C2;
	Sat, 11 Oct 2025 15:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1760191037;
	bh=G6Zx6iJ5Q8JPW7part/wAonculuWAFFXotqgjUWhoh8=;
	h=Date:From:To:Cc:In-Reply-To:Subject:From;
	b=sR499NpTKKkrgHHWg2Ghlr59B29kDWjAWCC7qAfMRADhdfj+mttGvSWfEtRgiSJCH
	 IMMQdOGJP7Vzw6XwYJ5FF1aWgQ+XzURCdKDu8R4bafkoehcoQ7aFBCd+ykxvnnnNi8
	 0+Yfektc+hWgLZgVufCMsohV3D0INYZkaMKqd71um1dbVMZ6Thly5tf+jm5JoZujJN
	 r+gYZPNJBcGWhbIFhXRg2iS5fCms7m40xv53VH2zN9IPioEWtR/DLt6OTqnh57zOU3
	 FcqkVMa2RwPnlF94QPFnRO1VdKCAaGzDhX6Rkc0r4tfZqG7FE94dKxpde5QVsohbpr
	 lozFL2N2B2fWg==
Date: Sat, 11 Oct 2025 15:57:17 +0200 (CEST)
From: "Antoine C." <acalando@free.fr>
To: Brian Davidson <davidson.brian@gmail.com>
Cc: netfilter@vger.kernel.org
Message-ID: <1402483045.1384217397.1760191037810.JavaMail.root@zimbra62-e11.priv.proxad.net>
In-Reply-To: <CAOoaxdGXagWNmav2pyZSZ0U1Q4uew=WjRUK5SDkNF_6X-LchKA@mail.gmail.com>
Subject: =?utf-8?Q?Re=C2=A0:_Re:_Rule_with_double_check_ignore_with_802.1Q_packet?=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 7.2.0-GA2598 (zclient/7.2.0-GA2598)
X-Authenticated-User: acalando@free.fr


----- Brian Davidson <davidson.brian@gmail.com> a =C3=A9crit=C2=A0:
> On Fri, Oct 10, 2025 at 1:45=E2=80=AFPM Antoine C. <acalando@free.fr> wro=
te:
> >
> > Hello,
> >
> > I found a weird behavior with NF tables. I am trying to filter specific=
 packets and I cannot understand what is going on in the following case. It=
 looks like a bug, but I do not know NFT very well so I prefer to ask first=
.
> >
> > I am using 2 virtual interfaces veth0 and veth1 on Linux:
> > Linux sopvubu22-214d 6.8.0-64-generic #67~22.04.1-Ubuntu SMP PREEMPT_DY=
NAMIC Tue Jun 24 15:19:46 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
> >
> > Interfaces were created with:
> > ip link add veth0 type veth peer name veth1
> >
> >
> > NFT were configured with the following script:
> > ---
> > #!/usr/sbin/nft -f
> >
> > flush ruleset
> >
> > # INPUT Filtering
> > table netdev tb_in {
> >     chain ch_in {
> >         type filter hook ingress device veth1 priority 100;
> >         nftrace set 1
> >         ether saddr AA:BB:CC:DD:00:38   log prefix "--test 1-- "
> >         ip saddr 192.168.140.56         log prefix "--test 2-- "
> >         ether saddr AA:BB:CC:DD:00:38 ip saddr 192.168.140.56 log prefi=
x "--tests 1&2 -- "
> >         ip saddr 192.168.140.56 ether saddr AA:BB:CC:DD:00:38  log pref=
ix "--tests 2&1 -- "
> >     }
> > }
> > ---
> > Then I send this specific packet:
> > echo AA BB CC DD 00 50 AA BB CC DD 00 38 81 00 28 48 08 00 45 00 00 1C =
00 01 00 00 40 11 E0 F6 C0 A8 8C 38 C0 A8 8C 50 1D 89 1D 83 00 08 2A F8 | x=
xd -r -p | socat - INTERFACE:veth0
> >
> > And I get the following log:
> > trace id 5235f40e netdev tb_in ch_in packet: iif "veth1" ether saddr aa=
:bb:cc:dd:00:38 ether daddr aa:bb:cc:dd:00:50 vlan pcp 1 vlan dei 0 vlan id=
 2120 ip saddr 192.168.140.56 ip daddr 192.168.140.80 ip dscp cs0 ip ecn no=
t-ect ip ttl 64 ip id 1 ip protocol udp ip length 28 udp sport 7561 udp dpo=
rt 7555 udp length 8
> > trace id 5235f40e netdev tb_in ch_in rule meta nftrace set 1 (verdict c=
ontinue)
> > trace id 5235f40e netdev tb_in ch_in rule ether saddr aa:bb:cc:dd:00:38=
 log prefix "--test 1-- " (verdict continue)
> > trace id 5235f40e netdev tb_in ch_in rule ip saddr 192.168.140.56 log p=
refix "--test 2-- " (verdict continue)
> > trace id 5235f40e netdev tb_in ch_in rule ip saddr 192.168.140.56 ether=
 saddr aa:bb:cc:dd:00:38 log prefix "--tests 2&1 -- " (verdict continue)
> > trace id 5235f40e netdev tb_in ch_in policy accept
> >
> > What is very strange is that the "test 1 & 2" is failing, despite being=
 exactly identical, apart the order, to other tests. I get the same log wit=
h 'dmesg'.
> >
> > The packet sent can be decomposed in (ether + vlan + ip + udp) headers =
but no data. And if I remove the vlan part (81 00 28 48), it works.
> >
> > Is it a bug or do I miss something ? Maybe it has been corrected in a n=
ewer kernel version?
> >
> > Thanks for your help,
> > Antoine
>=20
> Despite having the same expressions, the rules get interpreted
> differently by nftables. The second rule checks the meta protocol
> also. This is on kernel 6.6.104 and nftables 1.1.1.
>=20
> # nft list table netdev t
> table netdev t {
>         chain c {
>               ether saddr aa:bb:cc:dd:00:38 ip saddr 192.168.140.56 \
> log prefix "--tests 1&2 --"
>               ip saddr 192.168.140.56 ether saddr aa:bb:cc:dd:00:38 \
> log prefix "--tests 2&1 --"
>         }
> }
> # nft list table netdev t | nft -c -d netlink -f /dev/stdin
> netdev (null) (null) use 0
> netdev t c
>   [ meta load iiftype =3D> reg 1 ]
>   [ cmp eq reg 1 0x00000001 ]
>   [ payload load 8b @ link header + 6 =3D> reg 1 ]
>   [ cmp eq reg 1 0xddccbbaa 0x00083800 ]
>   [ payload load 4b @ network header + 12 =3D> reg 1 ]
>   [ cmp eq reg 1 0x388ca8c0 ]
>   [ log prefix --tests 1&2 -- ]
> netdev t c
>   [ meta load protocol =3D> reg 1 ]
>   [ cmp eq reg 1 0x00000008 ]
>   [ payload load 4b @ network header + 12 =3D> reg 1 ]
>   [ cmp eq reg 1 0x388ca8c0 ]
>   [ meta load iiftype =3D> reg 1 ]
>   [ cmp eq reg 1 0x00000001 ]
>   [ payload load 6b @ link header + 6 =3D> reg 1 ]
>   [ cmp eq reg 1 0xddccbbaa 0x00003800 ]
>   [ log prefix --tests 2&1 -- ]

Thanks Brian, I did not think of using '-d netlink'

However, my analysis is a bit different: both rules check=20
the protocol, but in the `1&2` case, it is loaded at the=20
same time than the MAC src, eight byte at a time, as an
erroneous optimization, because in that case the protocol=20
is after the 802.1Q header. So it is a bug.

One workaround is to do as in the '2&1' case, by inverting
the order, however this is a bit weird as usually, the
parser is complaining with=20
"Error: conflicting protocols specified: xxx vs yyy"
if the layers are specified in the wrong order.
Can anybody think of a better workaround?

Antoine





=20
