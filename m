From: Jason Clark <jason@jasonandjessi.com>
Subject: Re: how to set iptables to hide NAT router?
Date: Mon, 8 Nov 2004 10:53:37 +0000 (UTC)
Message-ID: <Pine.LNX.4.61.0411081050350.12458@shinobi.jasonandjessi.com>
References: <L3958891776370.14499@webmail6.inner-21cn.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463747325-261730358-1099911217=:12458"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <L3958891776370.14499@webmail6.inner-21cn.com>
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

---1463747325-261730358-1099911217=:12458
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

I would try a combination of two things, First the iptables ttl target.=20
Reset every outgoing packet to have a ttl of 255. Second, Their are=20
patches for linux that allow you to fake out these passive os=20
fingerprints. I cant recall the name of the patches off hand, but a quick=
=20
google should turn up the result you need.

        Jason
We the willing, led by the unknowning, are doing the impossible, for the=20
ungrateful. We have done so much, for so long, with so little. We are now=
=20
qualified to do anything with nothing.

On Mon, 8 Nov 2004, ?=CC=EC=C8=CA wrote:

> hi,i am use coyote nat to  ,but my ISP Detecting NAT Devices using sFlow,=
and now ,i can't connect internet,
> please look up :
> http://www.sflow.org/detectNAT/
> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dprint
> and
> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dprint
>
>
> it say:
>
> Detecting NAT Routers
> Thursday, April 24 2003 @ 08:35 AM CDT
> Contributed by: opticfiber
> A great paper written by Peter Phaal explains the simple method used in h=
is companies product, Sflow, to detect multiple host behind a NAT firewall.=
 The secret, it would seem is simply monitoring of the TTL of out going pac=
kets and comparing them to a host know not to be using a NAT firewall.
>
> Another method only touched upon by Phaal is passive OS finger printing, =
although this method is less reliable, an statistical analasys could determ=
ine if multiple operating systems were using the same network network devic=
e. If this were the case it would be reasonable to assume that that host wa=
s in fact a NAT device.
>
> AT&T Labs has published a paper explaining how to count the number of dev=
ices behind a NAT device. The method AT&T uses, relies on the fact that mos=
t operating systems (excluding Linux and Free BSD) use IP header ID's as si=
mple counters. By observing out of sequence header ID's, an analasys can ca=
lculate how many actual hosts are behind a NAT device.
>
> Each of these methods can be easily defeated through better sterilization=
 by the router itself. In the first example, if the TTL for each TCP packet=
 was re-written by the router for each packet to the value of 128, the firs=
t method would no longer function. For the second method, sterilizing IP he=
ader information and stripping unneeded TCP flags would successfully underm=
ine this scheme. For the last Method, counting hosts behind a router. Strip=
ing the fragmentation flag for syn packets, and setting the IP ID to '0', (=
like Linux and Free BSD both do) would make it impossible to count hosts be=
hind a NAT router.
>
>
>
> how to set iptables rule to do it:
>
> example????
>
> iptables -I FORWARD -j TTL --ttl-set 128
>
>
>
> ??
>
> and more?
>
>
>
>
>
> who can help me?
>
>
>
>
>
>
>
>
>
>
>
>                                                            wsgtrsys
>
>                                                           2004.11.8
>
>
>
>
---1463747325-261730358-1099911217=:12458--

