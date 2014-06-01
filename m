From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: ebtables not blocking arp (or anything). I am using knoppix
Date: Sun, 01 Jun 2014 15:11:05 +0200
Message-ID: <538B2669.4010308@plouf.fr.eu.org>
References: <CAKBM6-PHW3C5r0v+KiFd1nuP7oUrZyw=T_AEs0Nea-1o38D2sg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKBM6-PHW3C5r0v+KiFd1nuP7oUrZyw=T_AEs0Nea-1o38D2sg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: dapiot holmp <dapiotholmp@gmail.com>
Cc: netfilter@vger.kernel.org

dapiot holmp a =E9crit :
> Hi
>=20
> I know what ARP does but for fun, and to see what ebtables can do, I
> want to try to block ARP.

Do you have a bridge ? ebtables acts only on packets received, sent of
forwarded through interfaces which are part of a bridge.
