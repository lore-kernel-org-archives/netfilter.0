From: Jan Niggemann <jn@hz6.de>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Thu, 22 Jan 2015 08:55:33 +0100
Message-ID: <20150122085533.Horde.1veF0V8pZQJDW8PLl5XdsA9@htjn.suhail.uberspace.de>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de>
 <54BF086E.5080906@ngtech.co.il>
 <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de>
 <54BFB8A3.7090504@chello.at>
 <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de>
 <54C03496.30504@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54C03496.30504@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	DelSp=Yes"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Zitat von Pascal Hambourg <pascal@plouf.fr.eu.org>:
> Jan Niggemann a =C3=A9crit :
>>
>> nf_conntrack_proto_gre    12886  0
>> nf_conntrack_ipv4      18003  1
>> nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
>> xt_conntrack           12601  1
>> nf_conntrack           57737  3
>> nf_conntrack_proto_gre,xt_conntrack,nf_conntrack_ipv4
>> x_tables               18078  5
>> ip_tables,xt_tcpudp,xt_conntrack,iptable_filter,iptable_mangle
>
> I do not see nf_conntrack_pptp here. It is required so that the first
> GRE packet has the RELATED state.
I had forgotten about that one.

OK, so do I get this right:
 From kernel 3.18 onwards I have to take care to first load the =20
extension modules and only then create the pptp vpn connection?

Is there some kind of mechanism to automatically load the extension =20
modules before initiating the connection and unloading them after the =20
connection has finished?

Jan
