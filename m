From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Playing nice with incoming traceroutes
Date: Mon, 17 May 2010 00:22:56 +0200
Message-ID: <4BF07040.904@plouf.fr.eu.org>
References: <AANLkTimnTBPl5oayp3tprDmROD4bNpIXyAodkZuF_JlS@mail.gmail.com> <AANLkTilTF_pcF5W67BEAhKmNIzpffHhFByKLS2LX7bqy@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilTF_pcF5W67BEAhKmNIzpffHhFByKLS2LX7bqy@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pieter Smit <mlist2010@vigor.co.za>
Cc: Curby <curby@cur.by>, netfilter@vger.kernel.org

Hello,

Pieter Smit a =E9crit :
> You would send an ICMP time exceeded (type 11) packet if you receive =
a
> packet with a ttl=3D1 you will decrement it one realize it is 0 and s=
end
> the ICMP time exceeded.

Only an intermediate router would do that, not the final destination.
