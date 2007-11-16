From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Matching by packet connection
Date: Fri, 16 Nov 2007 10:31:38 +0100
Message-ID: <473D637A.3040708@plouf.fr.eu.org>
References: <d95317090711160041n20025e6fldce7387cef82a115@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090711160041n20025e6fldce7387cef82a115@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Gilad Benjamini a =E9crit :
> Is there a way to match a packet against a connection's direction ?
>=20
> e.g. apply this rule
> iptables -A chain --destination mymachine -m state --state ESTABLISHE=
D
> -j another_chain
> only to packets belonging to CONNECTIONS with destination mymachine

I think the 'conntrack' match is what you need.

-m conntrack --ctorigdst <mymachine> --ctstate ESTABLISHED
