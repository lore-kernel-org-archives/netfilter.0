From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT for locahost to IP LAN for mail services
Date: Fri, 28 Nov 2008 12:23:43 +0100
Message-ID: <492FD4BF.6030101@plouf.fr.eu.org>
References: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com>	 <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>	 <492F3057.8010007@plouf.fr.eu.org> <98028b00811271627n45966505pf4fcd3aed4814700@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <98028b00811271627n45966505pf4fcd3aed4814700@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Zagato a =E9crit :
> cant't i redirect the packect from 127.0.0.1 to 192.168.0.5 and then
> 192.168.0.3 ?... so 127.0.0.1 and 192.168.0.5 are in the same host an=
d
> 0.3 its  another phisical PC.... this it's possible ?

Not using iptables. However it is possible using a TCP relay/proxy such=
=20
as rinetd, socat, redir, stone, simpleproxy... which opens a listening=20
socket on the local machine and forwards any connection to a remote=20
host. This does not require NAT at all.
