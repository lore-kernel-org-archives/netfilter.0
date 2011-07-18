From: Autocad Learner <learn.autocad@yahoo.com>
Subject: Re: [MASQUERADE] Not changing to new source ip address when dynamically assigned in ppp link
Date: Mon, 18 Jul 2011 04:54:14 -0700 (PDT)
Message-ID: <1310990054.84728.YahooMailNeo@web121619.mail.ne1.yahoo.com>
References: <1310981976.47646.YahooMailNeo@web121603.mail.ne1.yahoo.com> <alpine.LNX.2.01.1107181242310.7358@frira.zrqbmnf.qr>
Reply-To: Autocad Learner <learn.autocad@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1310990054; bh=ql2o4PR/RP71b0b6E+A69tBK6QGi3d7F2qxv3M22Dj8=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=aqGaUYHZBaDBwIyIZaVL0rTK68L3MVfSM3L2Hd9ue0TJGA9u3XDRPhMO10bwfKeGW4v2GlHnjtn/ASs5k5znU6Ymkf5y9eTF7ajy26yjF3dcJQWLYwyWlfjuwA2H1XfDfkCf2imsA11zpkT97oSA/Ca9HeEbNiX0woFri8BGXwk=
In-Reply-To: <alpine.LNX.2.01.1107181242310.7358@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Jan Engelhardt <jengelh@medozas.de>

Hi Jan,

Thanks for your quick reply.

Unfortunately we cannot upgrade our kernels.=A0

I would like to know if there is any clean work around to deal with thi=
s issue.

We do not want to do an iptables restart or server restart to take this=
 effect.=A0
Also i saw in one of the posts i can set the ip_conntrack_udp_timeout a=
nd ip_conntrack_udp_timeout_stream to 0 and revert back after 10 second=
s. Since i am a newbie, i am not sure whether this would affect any oth=
er application. Is it the best way to deal with this issue?

To understand this problem:-
The ip_dynaddr says it would update the ip address when the packet is r=
etransmitted before we get any incoming packets from the destination.

Since we are using this only for udp, The packets would not be retransm=
itted.. Is it because of this?

It would be great if you can let us know any clean work around.

Thanks in advance..



----- Original Message -----
=46rom: Jan Engelhardt <jengelh@medozas.de>
To: Autocad Learner <learn.autocad@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Sent: Monday, July 18, 2011 11:49 AM
Subject: Re: [MASQUERADE] Not changing to new source ip address when dy=
namically assigned in ppp link

On Monday 2011-07-18 11:39, Autocad Learner wrote:

>We are using linux Red Hat version RHEL 2.6.9-5.EL =A0and iptables=20
>version 1.2.11-3.1.RHEL4 as Source System. The source ip address is=20
>assigned dynamically via ppp link over eth0 interface.=A0
>
>When the link goes down and comes back, we get a new ip address and it=
=20
>is evident in the ppp0 interface. But the packets going out of our=20
>system still uses the old ip address.

This is already fixed in contemporary kernels AFAICS.

