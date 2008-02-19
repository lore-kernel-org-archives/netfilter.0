From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port forwarding (non-NAT)
Date: Tue, 19 Feb 2008 11:49:20 +0100
Message-ID: <47BAB430.9040104@plouf.fr.eu.org>
References: <16791323.9561203376688071.JavaMail.SYSTEM@tater> <47BA2235.4050806@erentil.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47BA2235.4050806@erentil.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Jon Wilson a =E9crit :
> Kristofer wrote:
>=20
>> I've googled and done some searches, and the only information I can=20
>> find is for port forwarding with NAT. Perhaps that's what I need to=20
>> accomplish what I am trying to do.
>> I currently have an SMTP server listening on port 25, and the machin=
e=20
>> has its own static IP address, no NAT is being used.
>> I want to use iptables to forward inbound traffic on port 587 to por=
t=20
>> 25 of that same machine, so basically making SMTP listen on both=20
>> ports. I do not wish to configure the SMTP software to listen on=20
>> multiple ports, since I may want to open up several more ports in th=
e=20
>> future and that would be a lot of idle daemons listening on ports th=
ey=20
>> may or may not use.

Huh ? What is that SMTP software which requires tu run one separate=20
daemon for each listening port ? If it can use inetd, you can have it=20
listening on multiple ports even without a single idle daemon running=20
(except inetd itself of course).

>> So, my questions is: how can I have incoming traffic on port 587 go =
to=20
>> port 25 of the localhost?

Port forwarding is a form of destination NAT. It can also be done with =
a=20
TCP relay such as 6tunnel, but the final destination sees only the rela=
y=20
address, not the original source address. Not very convenient for=20
logging or access control.

> if iptables on the same computer as the smtp server:
>=20
> iptables -t nat -A PREROUTING -p tcp --dport 587 -m state --state NEW=
 -d=20
> $IP_OF_MAIL_SERVER -j REDIRECT --to-ports 25
>=20
> else:
>=20
> iptables -t nat -A PREROUTING -p tcp --dport 587 -m state --state NEW=
 -d=20
> $IP_OF_MAIL_SERVER -j DNAT --to $IP_OF_MAIL_SERVER:25

Note that the second rule also works on the server itself.
