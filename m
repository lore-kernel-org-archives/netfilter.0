From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: move rule to a position
Date: Thu, 17 Jun 2010 09:34:36 -0500
Message-ID: <4C1A327C.60004@riverviewtech.net>
References: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/17/10 03:26, Mamadou Tour=E9 wrote:
> Hi, all i'd like to move rule to a position.
> ex: i've these rules :
> 1- iptable -A -p TCP --dport 80 -j ACCEPT
> 2- iptable -A -p TCP --dport 21 -j ACCEPT
> 3- iptable -A -p UDP --dport 53 -j ACCEPT
>=20
> after executing these command is there a mean to move rule at
> position 3 to position 1 ?
> So that the rule at 1 could go to 2 and 2 to 3.

I think your best bet will be to insert a duplicate of rule 3 before th=
e=20
current rule #1 and then delete what will become rule #4.  I.e.:

    iptables -I 1 -p UDP --dport 53 -j ACCEPT
    iptables -D 4

Note:  I'm use to specifying the chain (FORWARD,INPUT,OUTPUT), so I'm=20
not exactly sure how well those rules will work as typed.  Y.M.M.V.



Grant. . . .
