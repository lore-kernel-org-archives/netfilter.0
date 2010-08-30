From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Mon, 30 Aug 2010 23:34:41 +0200
Message-ID: <4C7C23F1.2080206@plouf.fr.eu.org>
References: <4C7A67B3.4070505@wpkg.org> <4C7A7CB7.9020701@plouf.fr.eu.org> <4C7A8EED.9060203@wpkg.org> <4C7BF4FD.6040601@plouf.fr.eu.org> <4C7BFAA9.7080701@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7BFAA9.7080701@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: netfilter@vger.kernel.org

Tomasz Chmielewski a =E9crit :
> On 30.08.2010 20:14, Pascal Hambourg wrote:
>=20
>>> With these rules, I'm not able to communicate (i.e. ping) with othe=
r
>>> hosts in the same subnet, except the gateway (although this was the=
 same
>>> with my previous rules, I think).

I am not very experienced with ebtables, so maybe I missed something. I
quickly tested these rules with two hosts and they seemed to work as
expected.

>> Of course these rules are just a part of the ruleset. Did you do the
>> same for all other bridge ports and hosts in the subnet ?
>=20
> No, I did not.

Communication is two-way. The rules I suggested accept only one way. Th=
e
other way depends on the rest of the rules.

> So even if it's blocked on one bridge, rogue MAC/IP can still "get=20
> outside" and interfere with other bridges/guests?

That would imply that the host is connected to multiple bridges. Of
course each bridge is independent.
