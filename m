From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 10 Jul 2009 15:40:43 +0200
Message-ID: <4A5744DB.4070303@plouf.fr.eu.org>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com> <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com> <9948385e0907090606x1d33d7abw64c38e7ac6238cc3@mail.gmail.com> <5b933efdfd09476e4b00a15fe5dc3ac0@localhost> <4A560E0D.40806@plouf.fr.eu.org> <23412bf8079dabef19ddd9fbe9022f66@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <23412bf8079dabef19ddd9fbe9022f66@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Benedikt Gollatz a =C3=A9crit :
>
>>> You need to accept proto-41
>>> packets in the PREROUTING chain to stop the connection tracker from
>>> looking at them.
>>=20
>> Wrong. Connection tracking happens anyway.
>=20
> You'll have to tell that to the authors of the SixXS FAQ.

Maybe. I just read the FAQ entry about connection tracking, and I didn'=
t=20
think it was so clueless about Linux conntrack. But I'm so lazy, and=20
SixXS puts so many requirements about how to contact them.

>> Anyway what David need is to allow 6in4 traffic from the tunnel=20
>> endpoint. This has nothing to do with connection tracking.
>=20
> Traffic passing through at first and after a certain time not being a=
ble to
> pass anymore is a classic symptom of problems with connection trackin=
g.

It less about connection tracking than about how connection tracking=20
states are used in filtering rules. Connection tracking does not matter=
=20
if you accept all traffic. So it is a mostly a filtering issue.


