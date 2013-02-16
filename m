From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Redirecting DNS Not Working
Date: Sat, 16 Feb 2013 18:03:11 +0100
Message-ID: <511FBBCF.70800@plouf.fr.eu.org>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>	 <1360946103.2251.2.camel@andylaptop> <511F6EF3.5090506@plouf.fr.eu.org> <1361015492.10501.44.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1361015492.10501.44.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Andrew Beverley a =E9crit :
>> Nonsense. You should read the manpage more carefully.
>>
>> QUOTE
>>  REDIRECT
>>  This  target is only valid in the nat table, in the PREROUTING and =
OUT-
>>  PUT chains, and user-defined chains which are only  called  from  t=
hose
>>  chains.   It redirects the packet to the machine itself by changing=
 the
>>  destination IP  to  the  primary  address  of  the  incoming  inter=
face
>>  (locally-generated packets are mapped to the 127.0.0.1 address).
>> END OF QUOTE
>=20
> Okay, I stand corrected, although I personally would still use the DN=
AT
> target for that use-case :)

Both can be used. DNAT gives more control, as it allows to specify the
destination address.

> Incidentally, the manpage stipulates "--to-ports" but the earlier
> example in the same manpage is "--to-port". Both seem to be accepted.
> Any difference?

No, it appears that partial options can be used (as long as they are
unambiguous, I guess). --to also works.
