From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Need for a specific source address selection rule ? (not
 neccessarily netfilter)
Date: Fri, 3 Sep 2010 19:42:16 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009031942001.31358@obet.zrqbmnf.qr>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr> <4C7A6D11.8090306@httrack.com> <4C7A8040.7040002@plouf.fr.eu.org>
 <4C81321F.4010106@httrack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C81321F.4010106@httrack.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Xavier Roche <roche*lkml@httrack.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-09-03 19:36, Xavier Roche wrote:

> Pascal Hambourg a =C3=A9crit :
>> IME, it works for IPv4 but not for IPv6 ; only IPv4 routes seem to
>> support the "src" attribute, and IME src is silently ignored for IPv=
6
>> routes.

That's a bug then, I suppose.
