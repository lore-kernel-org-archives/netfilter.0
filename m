From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables Qu: how to specify !dst:port
Date: Fri, 12 Jul 2013 15:00:44 +0200
Message-ID: <51DFFDFC.1060204@plouf.fr.eu.org>
References: <51DFEFC1.6070708@die-optimisten.net> <CAOkSjBibSebbEvOfnZRQgLO4_tKHPTcyCJ-YpKaU60J_9sWWBA@mail.gmail.com> <51DFF730.2090203@die-optimisten.net> <CAOkSjBhV9YE=hrX4+OcF++F_dDvtRZVd94sSP=4m-rynPZJ6gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBhV9YE=hrX4+OcF++F_dDvtRZVd94sSP=4m-rynPZJ6gQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hello,

Arturo Borrero Gonzalez a =E9crit :
> 2013/7/12 Die Optimisten <inform@die-optimisten.net>:
>>
>> How can I write -t nat
>>     [all except these 2:]    (! -d 127.0.0.1 -and  ! -d  192.168.0.0=
/16)  ?
>=20
> I would do it with ipset(8).

ipset is overkill for just a couple of prefixes.

iptables -t nat -A PREROUTING -d 192.168.0.0/16 -p tcp --dport 443 \
  -j RETURN
iptables -t nat -A PREROUTING ! -d 127.0.0.1 -p tcp --dport 443 \
  -j DNAT --to 127.0.0.1:8000
