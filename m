From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: conntrack not working in raw table
Date: Mon, 11 Nov 2013 09:54:44 +0100
Message-ID: <52809B54.4000709@plouf.fr.eu.org>
References: <52808545.7070804@metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52808545.7070804@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: hdemir@metu.edu.tr
Cc: netfilter@vger.kernel.org

Husnu Demir a =E9crit :
>=20
> But, raw table cannot see the conntrack.

And vice versa. This is precisely its main purpose.

> I could not find any reference
> in MAN of iptables(-extentions) about conntrack and raw table

Really ? Maybe you missed that quote from the iptables manpage :

        raw:
            This  table  is  used mainly for configuring exemptions fro=
m
            connection tracking in combination with the NOTRACK  target=
=2E
            It registers at the netfilter hooks with higher priority an=
d
            is thus called before ip_conntrack, or any other IP  tables=
=2E

