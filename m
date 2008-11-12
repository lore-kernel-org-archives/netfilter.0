From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FTP-server on non-standard port behind DNAT, client behind SNAT
Date: Wed, 12 Nov 2008 12:03:25 +0100
Message-ID: <491AB7FD.30102@plouf.fr.eu.org>
References: <1226405797.16116.19.camel@casper.meteor.dp.ua>	 <4919A1C4.6080207@plouf.fr.eu.org>	 <1226418864.16116.25.camel@casper.meteor.dp.ua>	 <4919D9E5.2090603@plouf.fr.eu.org> <1226480946.6370.1.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1226480946.6370.1.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pokotilenko Kostik a =E9crit :
>=20
> You are extremely right :) That was the case, removing MasqueradeAddr=
ess
> made it work!

Glad it helped. However I wonder why it was working on port 21 and not=20
on port 3421.

> I was unable to find the information on how does conntrack_ftp/nat_ft=
p
> work, otherwise I would found out the right way.

The source code is available. (just kidding)

The Netfilter conntrack/NAT helper is smart enough and does all the=20
dirty job transparently so neither the client or server should bother=20
about NAT issues. It monitors the control connection, translates the=20
address and port information in it, translates and marks the data=20
connections as RELATED, in both active and passive modes. All this=20
assumes that the control connection is cleartext, not encrypted with=20
SSL/TLS.

Note that if you want to use active mode on the non standard port from=20
the masqueraded client, the SNAT device must be aware that this ports i=
s=20
used for FTP control connections. Most NAT devices handle FTP only on=20
port 21.

Only when the NAT device is "dumb" (not FTP-aware) or encryption is use=
d=20
the masqueraded end must advertise the public address, reserve a port=20
range for data connections and have this port range explicitly DNATed t=
o=20
its private address by the NAT device.
