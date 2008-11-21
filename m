From: sean darcy <seandarcy2@gmail.com>
Subject: Re: conntrack: will it restart after delete?
Date: Fri, 21 Nov 2008 09:50:34 -0500
Message-ID: <gg6hrq$1kd$1@ger.gmane.org>
References: <gfs68h$560$1@ger.gmane.org> <4921C75B.2020201@plouf.fr.eu.org> <gg56n6$9up$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gg56n6$9up$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

sean darcy wrote:
> Pascal Hambourg wrote:
>> Hello,
>>
>> sean darcy a =E9crit :
>>> I've had a problem with a udp connection being setup before DNAT,=20
>>> occurred. See "where are my udp packets going?" Nov 15, 2008.
>>>
>>> So just before setting up DNAT I'd propose to run:
>>>
>>> conntrack -D -p    udp --dport 4569
>>>
>>> but the user guide says this "blocks" the connection.
>>
>> The user manual only says "this can be used to block traffic" (cut a=
n=20
>> existing connection) with proper ruleset and settings. It does not=20
>> block traffic by itself.
>>
>>> I only want to flush/empty it, and let it start again with DNAT wor=
king.
>>>
>>> Does this do it?
>>
>> I guess so, although I never used conntrack (no need yet).
>> However I would run the conntrack command after setting up DNAT rule=
s,=20
>> because a packet could arrive between the two operations. Deleting a=
=20
>> UDP conntrack entry should be harmless, as the next UDP packet would=
=20
>> create it again anyway.
>> --=20
>=20
> Well, it didn't work:
>=20
> conntrack -D -p    udp --dport 4569
> conntrack v0.9.6: You need to supply the `--sport' option for this co=
mmand
> Try `conntrack -h' or 'conntrack --help' for more information.
>=20
>  conntrack -D -p    udp --sport 4569
> conntrack v0.9.6: You need to supply the `--dport' option for this co=
mmand
> Try `conntrack -h' or 'conntrack --help' for more information.
>=20
>  conntrack -D -p    udp --sport 4569  --dport 4569
> conntrack v0.9.6: Can't kill conntracks just by its IDTry `conntrack =
-h'=20
> or 'conntrack --help' for more information.
>=20
> Puzzled, but trolling through man conntrack.
>=20

Solved. I was using 0.9.6, upgraded to 0.9.8 - now it works.

sean

