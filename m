From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Re: [xtables-addons] Oops in SYSRQ, BUG: unable to handle kernel
 paging request at ffffffffa01a90e0
Date: Tue, 18 Sep 2012 13:20:49 +0200
Message-ID: <50585911.4010903@mejor.pl>
References: <4F199ADB.5000204@mejor.pl> <alpine.LNX.2.01.1208231520190.32157@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=yv8D6wf5Mp7xmliD0+Ms9vKpQWSiCMi+LJBQTLQAm9Y=;
	b=w05WoLGesML1qjeTHdiz+nPtSZ335hZ//UVDSRpCFzy7LdW3BuFiji3Xs4qpxCxQX3Bo/u3sMcphJWEccQ23yLULkCzrm7t7xCBo+3VT2druSTvbUDGJ244EIIJKqN4/;
In-Reply-To: <alpine.LNX.2.01.1208231520190.32157@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

W dniu 23.08.2012 15:23, Jan Engelhardt pisze:
> On Friday 2012-01-20 17:48, Marcin Miros=C5=82aw wrote:
>=20
>> Hi again!
>> I've found bug in xt_SYSRQ (probably), when i add rule with sysrq,
>> remove rule, unload module then add rule i'm getting Oops. Please lo=
ok
>> at this:
>=20
> Maybe fixed with commit
> commit cb8050172ae1d893f58c1aa57de975f9932dace6 (v1.44~4)

Hello!
This works for me. Thank you for fix.
Regards,
Marcin
