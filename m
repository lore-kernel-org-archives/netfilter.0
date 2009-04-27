From: Daniel Huhardeaux <daniel.huhardeaux@tootai.com>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 10:52:26 +0200
Message-ID: <49F5724A.80509@tootai.com>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>    <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>    <3fdd6ce00904261538m20468fedudf11ffd6448c8473@mail.gmail.com> <1822.192.168.1.3.1240821057.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1822.192.168.1.3.1240821057.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Jorge Bastos a =E9crit :
>> [...]
>>
>> Another way is to set your after-dhcp script to reload your firewall=
!!
>>    =20
>
> That is no solution. it may be for your cenario but not for the most =
of
> people. Just think, if who makes the connection is a modem, and you h=
ave
> your *unix machine on nat, that won't work
It works. You can:

a) run a script to connect to your modem via http (eg wget), extract=20
your IP and reload iptables rules
b) if you can't connect to your modem, run a script to go to=20
http://www.whatismyip.com/tools/ip-address-lookup.asp and do the same=20
that above

--=20
Daniel Huhardeaux       _____ ____ ____ _____ _____ _
enum   +33 368 460 088 (_  __) _  ) _  (_  __) _  _(_)  +48 222 472 472
iaxtel  1-700-849-6983  / / / // / // / / / / /_/ / /  GIZMO,SKYPE,GTAL=
K
sip/iax:callto 101@sip./_/ ( ___( ___/ /_/ (_/ (_/_/.net   tootaiNET

