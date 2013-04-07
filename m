From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: logging rsts
Date: Sun, 07 Apr 2013 11:19:45 +0200
Message-ID: <51613A31.7070804@plouf.fr.eu.org>
References: <CAFZB6ArMXsC2cwy1SJhNKsKT8-=jyQaYHM384QwwGTvBo8AVeA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFZB6ArMXsC2cwy1SJhNKsKT8-=jyQaYHM384QwwGTvBo8AVeA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Matt LaPlante a =E9crit :
> During normal use the firewall is frequently
> logging RST packets from 80 and 443.  I presume this is traffic from
> web browsing happening on the lan.  My question is just why these
> packets get dropped so often under normal operations.  Shouldn't they
> be permitted as part of established connections?

Maybe they are related to previous connections which were already close=
d
by a normal FIN sequence.
