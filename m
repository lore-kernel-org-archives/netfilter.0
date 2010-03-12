From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NATed or not NATed
Date: Fri, 12 Mar 2010 21:24:30 +0100
Message-ID: <4B9AA2FE.8090608@plouf.fr.eu.org>
References: <4B989616.7000904@perfaction.net>	 <4B9954FE.5030904@plouf.fr.eu.org> <cfeab66d1003120119v77a51eeavb7dc286f5966cd39@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003120119v77a51eeavb7dc286f5966cd39@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

ratheesh k a =E9crit :
>=20
> A new packet ( not -syn packet ) would be treated as  INVALID ?

Yes.

> We can see this packet in NAT table ?

No, the nat table does not see INVALID packets because stateful NAT
operation relies on valid connection tracking.
