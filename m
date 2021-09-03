From: martin f krafft <madduck@madduck.net>
Subject: Re: Cannot reference sets in later rules until next nft run
Date: Fri, 3 Sep 2021 21:51:48 +1200
Message-ID: <20210903095148.GB265393@lotus.rw.madduck.net>
References: <20210903012502.GA246533@lotus.rw.madduck.net>
 <20210903074228.GA22010@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=madduck.net;
        s=2015-11-14; t=1630662712;
        bh=MqGzeein5+b83ie0cWE/UhPlRGRP968gUn+q3uI8POE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=GxGVTnypYole3UkpIOM56oAdYLYNSHq8iJeRBKUrvaRjrC9u+tRSUhpgVB9mf7lEU
         63GgK/HujGXir3mH8Pc+h9nJGev5lr11TKfGilQU/3eRHTi0vJa4Icm/1Mo/SP5jMf
         PB5DIhy2kJwUTgBtG0efNUoAMApXMuvixMcjp3Ho=
Content-Disposition: inline
In-Reply-To: <20210903074228.GA22010@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"; markup="markdown"
To: netfilter users list <netfilter@vger.kernel.org>

Regarding the following, written by "Pablo Neira Ayuso" on 2021-09-03 at 09=
:42 Uhr +0200:
>Just tried it here with lastest:
>
># nft -v=20
>nftables v1.0.0 (Fearless Fosdick #2)
>
>WorksForMe(tm)
[=E2=80=A6]
>This is an old cache bug that was fixed starting 0.9.9 IIRC.

Thanks for that. I failed to check that the version I had was way=20
out of date. I have now installed 0.9.9 from Debian experimental and=20
can confirm that this has been fixed.

Thanks for your patience and sorry to everyone for the noise.

--=20
@martinkrafft | https://matrix.to/#/#madduck:madduck.net
 =20
seen on an advertising for an elaborate swiss men's watch:
   "almost as complicated as a woman. except it's on time"
 =20
spamtraps: madduck.bogus@madduck.net

