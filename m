From: Vincent Bernat <bernat@luffy.cx>
Subject: Re: [ANNOUNCE] Release of iptables-1.4.3.2
Date: Thu, 09 Apr 2009 21:27:18 +0200
Message-ID: <m38wm9eig9.fsf@neo.luffy.cx>
References: <49D9E9A6.7010303@netfilter.org> <49DA0F49.4090802@conversis.de>
	<49DAD5E0.9020303@caf.com.tr> <49DDB24A.80400@chello.at>
	<49DDF7C2.80008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DDF7C2.80008@gmail.com> (Eray Aslan's message of "Thu, 09 Apr
	2009 16:27:30 +0300")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

OoO En  ce d=C3=A9but  d'apr=C3=A8s-midi ensoleill=C3=A9 du  jeudi 09 a=
vril  2009, vers
15:27, Eray Aslan <erayaslan@gmail.com> disait=C2=A0:

>> At least it violates the concept of filtering in the filter table.

> Yes.  Correct place to filter in in the filter table.  But if you ins=
ist
> on doing the "wrong" thing, who is to interfere?

Well, it  depends what  "wrong" is. When  dropping in filter  table, yo=
u
leave an entry in  the conntrack. If you try to drop  to avoid some kin=
d
of DOS, this  is an unwanted effect. When you drop  in PREROUTING in th=
e
nat table, there is no entry in the conntrack. This is really convenien=
t
with matches like "hashlimit".

This loss of functionality should be better explained. Maybe this is th=
e
prelude of some simplification in Netfilter?
--=20
Choose a data representation that makes the program simple.
            - The Elements of Programming Style (Kernighan & Plauger)
