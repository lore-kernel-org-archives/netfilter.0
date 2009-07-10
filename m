From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 10 Jul 2009 17:30:40 +0200
Message-ID: <4A575EA0.4010802@plouf.fr.eu.org>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>	 <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com>	 <9948385e0907090606x1d33d7abw64c38e7ac6238cc3@mail.gmail.com>	 <5b933efdfd09476e4b00a15fe5dc3ac0@localhost>	 <4A560E0D.40806@plouf.fr.eu.org>	 <23412bf8079dabef19ddd9fbe9022f66@localhost>	 <4A5744DB.4070303@plouf.fr.eu.org> <9948385e0907100800j7ea04888h46663f94ff0dfc54@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9948385e0907100800j7ea04888h46663f94ff0dfc54@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

David Bala=9Eic a =E9crit :
> Just for info, I report that after I "opened" protocol 41 for input
> (and removed the nat table changes) my IPv6 tunnel is working fine fo=
r
> more than 24 hours.

Of course it is working fine.
As I said, the issue was not about conntrack or NAT but filtering. So=20
you needed to modify your filtering rules, not the NAT or conntrack.=20
Good job.
Now maybe you could report this to the authors of the SixXS FAQ. ;-)


