From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: How stop DoS and SYN attack..
Date: Tue, 6 Jun 2006 14:00:03 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0606061356290.13353@darkstar.sysinfo.com>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49C72@knowledge.wizdom.nu>
	<4485974C.3060500@kernelproject.org>
	<e32f231c0606060836x7a4856bdx8ed1e2146723e46d@mail.gmail.com>
	<4485B9F2.3030300@kernelproject.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-694929285-1149616803=:13353"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4485B9F2.3030300@kernelproject.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Jeho Park <jhpark-nf-user@kernelproject.org>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-694929285-1149616803=:13353
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	k56I06Kr013379

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



DDOS, whence the attacker flood you with more packets then your pipe<s>=20
can handle leaves you at pretty much the mercy of the attacker.  No=20
different the plumbing if a one inch pipe is fed by a 5 inch pipe, the on=
e=20
inch pipe is filled to more  then is can push forth.  Upstream providers=20
might beable to provide some assitance in limiting the flood, but if the=20
aggregate bandwidth of the attacking pipe<s> are again larger then the=20
upstream SOL is the case.


Thanks,

Ron DuFresne

On Wed, 7 Jun 2006, Jeho Park wrote:

> Alberto Ferrer wrote:
>
>> =BFSo its impossible stop a DDoS ? (SYN Flood in my case.)
>>=20
> if you limit DDos to the TCP SYN flood, you may be right
> but there are so many DDos patterns not based TCP..
> so if you make enable tcp_sync_cookies flag of your kernel, you can pro=
tect=20
> TCP sync attack,
> but as time goes on, your system and network will be stoped. so that so=
lution=20
> can't solve the problem basically
> ( please refer to the "sietse van zanen"'s post and=20
> http://www2.laas.fr/METROSEC/attacks-taxonomy-SAR2005.pdf )
>
> in the DDOS problem, i think QoS or  my idea dropping any flooding pack=
et in=20
> NIC driver layer may give a more  general solution than  IP-based netfi=
lter.=20
> there are so many paper to solve this DDos, but as i know there is none=
 exact=20
> solution to resolve this DDos exactly.=20
>>=20
>> 2006/6/6, Jeho Park <jhpark-nf-user@kernelproject.org>:
>>=20
>>> Sietse van Zanen wrote:
>>>=20
>>> >There's not really very much you can do about DDOS attacks with netf=
ilter=20
>>> alone. You can block the traffic ofcourse, or try to fiddle with --li=
mit,=20
>>> or tcp_syn_cookies.
>>> >
>>> >
>>> i think as a attacker try to send more and more sync packets, router
>>> will lose cpu time and system resource .. even if  tcp_syn_cookies
>>> function is active or not. the reason i think like this is that i hea=
rd
>>> tcp_syn_cookies
>>> can't stop router being slow..
>>>=20
>>> in this DDOS attaction problem, i suggest  as NIC driver module detec=
ts
>>> packet flooding, DOS attack and block or
>>> ignore the packet which is sent from the attacker. we can protect out
>>> network backlog safely and there will be no network soft irq ..
>>>=20
>>> a few week later, i will try to test my idea.
>>> i will use detection engine i made 3 year ago (
>>> http://sourceforge.net/projects/geto )
>>> as a result, i can't sure my idea is right. so i try to test that.
>>>=20
>>> >But usually the problem is that the amount of traffic just fills you=
r=20
>>> entire Internet connecection, which renders it useless. The only thin=
g you=20
>>> can do in such a situation is ask yout ISP to block the attack upstre=
am.
>>> >And often, ISPs are very unhappy about customers being DDOS-ed.
>>> >
>>> >-Sietse
>>> >
>>> >-----Original Message-----
>>> >From: netfilter-bounces@lists.netfilter.org=20
>>> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Alberto F=
errer
>>> >Sent: Saturday, June 03, 2006 10:33 PM
>>> >To: netfilter@lists.netfilter.org
>>> >Subject: How stop DoS and SYN attack..
>>> >
>>> >=BFany know a way to stop via Linux with iptables or related a SYN a=
ttack ?
>>> >=BFwhere i can read something related to this?
>>> >
>>> >Thanks in advance.
>>> >
>>> >P.S: sorry for my bad english :D
>>> >--
>>> >Alberto Ferrer
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>>=20
>>>=20
>>=20
>>=20
>
>
>

- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEhcKlst+vzJSwZikRAi5LAJ9opjo/1eY+E7f2qMMcq2HngOvHbgCfSxh+
FOAn6Zu6gKPUXe44jaKYEOo=3D
=3Dj8h6
-----END PGP SIGNATURE-----
--1028002384-694929285-1149616803=:13353--

