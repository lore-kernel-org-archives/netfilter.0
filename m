From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: module owner does not work
Date: Mon, 01 Mar 2010 12:20:52 +0100
Message-ID: <4B8BA314.60804@plouf.fr.eu.org>
References: <15785B7E063D464C86DD482FCAE4EBA5D794CFF8D5@XCH11.scidom.de> <56378e321003010306n21050b6dwd01154e0420b666a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e321003010306n21050b6dwd01154e0420b666a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

Richard Horton a =E9crit :
> On 1 March 2010 09:33, Lentes, Bernd <bernd.lentes@helmholtz-muenchen=
=2Ede> wrote:
>>
>> I'd like to use the owner module to limit access to somes hosts just
>> for some users. But it doesn't work.
>> My rule is:
>> iptables -I OUTPUT -d 0.0.0.0/0 -m owner --uid-owner 1000 -j REJECT
>> This is a very wide rule, just for testing purpose.
>=20
> Do pings still work?

Probably, as ping runs with suid root. Better try with something like
telnet or netcat (nc).

>> But uid 1000 is still able e.g. to send emails from the shell using =
mail.
>
> If you have an MTA locally its probably not going out of the box as
> the uid of the process which called mail but as the uid of the MTA...

I agree.

>> I googeled already a lot, and found people saying the owner-module w=
as
>> canceled in Kernel 2.6.14, others saying that it still works in kern=
el
>> 2.6.18. Some say it does not work with a SMP host. But i have the
>> default kernel and only one CPU.

AFAIK, only the --pid-owner, --sid-owner and --cmd-owner options are
broken on SMP and were removed in kernel 2.6.14. The 'owner' match,
--uid-owner and gid-owner options are still present and work.
