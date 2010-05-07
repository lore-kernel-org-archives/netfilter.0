From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 07 May 2010 11:57:51 +0200
Message-ID: <4BE3E41F.7030601@plouf.fr.eu.org>
References: <201005061651.40203.rfeng@wurldtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201005061651.40203.rfeng@wurldtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Feng <rfeng@wurldtech.com>
Cc: netfilter@vger.kernel.org

Hello,

Richard Feng a =E9crit :
>=20
> I am using Linux 2.6.29. I have the problem for using 'conntrack'=20
> (version:0.9.14) to block the traffic.
> Using the following command as example:
>   conntrack -D -s 1.1.1.1 -d 2.2.2.2
> After execution, it appears the connection info was deleted -
>   conntrack -L | grep 1.1.1.1 -- shows the entry was deleted.
>=20
> However, the connection is still active

What do you mean exactly ?
The conntrack tool only deals with netfilter connection tracking, not
with the actual connection (e.g. it won't send RST's in order to tear i=
t
down). How it may affect the actual connection depends on the iptables
ruleset.
