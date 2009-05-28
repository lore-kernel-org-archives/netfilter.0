From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Does nat rules take effect on local ip traffic?
Date: Thu, 28 May 2009 23:49:41 +0200
Message-ID: <4A1F06F5.8020900@plouf.fr.eu.org>
References: <a4ece3070905281247l18c3276epf1cfd116267b913f@mail.gmail.com> <a4ece3070905281258i66f6e1d1l352284fd756755b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a4ece3070905281258i66f6e1d1l352284fd756755b4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Sharevon a =E9crit :
> Will this nat rules take effect on this local ip traffic?

What rules exactly ?
Rules in OUTPUT and POSTROUTING do, rules in PREROUTING don't (because=20
NAT rules take effect on new connections only and the connection is not=
=20
new any more after leaving POSTROUTING).
