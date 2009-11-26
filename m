From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: An ping issue on Linux kernel 2.6.25
Date: Thu, 26 Nov 2009 14:15:01 +0100
Message-ID: <4B0E7F55.9030707@plouf.fr.eu.org>
References: <fa33c8ee24ace.24acefa33c8ee@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fa33c8ee24ace.24acefa33c8ee@huawei.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

jiazhida 00102231 a =E9crit :
>=20
>   I have met an issue about Netfilter. The version of my Linux kernel=
 is 2.6.25.
>=20
>   Connect to the internet, and then open the command prompt and ping
> using "ping wwwlclix.pt -t". In the beginning I can get respose but
> after disconnect and connect the internet never responds again, but i=
f I
> try to open the site in the web brower it works.

So you have an issue. Maybe it is related to your setup. But you do not
tell anything about your setup, how could one tell ? Is netfilter
running on the machine which sends the ping or on another machine actin=
g
as a routeur ? Is there some NAT or masquerading ? What is the ruleset =
?
What do you mean by "disconnect and connect" ? Do you have a variable I=
P
address ?

>   I have checked the nf_conntrack table, it seems that the nf_conntra=
ck
> item for icmp had not been updated.

What do you mean by "updated" ? What did you expect, and what do you
observe instead ?
