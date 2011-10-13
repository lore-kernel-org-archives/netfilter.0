From: Michal =?utf-8?q?Kube=C4=8Dek?= <mkubecek@suse.cz>
Subject: Re: limit module timer precision issue
Date: Thu, 13 Oct 2011 13:23:04 +0200
Message-ID: <201110131323.04339.mkubecek@suse.cz>
References: <20111013014310.4369d65e@wwwwww-701SD> <201110130910.33120.mkubecek@suse.cz> <alpine.LNX.2.01.1110131214530.28308@frira.zrqbmnf.qr>
Reply-To: mkubecek@suse.cz
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1110131214530.28308@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="macroman"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>

On Thursday 13 of October 2011, Jan Engelhardt wrote:
> >Not exactly. With "--limit-burst 1", no more than one packet per
> >jiffy can pass the test. You may have only 30 NEW packets per
> >second but it doesn't mean one packet every 1/30 s. And if there
> >are two (or more) NEW packets within one jiffy, only the first
> >passes the first rule.
>=20
> One packet per time quantum (which is 1 second here, not 1 jiffy).

I don't think so. With "--limit 2000/s --limit-burst 1" I can pass much=
=20
more than one packet per second (but no more than 1000 per second with=20
HZ=3D1000).

In fact, kernel doesn't even get this information, it works only with=20
rate and it gets exactly the same value from iptables command with e.g.=
=20
'3600/h', '60/m' and '1/s'.

                                                         Michal Kube=C4=
=8Dek
