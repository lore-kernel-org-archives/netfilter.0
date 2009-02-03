From: =?UTF-8?B?VmxhZG8gRHLFvsOtaw==?= <vlado@ttx.sk>
Subject: Re: How to reset routing completely?
Date: Tue, 03 Feb 2009 21:42:09 +0100
Message-ID: <4988AC21.7000903@ttx.sk>
References: <200902031943.58617.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200902031943.58617.Karlis.Repsons@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?S8SBcmxpcyBSZXBzb25z?= <karlis.repsons@gmail.com>
Cc: 'netfilter' <netfilter@vger.kernel.org>

There is nothing like initial state. All needs to be initalized by
insterting proper routes, if you reset it.
This is more distribution specifics:
/etc/init.d/network restart (or stop/start)
/etc/init.d/networking restart

K=C4=81rlis Repsons  wrote / nap=C3=ADsal(a):
> While experimenting, I managed to reach a state, where I could not ma=
ke my=20
> network functional again, even if I deleted all rules and routes with=
 ip and=20
> did reset firewall.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

