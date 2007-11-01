From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Netfilter Performance when using MAC filter
Date: Thu, 01 Nov 2007 15:55:47 +0100
Message-ID: <4729E8F3.5020801@plouf.fr.eu.org>
References: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com>	 <1193855211.18366.73.camel@grateful.d.umn.edu>	 <4728D541.9010308@plouf.fr.eu.org>	 <1193859183.5142.2.camel@grateful.d.umn.edu>	 <4729A4D6.2020106@plouf.fr.eu.org> <1193923052.5142.9.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1193923052.5142.9.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Matt Zagrabelny a =E9crit :
>=20
> Okay, I see now. Performance would be related to the number of rules
> that each packet needs to be tested against not against the criterion=
 of
> the match.

One suggestion : if performance happens to be an issue, it might be=20
worth using ipset and the 'set' match instead of the 'mac' match.
