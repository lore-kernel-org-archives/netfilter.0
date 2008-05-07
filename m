From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: accept rule not working.
Date: Wed, 07 May 2008 17:29:27 +0200
Message-ID: <4821CAD7.5060208@freemail.hu>
References: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "eial@cs.bgu.ac.il" <eial@cs.bgu.ac.il>
Cc: netfilter@vger.kernel.org

eial@cs.bgu.ac.il =EDrta:
> I've created this rule:
> /sbin/iptables -A INPUT -i eth0 -p tcp -m state --state NEW --sport 8=
0 -s 192.168.113.94 -j ACCEPT
>
> but the firewall still blocks it, I guess there is a typo somewhere b=
ut I cant seem to be able to find it
> any hints?
>
>  =20
No typo... maybe... :D

Please include the output of these commands:

iptables -vnL
iptables -t nat -vnL
iptables -t mangle -vnL
iptables -t raw -vnL

Thanx...

Swifty


