From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: linux-next netfilter: xt_recent: Add an entry reaper
Date: Sun, 28 Feb 2010 21:26:04 +0100
Message-ID: <1267388764.9082.85.camel@edumazet-laptop>
References: <20100228033841.265CFF8BB0@sepang.rtg.net>
	 <1267331677.9082.46.camel@edumazet-laptop>
	 <alpine.LSU.2.01.1002281146470.9681@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=5qmQ15E7KkByjkeG97QjI9q2wTP4AuMijUh+yIfXZ5k=;
        b=IO0YK92D/XY9uMNiKruIYe94nqYOibbjmRTboPn1ea8r0SEQVhlYFl2Tft08m1xltK
         9n2vV4s06UbEIQrO2R95+IlIVIwdMyKRk9w9kh6eI18YoxrHVsb69UCxHdbM/W+H48B0
         dsaFDbVr0VlT+Yn64W/5GpHHiKhN6jEUtrOOU=
In-Reply-To: <alpine.LSU.2.01.1002281146470.9681@obet.zrqbmnf.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Tim Gardner <timg@tpi.com>, kaber@trash.net, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Le dimanche 28 f=C3=A9vrier 2010 =C3=A0 11:50 +0100, Jan Engelhardt a =C3=
=A9crit :

> Entries do not expire (except "falling off" the LRU when it's full) -
> there is no counter that tells them when they expired.
> "--seconds" is just a match option, not something that defines
> the LRU's properties. And that's actually good, because that allows
> you to write
>=20
> 	-m recent --name foo --seconds 60 -j do that
>=20
> 	-m recent --name foo --seconds 3600 -j do something else
>=20
> If you purged "expired" entries after 60 secs, there would be nothing
> left for the 3600 one to check for.

Thats right of course, thanks for reminding us how it works !


--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
