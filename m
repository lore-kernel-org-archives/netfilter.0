From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Fwd: IP daddr filtering not working for non-routable address
Date: Wed, 1 Sep 2021 16:13:07 +0100
Message-ID: <20210901161307.fe9c7ca2ada8635ec0f7e301@plushkava.net>
References: <CADjU3LmddfsRShNVx-hArmivM=iUGvEFg28Gd90qyg7VRGqvbw@mail.gmail.com>
        <CADjU3LkCskd4XSEWKX_WzWbwMmhd6hPhLT+zqGDE_-Ubch4V2Q@mail.gmail.com>
        <20210901110659.9cd84a2f7aa484bfe76a9a62@plushkava.net>
        <CADjU3LnN_uLqZ1LKJcjBCotv+OVJiL7v8xdsdt89_nxHOqHJjw@mail.gmail.com>
        <20210901122446.ff7367368ead217fd01996f0@plushkava.net>
        <CADjU3L=Q=rxK6Oy37SbN=ANXN6ig+rKdkZ_6iU+3j3AYkrY4sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        sx7Qd9bTT+gDSkOj6sRcJQW2ajT/3N99dNndHIbkTEM=; b=sY0PTMMwf30PN4o0
        03zOZxDLnmPWGiVE9D2K3LxPLCMCZPF73emA4WWdb0FYVBZLb9mhu7cBDV9ohH7b
        vi4snXbToqERJPPhe8EknCaxYVfW49TeGLqKWXE+/LJMq59DQUlQy/czIM3D/wcY
        bqptDj5PdPGxMQvzw0mLYNXH8PkeOMtcnozkbOXX/k5QfCaUPKYFGI25OlUMCeN6
        mggEhHPxlWdiEq2hxAanbopGuhUxuOWlliiiWsuubr85SQvR6UpEZwQVywavziXN
        GdhQFNKERvuAFVUAXrj146Ngkd16+GCRqqO131ugja3QsI7uB37pW/uAl1hseQLn
        TcucFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=sx7Qd9bTT+gDSkOj6sRcJQW2ajT/3N99dNndHIbkT
        EM=; b=ot0ErMnDQZpw8fXfK46/f53o01n4rLSRIbBZwo1X/c0ptAZahqqRRofXE
        xlGZdkSyEyDpCc6h0Mur1Wigza/jiE8B3Cq/tofl5J8m3hqNjjtr7L7Y457bJ8Rj
        5AkoQq6Nc90cZY0A0h1EOd4i/0zjpY5Lsgx9REgIqiS8n6FeE+uTKeYyHTCp3elm
        prEvKHu+wTzXxkdwyUV958EKmkMbFbm5LXaYCnqyAd9DXMVUF47cAJ0+GV8lRtpe
        oNjHJaMbnackres8BinMrk3hh+puU2AvfrBid//f/j3o1vDYoB8iFULKzpCw83AM
        ZaJbXp87KIGPvVghRTz/LgS0I+G4w==
In-Reply-To: <CADjU3L=Q=rxK6Oy37SbN=ANXN6ig+rKdkZ_6iU+3j3AYkrY4sQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Niko =?ISO-8859-1?Q?Kortstr=F6m?= <niko.kortstrom@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 1 Sep 2021 16:59:44 +0300
Niko Kortstr=F6m <niko.kortstrom@gmail.com> wrote:

> Hi
>=20
> Sorry on we're making some changes and changing the names, on target
> ip-filtering has been changed to ecpri-ip-filtering. We're wondering how =
do
> the packets filtered not increase counters past the accept rule if they a=
re
> not accepted by it.
>=20
> # ip netns exec radions sysctl -a | grep '\.rp_filter'.
> net.ipv4.conf.all.rp_filter =3D 2
> net.ipv4.conf.default.rp_filter =3D 0
> net.ipv4.conf.rfoe4.rp_filter =3D 0
> net.ipv4.conf.rfoe4/295.rp_filter =3D 0
>=20
> No martians seem to be logged by the kernel.

For them to be logged requires that net.ipv4.conf.*.log_martians be set to =
a value of 1, where * is either "all" or the link name in question.

Also, you could try adding something like this:-

chain prerouting {
	type filter hook prerouting priority raw; policy accept;
	ip daddr 10.0.0.0/8 meta nftrace set 1
}

In the case that the packet is being processed by Netfilter, you may then d=
etermine how it traverses your ruleset by executing "nft monitor trace".

--=20
Kerin Millar
