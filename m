From: Steve Kann <stevek@stevek.com>
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 4 May 2013 18:07:07 -0400
Message-ID: <806D468E-D006-41C3-AD0B-DC24747DC05F@stevek.com>
References: <5185444B.3090602@gmail.com> <9a3b8ec43ac420e45247dd70d2a597e1.squirrel@sqrl.metu.edu.tr>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9a3b8ec43ac420e45247dd70d2a597e1.squirrel@sqrl.metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: hdemir@metu.edu.tr
Cc: Alex Flex <aflexzor@gmail.com>, netfilter@vger.kernel.org


hdemir,

	If you're tracking incoming connections using conntrack, you are reall=
y defeating the whole purpose of syncookies (i.e. handling incoming SYN=
 in a stateless way).   You can set up a iptables firewall which is eit=
her totally stateless, or at least does not use state for the open TCP =
ports which can be SYN flooded.  =20

	However, even if you do that, you're probably not out of the woods.   =
Even taking ip_conntrack state out of the equation, I still haven't bee=
n able to get linux SYN Cookies to scale very well;  it still fails aro=
und 100-150,000 pps.

-SteveK


On May 4, 2013, at 5:39 PM, hdemir@metu.edu.tr wrote:

> Hi Alex,
>=20
> I have a that problem also.I solved with CPU Affinity and disabled al=
l the
> power properties of the hardware (s1, s2, s3). But with the syn attac=
k the
> problem is that conntrack number increasing too fast. I have a max va=
lue
> of 10 million and it fills up about less than 10 min.
>=20
> =FD also wonder about how to stop ddos of conntrack max value. Perhap=
s
> somebody shoul implement conntrack without syn, syn-ack. I think Juni=
oer
> has this feature. Like having syncoockies in conntrack.
>=20
>=20
> Regards.
>=20
> hdemir.
>=20
>> Hello Netfilter,
>>=20
>> Ive been receiving lately two types of syn floods on an Intel Xeon
>> 2.4ghz + 4GB machine exclusively dedicated for this and the findings
>> have me very confused:
>>  I have syn cookies enabled and checked to be working as per syslog.
>> This machine has a 10gigabit uplink so I know that networking isnt a
>> bottleneck here (bandwith or router hardware based).
>>=20
>> SCENARIO 1: the first attack was: 105mbits @ 330,000 pps and it brou=
ght
>> the machine to 100% CPU usage and over 50% packetloss Load average 1=
2.
>> At that time it had a simple iptables script that that had less then=
 5
>> blacklists of port 80 ips and then a ACCEPT On port 80, nothing fanc=
y. I
>> disabled iptables and load average went down immediately to 8 but th=
ere
>> was still high packet loss so basically we where DoSed efficiently.
>>=20
>> SCENARIO 2: After that the attacker sent only a 30mbit synflood @ 70=
,000
>> pps .. Now i had less packet loss, and interestingly with iptables
>> enabled it would create almost immediate packetloss. At this time I
>> tried to explore installing conntrack-tools information about the st=
ate
>> table. conntrack said that with iptables enabled and syncookies the
>> maximum entries where 1300 ONLY... and a CPU usage reported by HTOP =
of
>> 40% on SI. After that I decided to drop iptables all together and
>> immediately port 80 started flowing with normal traffic (we have les=
s
>> than 1mbit clean traffic) . No packetloss was present, because iptab=
les
>> was disabled conntrack did not report any entries and netstat-na |wc=
 -l
>> reported less than 300.
>>=20
>> Questions:
>>=20
>> a.) Can anybody suggest why there is so much CPU overhead when iptab=
les
>> is turned on and dealing with such PPS? Is this normal? Usually what=
 CPU
>> usage does a syn flood cookie enabled take?
>>=20
>> b.) Is there a chance that the attacker exausted something else iam =
not
>> seeing?
>>=20
>>=20
>> Thanks for the help guys
>>=20
>> Alex
>>=20
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

