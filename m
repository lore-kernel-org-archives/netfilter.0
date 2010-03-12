From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: Re: drop dhcp request from a particular mac address, after a dhcp relay
Date: Thu, 11 Mar 2010 18:27:12 -0800 (PST)
Message-ID: <937499.80494.qm@web31506.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1268360832; bh=BWRRwVbymNE5Nq1o5QFIg242j8Gf1Io4zDX0h/6zOrk=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=kGOMlrD5pRl8Qjttd7UxoRUxomLQ6trNS4iPFBbvuUlT9LHGUjHqTTMD4b5qF56xjK5TPFEo2usHV16WOl0kw4qCUlLuOjK8uyVe3kNQQnYKWZHXzd02kFXgBa3qa1nHLC/aYNCbjWqNFqZWeK+Cp6VGKkmbMDjRLsQ837toqGo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org, Robert Nichols <rnicholsNOSPAM@comcast.net>

--- On Wed, 3/10/10, Robert Nichols <rnicholsNOSPAM@comcast.net> wrote:

 :-
> >
> >=A0 =A0 iptables ..... -m bootp --mac-source
> 00:08:a1:ab:75:d1 -j DROP ?
> >
> > Well, if 'iptables' can't serve the purpose, how about
> ebtables ?
>=20
> Wouldn't it be a lot easier to adjust the DHCP server's
> configuration by
> adding a "deny" statement in the pool's permit list?
>=20

True but manually editing the configuration file will require the dhcp =
server to be restarted, whereas 'iptables' and/or 'ebtables' can be scr=
ipted at runtime.

Cheers.=20




     =20
