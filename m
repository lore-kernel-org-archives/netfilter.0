From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 12:34:21 +0200
Message-ID: <4AA4E1AD.4040200@plouf.fr.eu.org>
References: <4AA4A0D4.3080109@infoservices.in> <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in> <4AA4BD7D.3080405@infoservices.in> <4AA4C0E6.9050101@plouf.fr.eu.org> <4AA4C3B8.7080309@infoservices.in> <4AA4D05E.5050909@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4D05E.5050909@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

J. Bakshi a =E9crit :
>=20
> Even after the blacklist interval the client can access the server
> successfully; the server still shows the client ip as blacklisted.
> Definately the ip can be removed or "clear" as described in the man p=
age
> but storing the ip permanently at  /proc/net/ipt_recent/blacklist  is=
=20
> very confusing.  How can you then check if the ip is still blackliste=
d
> or able to communicate with the server in real-life  ?

The list just stores source addresses and timestamps (the big numbers,
measured in jiffies) of recently seen packets in a FIFO manner. Whether
a packet will match the rule with 'recent' depends on its options
--seconds and/or --hitcount. So it is up to you to parse the timestamps
associated to an address and decide whether this address is blacklisted
or not.
