From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 10:14:30 +0200
Message-ID: <4AA4C0E6.9050101@plouf.fr.eu.org>
References: <4AA4A0D4.3080109@infoservices.in> <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in> <4AA4BD7D.3080405@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4BD7D.3080405@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

J. Bakshi a =E9crit :
> # cat /proc/net/ipt_recent/blacklist
>=20
> src=3D183.131.207.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 429821=
4902
> src=3D240.168.95.31 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 429821=
4902
[...]
> And If I try to remove a line it reports
>=20
> ```````````````
> WARNING: The file has been changed since reading it!!!
> Do you really want to write to it (y/n)?
> `````````````````
>=20
> A yes puts me again into the file. and it is recursive.

You are not supposed to open this pseudo-file and remove lines with a
text editor, you are supposed to *write* commands (e.g. with echo) into
it as indicated in the manpage. This is not a real file but an interfac=
e
to the kernel.

