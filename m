From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: Re: Log Problem
Date: Mon, 09 Aug 2004 13:05:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4117AEF4.9030904@mail.co.gilchrist.fl.us>
References: <200408091241665.SM01376@Hope> <200408091758.59638.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408091758.59638.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:

> On Monday 09 August 2004 5:40 pm, 'Me' wrote:
>=20
>=20
>> Hi,
>>I=92m having problems logging packets (IPTables: 1.2.8 Kernel: 2.4.8) w=
ith
>>the following rule (from the  FAQ):
>>
>>iptables -N logdrop
>>iptables -A logdrop -j LOG
>>iptables -A logdrop -j DROP
>>
>>On the log line I get:
>>iptables: No chain/target/match by that name
>>
>>I=92m a little lost =96 any pointers?
>=20
>=20
> It seems unlikely, but has your kernel been compiled without support fo=
r the=20
> LOG target (and by the way, why are you using a three year old kernel=20
> anyway?)?
>=20
> Test one thing at a time:
>=20
> 1. Can you use the LOG target?
> iptables -A INPUT -j LOG
>=20
> 2. Can you put a rule into a user-defined chain?
> iptables -N logdrop
> iptables -A logdrop -j DROP
>=20
> If both the above tests work, then there is no reason you shouldn't be =
able to=20
> put a LOG target into your user-defined chain (so check very carefully =
the=20
> syntac of what you are typing when you get the error, etc).
>=20
> If one of the above tests fails, you know where the problem is.
>=20
> Just one last thing to check - you haven't compiled the userspace iptab=
les=20
> tool without also recompiling the kernelspace netfilter part, have you?
>=20
> If you do one of these, you should also do the other to match.
>=20
> Regards,
>=20
> Antony.
>=20
IIRC, Debian ships with 2.4.8 on Current-Stable.  Could be wrong, tho.

--=20
Eric Ellis
Gilchrist County Sheriff's Department
IT Coordinator
eellis@mail.co.gilchrist.fl.us
352-463-3181

