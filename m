From: Die Optimisten <inform@die-optimisten.net>
Subject: Re: iptables Qu: how to specify !dst:port
Date: Fri, 12 Jul 2013 18:09:24 +0200
Message-ID: <51E02A34.2080101@die-optimisten.net>
References: <51DFEFC1.6070708@die-optimisten.net> <CAOkSjBibSebbEvOfnZRQgLO4_tKHPTcyCJ-YpKaU60J_9sWWBA@mail.gmail.com> <51DFF730.2090203@die-optimisten.net> <CAOkSjBhV9YE=hrX4+OcF++F_dDvtRZVd94sSP=4m-rynPZJ6gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBhV9YE=hrX4+OcF++F_dDvtRZVd94sSP=4m-rynPZJ6gQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 2013-07-12 14:50, Arturo Borrero Gonzalez wrote:
> 2013/7/12 Die Optimisten <inform@die-optimisten.net>:
>  =20
>> Hi!
>> Thanks for your fast answer!!
>>
>> How can I write -t nat
>>     [all except these 2:]    (! -d 127.0.0.1 -and  ! -d  192.168.0.0=
/16)  ?
>>
>>    =20
> I would do it with ipset(8).
>
> --
> Arturo Borrero Gonz=C3=A1lez
>  =20
Hello
Aha, seems it is not possible with iptables (alone)?
- Is it also possible to check against 1000 IPs with ipset  (performanc=
e) ?
How to check against 1000 MACs (no mactables?!, only aprtables)

  Another question (yes, I know this is a iptables-list, but perhaps
interesting to all):
I've heard it is possible to have a tunnel, which doesn't disconnect th=
e
inside running (tcp-) sessions, if connection is lost.
How can this be done?
Is there a max (inner) timeout, within that you have to reconnect the
outer tunnel? How can the timeout be changed?
Or is there a possibility to reopen the tunnel next day without breakin=
g
the inner connections?That would be fine!
Sg. existing already?
Idea: a tool that "simulates" the other end and takes over the
connection, when other side doesn't respond (just ACKs, without data?)


Please also reply to me directly  inform@die-optimisten DOT net

thanks again!
Andrew

