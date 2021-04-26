From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Flowtable with ppp/bridge
Date: Mon, 26 Apr 2021 19:51:11 +0200
Message-ID: <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de> <20210426172924.GA3178@salvia>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1619459477;
        bh=JIPTMyIMVQmefPeTeNzV+lm6I3EcK0QPa0frgY5rtzc=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=PClOSDTUzJGhGaau5+HxkZkIVFikmuwTS3dpvukZYHk69rutnfkAWLLMwIhi0sP2Y
         Gk5UnxkRl/+tRx8DcD/TYtFlAHK6H66WAEcyQgAaZ9qLOR/tUlhf8Wt0ZEB9bOoVp4
         BNoCyoubIsfWQ1CQIRYA/LFZpg1n3CQzxqGUkE2o=
In-Reply-To: <20210426172924.GA3178@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Is alex' guess right and i need to use physical interface instead of the v=
irtual one?

In my case i have ppp connection over vlan on wan port=2E

ppp8 =3D> wan=2E110 =3D> wan

Lan side (bridge) may work,but for ppp it sounds wrong to me=2E
regards Frank
