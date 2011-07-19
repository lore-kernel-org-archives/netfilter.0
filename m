From: Pedro Ribeiro <pribeiro@net.ipl.pt>
Subject: Behaviour of "-j SNAT --persistent"
Date: Tue, 19 Jul 2011 18:35:51 +0100
Message-ID: <4E25C077.10208@net.ipl.pt>
Reply-To: pribeiro@net.ipl.pt
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dkim.net.ipl.pt; s=alfa;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:Reply-To:From:Date:Message-ID; bh=7Bg/sfCFW7nfkjAVzbPxdgqkZKgFFgcIQH0buujKITw=;
	b=dSSJ15FS95xayakcv7pCEvq3NZfnNUnne4gCkCiFAuRtMdnjWTWVvhD18ncXMB1HLIbyheGs/tlPl2hqcgz6AshOw2Ppr+Z37lCHAOqZQajqgz4qk8oKZ9Pi5gKIGEfo37jXOITSI8vDU9d1N39n1aIGy4BbyvLU6pyw7JbqbLg=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to implement a near dynamic NAT IP assignment where a pool o=
f=20
public addresses are used to map a bigger range of private addresses=20
(NETMAP target can't be used as it need both pre and post NAT blocks to=
=20
have the same size).

The internal networks are about 32 C-Class sized networks (/24) and the=
=20
public block is an /22 (1024 addresses).

Because this networks are in general very "calm" I would expect that=20
only about 500~700 hosts will be active at any time and the=20
internal/external mapping will be near 1:1 most of the time.
The "PAT" behaviour will only be needed when the public addresses pool=20
were exhausted and some start to be shared by multiple internal users.

The behaviour I'm observing in this moment is:
312 Internal IPs are using NAT
264 Public addresses from the pool are in use

Why is the netfilter code reusing the IPs from the pool when there are =
a=20
lot of addresses available?

The command line I'm using to configure this example is:

# Linux 2.6.36
iptables -t nat -A POSTROUTING -o eth1 \
         -j SNAT --to-source 192.100.196.0-192.100.199.255 --persistent
# This IPs aren't the real ones, only an example!!!

TIA

--=20
Best regards,

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Pedro Ribeiro
IPLNet - Rede de dados e comunica=E7=F5es
Instituto Polit=E9cnico de Lisboa (IPL)
Mail: mailto:pribeiro AT net.ipl.pt
VoIP: sip:pribeiro AT net.ipl.pt
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
