From: Jaga Doe <jaga.doe@aol.com>
Subject: Re: Redirect bridged traffic
Date: Fri, 7 Feb 2020 13:09:46 +0000 (UTC)
Message-ID: <1702288157.592966.1581080986107@mail.yahoo.com>
References: <1291389071.153642.1580977922721.ref@mail.yahoo.com> <1291389071.153642.1580977922721@mail.yahoo.com> <20200206084644.GN26952@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1581080994; bh=E+HFPGcdLgrTDnRJalAJToOSRTkF372lLyQ4JIznwlE=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=gnmW7tLY3JZtFw2TRMGliSIp3OPmEs9wlhcLVqoy7dc+ngL2eZEykgf0MfyOxAuspbKv9EQkHhqcEnUC0phl8uPG0YrQSC1OQpAJHSXS6+iZy54QBv0vuqcHse9aZgyjVLaJ1uO3aITSa7Dx/vpEHpr2zVld6GT6f8DpY3GEIZtaCYdrSgt6fVz9W7RBFSriGuIK3eaMi4SsoUhUp4fBW5xrs3snOtIJUHwmomHMvTTs01maKk+M+zENcdxk3h4bqXrFFybXd69tQM0gVu41MyG2KxhG5YJLLw/B8HIUq3SQP/vjwiw6pfZCHyzHZi6b1czinI0qdnxmW5M0nmrdEw==
In-Reply-To: <20200206084644.GN26952@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: fw@strlen.de
Cc: netfilter@vger.kernel.org

Hey! Of course that the issue was in my side: a bad rule was messing up the=
 nftables. Trying to make my device 'invisible' I was adding a rule meant t=
o change the ip/mac of the package, but I was using dnat instead of snat.

Sorry if I have waste your time


-----Original Message-----
From: Florian Westphal <fw@strlen.de>
To: Jaga Doe <jaga.doe@aol.com>
Cc: fw <fw@strlen.de>; netfilter <netfilter@vger.kernel.org>
Sent: Thu, Feb 6, 2020 10:46 am
Subject: Re: Redirect bridged traffic

Jaga Doe <jaga.doe@aol.com> wrote:
>=C2=A0 =C2=A0 =C2=A0  Hello,
>=20
>=C2=A0 =C2=A0 I have discovered a great mechanism of understanding what is=
 happening, but setting nftrace flag. With that I can see the dataflow:
>=20
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect packet: iif "eth1" ether s=
addr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 =
ip daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip=
 protocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags =3D=3D =
syn tcp window 64240=20
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect rule log tcp dport 3000 me=
ta pkttype set host ether daddr set 00:0c:29:15:7b:a0 counter packets 5 byt=
es 300 meta nftrace set 1 (verdict continue)
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect verdict continue=20
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect policy accept=20
> trace id 9af9e0b6 inet tlcRedirect clcRedirect packet: iif "br0" ether sa=
ddr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 i=
p daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip =
protocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags =3D=3D s=
yn tcp window 64240=20
> trace id 9af9e0b6 inet tlcRedirect clcRedirect rule log tcp dport 3000 co=
unter packets 5 bytes 300 redirect to :3000 (verdict drop)
>=20
> I don't understand why the redirect rule is leading to the drop verdict.

Most simple explanation: your bridge doesn't have an ip address
(redirect is really just 'dnat to' with the primary address of the
 incoming interface).

