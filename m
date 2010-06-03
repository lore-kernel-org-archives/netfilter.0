From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Advanced Logging
Date: Thu, 03 Jun 2010 23:16:53 +0200
Message-ID: <4C081BC5.2070109@chello.at>
References: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>	<AANLkTilirP3XipLJewk9fbW_ePm2kZb9QzxdvReyUrDv@mail.gmail.com> <AANLkTikt1N0vb0Y0S_akVrvvcboyXfEjU_97tqgEK0jz@mail.gmail.com> <4C080DCB.9020507@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C080DCB.9020507@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On 03.06.2010 22:17, netfilter-owner@vger.kernel.org wrote:
> On 03.06.2010 20:15, ratheesh k wrote:
>> 2010/5/30 Tom=C3=A1=C5=A1 Vl=C4=8Dek <tomasvlcek@gmail.com>:
>=20
>=20
>>>>           I have implemented  firewall  in my linux machine using
>>>> iptables . It is able to prevent attacks and LOG just before dropp=
ing
>>>> packets . Since i know a little about iptables , i could go thru
>>>> /var/log/messages and find out information about attacks . Is ther=
e
>>>> any application which will analyze logs and  give a brief informat=
ion
>>>> to user about the attacks  ?
>>>>
>>>> For example , suppose there was a syn flood attack ,the applicatio=
n
>>>> should analyse the /var/log/messages or by some means should know
>>>> about the attack and let the user know about that .If there is no
>>>> application ,  could you give some hints on how to develop an
>>>> application .Any comment is  appreciated .
>=20
>=20
>>> Maybe psad (Port Scan Attack Detector) is that what are you looking
>>> for. Check http://cipherdyne.org/psad/index.html.
>>
>> I gone through the link . It seems to be heavy for my embedded
> application .
>>
>> My embedded box is a router with two inerfaces - wan0 and lan0 . I
>> should get information regarding various attacks tried on lan client=
s
>> .I have some implementation in mind .(see below )
>>
>> 1  Is there any tool fit my requirement or  there any tool , i can d=
o
>> a little  modification in code   and use .
>> 2 . Is my idea feasible to implement ? . Is it worth implementing ,
>> because it is run as part of softirq_rx kernel thread . Will it damp=
en
>> performance ?
>> 3 . Could i do this as part of connection tracking module . If , cou=
ld
>> you guide  a little ?
>>
> snort (snort.org) comes into my mind here.
> afaik it has the ability to create inline iptables rules.
> maybe worth a look?
>=20

Reading again, I think the answer was too short.

Doing it all on one embedded device might itself be not that safe.
Besides the effect that the resources maybe limited.
Saved logs on a compromised host could be modified.

Now if you simply analyze logs some time after the attack has happened
it may be a bit late, even if an application has sent you an email or
such, you might read it ~12 hours later.
In most cases you only catch the most obvious 'noisy' attack flood/scan=
=2E
Well you could send an abuse mail, worth the hassle?
You couldn't really do much interactively.

If you are after a pure iptables log message parser for a single host,
things might be limited to some awk/grep/shell/etc... script for pretty
printing.
Most things I've seen would at least require some webserver and/or
database in the background. Many focus on a larger scope/network.

You might just try a search on freshmeat.net or sf.net for i.e.
'iptables log analyzer' or similar.
I.e. I know arnos-iptables-firewall (not that I use that as my nf
generator) has a pretty printing script shipping with it.

So the next step would be some sort of IDS.
But this may also be overkill for your device. I can't tell.
Running a snort instance with inline functionality would give you not
just an opportunity to react to a wider range of attacks (L7) much more
gracefully, also there is a wide range of logging options (and backend
analyze tools available, which of course require more resources and
should be placed on separate hosts - i.e. BASE, or Prelude (with snort
as sensor)).
Doing only minimal text logging for important events might give enough
information without overloading your device.

Just some thoughts.
Hope it helps.

Mart


