From: Michal =?utf-8?q?Kube=C4=8Dek?= <mkubecek@suse.cz>
Subject: Re: limit module timer precision issue
Date: Thu, 13 Oct 2011 15:08:19 +0200
Message-ID: <201110131508.20000.mkubecek@suse.cz>
References: <20111013014310.4369d65e@wwwwww-701SD> <201110131323.04339.mkubecek@suse.cz> <alpine.LNX.2.01.1110131420310.16250@frira.zrqbmnf.qr>
Reply-To: mkubecek@suse.cz
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1110131420310.16250@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="macroman"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>

On Thursday 13 of October 2011, Jan Engelhardt wrote:
> Well, burst does not specify any rate, so claiming "per second" (or
> "per jiffy") does not make sense anyway.

It does. The match works with jiffy granularity and if you look at the=20
source, you'll see that no more than burst packets per jiffy can pass.

> --limit 2000/s should always give you 2000 packets somehow
> distributed over 1 second for any burst value <=3D 2000. The fact tha=
t
> it does not (you observe 1000/s) hints towards what I said earlier
> that high-rate matching in xt_limit and xt_hashlimit has
> inaccuracies.

This is not an inaccuracy, this is simple result of how the token bucke=
t=20
algorithm works. You can never get more than burst packets per jiffy=20
simply because you don't get more than burst tokens. The rate you get i=
s=20
approximately min(avg, burst*HZ).

The same problem exists in TBF: no matter what rate do you specify, rea=
l=20
rate is effectively limited by burst*HZ (and by mtu*HZ). Fort TBF, this=
=20
is even mentioned in the documentation.

                                                          Michal Kube=C4=
=8Dek
