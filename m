From: Jason Clark <jason@jasonandjessi.com>
Subject: Re: how to set iptables to hide NAT router?
Date: Mon, 8 Nov 2004 11:13:10 +0000 (UTC)
Message-ID: <Pine.LNX.4.61.0411081112540.12488@shinobi.jasonandjessi.com>
References: <L3958891776370.14499@webmail6.inner-21cn.com>
	<Pine.LNX.4.61.0411081050350.12458@shinobi.jasonandjessi.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463747325-1769511212-1099912390=:12488"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0411081050350.12458@shinobi.jasonandjessi.com>
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
To: =?X-UNKNOWN?B?P8zsyMo=?= <wsgtrsys@21cn.com>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463747325-1769511212-1099912390=:12488
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

Correction, better set that ttl to 128 which is the windows default, not=20
255.

        Jason
We the willing, led by the unknowning, are doing the impossible, for the=20
ungrateful. We have done so much, for so long, with so little. We are now=
=20
qualified to do anything with nothing.

On Mon, 8 Nov 2004, Jason Clark wrote:

> I would try a combination of two things, First the iptables ttl target. R=
eset=20
> every outgoing packet to have a ttl of 255. Second, Their are patches for=
=20
> linux that allow you to fake out these passive os fingerprints. I cant re=
call=20
> the name of the patches off hand, but a quick google should turn up the=
=20
> result you need.
>
>       Jason
> We the willing, led by the unknowning, are doing the impossible, for the=
=20
> ungrateful. We have done so much, for so long, with so little. We are now=
=20
> qualified to do anything with nothing.
>
> On Mon, 8 Nov 2004, ?=CC=EC=C8=CA wrote:
>
>> hi,i am use coyote nat to  ,but my ISP Detecting NAT Devices using=20
>> sFlow,and now ,i can't connect internet,
>> please look up :
>> http://www.sflow.org/detectNAT/
>> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dprin=
t
>> and
>> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dprin=
t
>>=20
>>=20
>> it say:
>>=20
>> Detecting NAT Routers
>> Thursday, April 24 2003 @ 08:35 AM CDT
>> Contributed by: opticfiber
>> A great paper written by Peter Phaal explains the simple method used in =
his=20
>> companies product, Sflow, to detect multiple host behind a NAT firewall.=
=20
>> The secret, it would seem is simply monitoring of the TTL of out going=
=20
>> packets and comparing them to a host know not to be using a NAT firewall=
=2E
>>=20
>> Another method only touched upon by Phaal is passive OS finger printing,=
=20
>> although this method is less reliable, an statistical analasys could=20
>> determine if multiple operating systems were using the same network netw=
ork=20
>> device. If this were the case it would be reasonable to assume that that=
=20
>> host was in fact a NAT device.
>>=20
>> AT&T Labs has published a paper explaining how to count the number of=20
>> devices behind a NAT device. The method AT&T uses, relies on the fact th=
at=20
>> most operating systems (excluding Linux and Free BSD) use IP header ID's=
 as=20
>> simple counters. By observing out of sequence header ID's, an analasys c=
an=20
>> calculate how many actual hosts are behind a NAT device.
>>=20
>> Each of these methods can be easily defeated through better sterilizatio=
n=20
>> by the router itself. In the first example, if the TTL for each TCP pack=
et=20
>> was re-written by the router for each packet to the value of 128, the fi=
rst=20
>> method would no longer function. For the second method, sterilizing IP=
=20
>> header information and stripping unneeded TCP flags would successfully=
=20
>> undermine this scheme. For the last Method, counting hosts behind a rout=
er.=20
>> Striping the fragmentation flag for syn packets, and setting the IP ID t=
o=20
>> '0', (like Linux and Free BSD both do) would make it impossible to count=
=20
>> hosts behind a NAT router.
>>=20
>>=20
>>=20
>> how to set iptables rule to do it:
>>=20
>> example????
>>=20
>> iptables -I FORWARD -j TTL --ttl-set 128
>>=20
>>=20
>>=20
>> ??
>>=20
>> and more?
>>=20
>>=20
>>=20
>>=20
>>=20
>> who can help me?
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>                                                            wsgtrsys
>>=20
>>                                                           2004.11.8
>>=20
>>=20
>>=20
>
---1463747325-1769511212-1099912390=:12488--

