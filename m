From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 10 Jul 2009 13:50:21 +0200
Message-ID: <23412bf8079dabef19ddd9fbe9022f66@localhost>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com> <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com> <9948385e0907090606x1d33d7abw64c38e7ac6238cc3@mail.gmail.com> <5b933efdfd09476e4b00a15fe5dc3ac0@localhost> <4A560E0D.40806@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A560E0D.40806@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Thu, 09 Jul 2009 17:34:37 +0200, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Benedikt Gollatz a =C3=A9crit :
>> On Thu, 9 Jul 2009 15:06:52 +0200, David Bala=C5=BEic <xerces9@gmail=
=2Ecom>
>> wrote:
>> You need to accept proto-41
>> packets in the PREROUTING chain to stop the connection tracker from
>> looking
>> at them.
>=20
> Wrong. Connection tracking happens anyway.

You'll have to tell that to the authors of the SixXS FAQ.

> Anyway what David need is to allow 6in4 traffic from the tunnel=20
> endpoint. This has nothing to do with connection tracking.

Traffic passing through at first and after a certain time not being abl=
e to
pass anymore is a classic symptom of problems with connection tracking.
