From: Aidas Kasparas <a.kasparas@gmc.lt>
Subject: Re: ipset: stops working after a while
Date: Tue, 12 Jun 2012 08:24:03 +0300
Message-ID: <4FD6D273.1000308@gmc.lt>
References: <4FD03AE5.9000509@gmc.lt> <alpine.DEB.2.00.1206070856221.11710@blackhole.kfki.hu> <4FD0E83D.7030806@gmc.lt> <201206071722.41790.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201206071722.41790.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

On 2012.06.08 00:22, Neal Murphy wrote:
> On Thursday 07 June 2012 13:43:25 Aidas Kasparas wrote:
>> On 2012.06.07 09:59, Jozsef Kadlecsik wrote:
>>> Maybe your given set gets full. From the manpage:
>>>
>>> "When  entries  added  by the SET target of iptables/ip6tables, the=
n the
>>> hash size is fixed and the set won't be duplicated,  even  if  the =
 new
>>> entry cannot be added to the set."
>>
>> Ok. But if set is full, and I list it, it should show at least some
>> members present. When it stops working, it shows no members at all.
>>
>> On the other hand, I create sets with timeout 10. So, every 3 secs t=
here
>> should be expiration process which trows ~ 1/3 of entries from each
>> chain. And this should make place for some new entries.
>=20
> I'll address *your* problem, not the problem you observed with the ip=
set code=20
> (which may be a real problem).
>=20

Thanks. I tried to increase hash sizes, reenable DROPs and found out
that there was an error in the destination IP address of ACCEPT rule,
which had to pass good packets through. System corrected works for
several days now, so I believe the ipset code had no problems which
affected my setup.

> How many entres are in the set when it is 'full'? Have you tried sett=
ing the=20
> initial size of the hash to the maximum (64ki?)?
>=20
> Utilization of a set ought to be non-deterministic because you can't =
know how=20
> many 'new' addresses will arrive in any given time interval. In other=
 words (a=20
> contrived example), suppose at time T you had 64ki addresses in the h=
ash with=20
> 20,000 set to expire in 3=E2=85=93 seconds (the rest later). In the n=
ext 3333ms, 2000=20
> new addresses arrive but can't fitin the set. At T+3333ms, 20k addres=
ses=20
> expire. In the next 2000ms, 21k new addresses arrive; 1000 of them wo=
n't fit=20
> in the set. 80Mb/s allows for a lot of packets; even slow consumer-gr=
ade=20
> switches can exceed 64ki addresses in 10 seconds via SYN packets.
>=20
> Given all that, can you redesign your sets so you don't (maybe can't)=
 fill=20
> them?

Well, lets do the math.
80Mbps is 10MBps.
60 bytes on wire for SYN packet makes 167k SYN packets/s.
I have 222 sets, so, if I'm lucky and attack spreads evenly over all of
them, I have 750 inserts/ set * sec.
In practice, I never seen a set filled with more than 9000 entries.
Maybe monitoring lies and attack is not so big. Maybe small fraction of
packets overflow collision bucket and are not inserted.

Anyway, I upped hash size to 8k and 16k on two different boxes. As in
latter case this can use up to 2.5GB of RAM just for ipsets, and
hardware I'm renting has 4 and 8GB of RAM, I was not able to go higher.

On the other hand I still need to check, how good jhash2 is for my case=
,
as all the IPs in one set have the same first byte. And how difficult
would be to construct addresses to collide with given IP address of goo=
d
guys.

Thanks again.

--=20
Aidas Kasparas
IT administrator
GM Consult Group, UAB

http://www.gmc.lt
