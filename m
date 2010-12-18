From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PREROUTING DNAT *inconsistent* behavior
Date: Sat, 18 Dec 2010 01:15:09 +0100
Message-ID: <4D0BFD0D.2070406@plouf.fr.eu.org>
References: <032601cb9c12$7d1a4890$774ed9b0$@com> <4D0BE21C.7030905@plouf.fr.eu.org> <06c201cb9e46$b4d13560$1e73a020$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <06c201cb9e46$b4d13560$1e73a020$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alec Matusis <matusis@matusis.com>
Cc: netfilter@vger.kernel.org

Alec Matusis a =E9crit :
>> I would have used DNAT instead to make sure
>> the destination address is not changed.
>=20
> Instead of REDIRECT, we used:=20
> -A PREROUTING -d server.ip -p tcp --dport 443 -j DNAT --to-destinatio=
n
> server.ip:5228
> The result is exactly the same.

Do you mean that REDIRECT did not alter the destination address when it
was different from the primary address on eth0 ?

>> What are the other 5% then ?
>=20
> They are mostly RST packets from various clients:

Sure, RSTs are sent in reply to the bogus packets from the servers.

>> They are probably packets classified in the INVALID state by the
>> connection tracking, which are ignored by the nat table. In a NAT
>> setup,
>> INVALID packets should be dropped because of this. Now the real
>> question
>> is : why are they classified in the INVALID state ?
>=20
> How can I verify that  these packets have been classified as in the I=
NVALID
> state? That may be the key to this problem.

As I suggested, DROP packets in the INVALID state. If you don't see the=
m
any more, you'll know.
