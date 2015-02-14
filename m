From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: how to bind NF_ARP family in netfilter queue
Date: Sat, 14 Feb 2015 21:33:04 +0100
Message-ID: <54DFB100.4000700@plouf.fr.eu.org>
References: <CA+HxBUK5wPU69xV+xvtFKMk9qyVbiDxcz0O=vqx+t7Tg3hibuA@mail.gmail.com> <54DF9E7F.9020205@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54DF9E7F.9020205@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Noel Kuntze a =E9crit :
>=20
> You need to use ebtables to get arp messages.

Or arptables. ebtables only works with a bridge. But AFAICS neither
arptables nor ebtables seems to have a queue or nfqueue target.
