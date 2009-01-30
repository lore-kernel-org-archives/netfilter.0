From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: newbie question: UDP is stateless ... right?
Date: Fri, 30 Jan 2009 21:14:04 +0100
Message-ID: <49835F8C.2040803@plouf.fr.eu.org>
References: <87fa72960901301050n7d982887waadc1fc090fc96ed@mail.gmail.com> <49835151.8010701@www.knutejohnson.com> <573116CBE1A14366854B66613B492596@Hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <573116CBE1A14366854B66613B492596@Hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Nikolay S. Rybaloff a =E9crit :
> If you are talking about netbios name resolution via UDP:137, than th=
is=20
> is a bit more complex. These packets are mostly network-directed=20
> broadcasts so AFAIK state rule is not created for them and reply pack=
ets=20
> look like NEW.

Actually the default netfilter UDP conntrack doesn't care about=20
broadcast addresses and will create en entry after the initial netbios=20
request to the broadcast address. But the reply from a different=20
(unicast) address won't match the conntrack entry.
