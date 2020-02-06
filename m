From: Jaga Doe <jaga.doe@aol.com>
Subject: Re: Redirect bridged traffic
Date: Thu, 6 Feb 2020 08:32:02 +0000 (UTC)
Message-ID: <1291389071.153642.1580977922721@mail.yahoo.com>
References: <1291389071.153642.1580977922721.ref@mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1580977923; bh=Hcwm48are9xUCvB1f1rOXZ9m+jmfhjTxU8+W7d8uXoQ=; h=Date:From:To:Cc:Subject:References:From:Subject; b=OR7vtaRLGX3DJOG73q0dc5oq4sFpBCS9AJmlGyqRAGT1z3qiDh8W62yb+7zDOOnbrvVBm3xthGSTU5ZkdPkhVDtWUUhKWIKjdwcQpp5SQehx2Ze1eXrlQ8W1qFuTptecVGjLGdCirRwlk25UBiNUGaUyKNkaY5y+EyDvBIfdpMSvbM+T4qgusEXUWinMo+EqA4c/lifHcLVQ7r8fnRT2orb0hiHi+lkFpPCJ0ppkineUv3nwnCplMVrxGr7sV9koEmj51Ze1Q/TfqeVTEhKtojjdVHLvYbK7El7MAQ8s/NJLBjCAh8KdPPaHyrFu6lz4DzJXVuP4CDwkyx/AHQj9kA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: fw@strlen.de
Cc: netfilter@vger.kernel.org

      Hello,

   I have discovered a great mechanism of understanding what is happening, =
but setting nftrace flag. With that I can see the dataflow:

trace id 9af9e0b6 bridge tbrFilter cbrRedirect packet: iif "eth1" ether sad=
dr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 ip=
 daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip p=
rotocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags =3D=3D sy=
n tcp window 64240=20
trace id 9af9e0b6 bridge tbrFilter cbrRedirect rule log tcp dport 3000 meta=
 pkttype set host ether daddr set 00:0c:29:15:7b:a0 counter packets 5 bytes=
 300 meta nftrace set 1 (verdict continue)
trace id 9af9e0b6 bridge tbrFilter cbrRedirect verdict continue=20
trace id 9af9e0b6 bridge tbrFilter cbrRedirect policy accept=20
trace id 9af9e0b6 inet tlcRedirect clcRedirect packet: iif "br0" ether sadd=
r f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 ip =
daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip pr=
otocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags =3D=3D syn=
 tcp window 64240=20
trace id 9af9e0b6 inet tlcRedirect clcRedirect rule log tcp dport 3000 coun=
ter packets 5 bytes 300 redirect to :3000 (verdict drop)

I don't understand why the redirect rule is leading to the drop verdict.

Thank you,
Jaga.


-----Original Message-----
From: Florian Westphal <fw@strlen.de>
To: Jaga Doe <jaga.doe@aol.com>
Cc: netfilter <netfilter@vger.kernel.org>
Sent: Wed, Feb 5, 2020 9:35 pm
Subject: Re: Redirect bridged traffic

Jaga Doe <jaga.doe@aol.com> wrote:
> table bridge tbrFilter {
>=C2=A0 =C2=A0  chain cbrRedirect {
>=C2=A0 =C2=A0 =C2=A0  type filter hook prerouting priority 0;
>=C2=A0 =C2=A0 =C2=A0  log tcp dport $TPORT meta pkttype set host ether dad=
dr set $MON_MAC counter
>=C2=A0 =C2=A0  }
> }
>=20
> table inet tlcRedirect {
>=C2=A0 =C2=A0  chain clcRedirect {
>=C2=A0 =C2=A0 =C2=A0  type nat hook prerouting priority 0;
>=C2=A0 =C2=A0 =C2=A0  log tcp dport $TPORT counter redirect to $TPORT
>=C2=A0 =C2=A0  }
> }
>=20
> Using this configuration, the connection to PC0:3000 seems that it is cap=
tured by the nft but is not going to the local process.
>=20
> What I am missing here?

I don't see anything wrong here, this should work and $TPORT should end
up in inet input hook.
Does it end up in forward instead or does it 'just disappear'?

Does 'nstat' show anything?
