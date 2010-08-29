From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Need for a specific source address selection rule ? (not
 neccessarily netfilter)
Date: Sun, 29 Aug 2010 17:00:18 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008291659180.10349@obet.zrqbmnf.qr>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr> <4C7A65D5.7090803@httrack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A65D5.7090803@httrack.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Xavier Roche <roche*lkml@httrack.com>
Cc: netfilter@vger.kernel.org

On Sunday 2010-08-29 15:51, Xavier Roche wrote:

> Jan Engelhardt a =C3=A9crit :
>> ip route add $(address of google.com) src $(my alternate address)
>
> Yes, but not for protocol, owner, and any other rule. This is direct =
routine
> from a network to another one.

Well no, routing only concerns itself with layer-3 factors.
