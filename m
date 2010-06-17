From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: move rule to a position
Date: Thu, 17 Jun 2010 09:46:06 -0500
Message-ID: <20100617144606.GH19868@cardinal>
References: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com> <4C1A327C.60004@riverviewtech.net>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C1A327C.60004@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, Jun 17, 2010 at 09:34:36AM -0500, Grant Taylor wrote:
> On 06/17/10 03:26, Mamadou Tour=E9 wrote:
>> Hi, all i'd like to move rule to a position.
>> ex: i've these rules :
>> 1- iptable -A -p TCP --dport 80 -j ACCEPT
>> 2- iptable -A -p TCP --dport 21 -j ACCEPT
>> 3- iptable -A -p UDP --dport 53 -j ACCEPT
>>
>> after executing these command is there a mean to move rule at
>> position 3 to position 1 ?
>> So that the rule at 1 could go to 2 and 2 to 3.
>
> I think your best bet will be to insert a duplicate of rule 3=20
> before the current rule #1 and then delete what will become rule=20
> #4.  I.e.:
>
>    iptables -I 1 -p UDP --dport 53 -j ACCEPT
>    iptables -D 4
>
> Note: I'm use to specifying the chain (FORWARD,INPUT,OUTPUT), so=20
> I'm not exactly sure how well those rules will work as typed. =20
> Y.M.M.V.

The chain is mandatory, but as others mentioned, best practice is to=20
use iptables-save(8)/iptables-restore(8).
--=20
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
