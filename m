From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Forced lladdr change with bridge - or not?
Date: Tue, 24 Aug 2010 13:21:13 +0200
Message-ID: <4C73AB29.60303@plouf.fr.eu.org>
References: <835126759.1436781282547490956.JavaMail.root@tendai.telenet-ops.be> <632287680.1437041282547640257.JavaMail.root@tendai.telenet-ops.be> <4C722DBC.6060000@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C722DBC.6060000@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Bart De Schuymer <bdschuym@pandora.be>, Jan Engelhardt <jengelh@medozas.de>

Pascal Hambourg a =E9crit :
> bdschuym@telenet.be a =E9crit :
>=20
>> Apparently you can get around this problem, see (I didn't verify):
>> http://backreference.org/2010/07/28/linux-bridge-mac-addresses-and-d=
ynamic-ports/
>=20
> "if the bridge's MAC address is forced to a specific value, the bridg=
e
> "remembers" that and makes the address permanent. But there's a cavea=
t:
> the address must belong to one of the devices enslaved to the bridge"
>=20
> Hmm, I remember I had a similar idea, but it didn't work : the addres=
s
> was not permanent and could still be replaced if an interface with a
> lower MAC address was added. Maybe I didn't do things right, I will t=
ry
> again, thanks.
>=20
> I had the idea that maybe it was a kernel change, so looking at the
> kernel changelogs, I found this in ChangeLog-2.6.27 :
>=20
>> commit 92c0574f11598c8036f81e27d2e8bdd6eed7d76d
>> Author: Stephen Hemminger <shemminger@vyatta.com>
>> Date:   Tue Jun 17 16:10:06 2008 -0700
>>
>>     bridge: make bridge address settings sticky
>>
>>     Normally, the bridge just chooses the smallest mac address as th=
e
>>     bridge id and mac address of bridge device. But if the administr=
ator
>>     has explictly set the interface address then don't change it.
>=20
> At the time I tried to force a permanent MAC address to the bridge I
> used a kernel older than 2.6.27, this explains why it didn't work.

I tried again. Indeed it worked with 2.6.27 but not with 2.6.26, as
expected. Contrary to the article, I observed that the statically
assigned MAC address can be arbitrary and does not have to belong to on=
e
of the enslaved devices.
