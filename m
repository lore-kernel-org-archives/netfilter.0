From: Jason Clark <jason@jasonandjessi.com>
Subject: RE: how to set iptables to hide NAT router?
Date: Mon, 8 Nov 2004 12:52:42 +0000 (UTC)
Message-ID: <Pine.LNX.4.61.0411081252140.12531@shinobi.jasonandjessi.com>
References: <2E314DE03538984BA5634F12115B3A4E01BC403B@email1.mitretek.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463747325-521201269-1099918362=:12531"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E01BC403B@email1.mitretek.org>
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
To: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Cc: netfilter@lists.netfilter.org, =?iso-8859-1?B?P8zsyMo=?= <wsgtrsys@21cn.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463747325-521201269-1099918362=:12531
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

Very little overhead. It's just tweaking a value in the tcp headers for=20
packets that pass through.

        Jason
We the willing, led by the unknowning, are doing the impossible, for the=20
ungrateful. We have done so much, for so long, with so little. We are now=
=20
qualified to do anything with nothing.

On Mon, 8 Nov 2004, Piszcz, Justin Michael wrote:

> What kind of overhead would that carry?
>
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@lis=
ts.netfilter.org] On Behalf Of Jason Clark
> Sent: Monday, November 08, 2004 6:13 AM
> To: ?=CC=EC=C8=CA
> Cc: netfilter@lists.netfilter.org
> Subject: Re: how to set iptables to hide NAT router?
>
> Correction, better set that ttl to 128 which is the windows default, not
> 255.
>
>        Jason
> We the willing, led by the unknowning, are doing the impossible, for the
> ungrateful. We have done so much, for so long, with so little. We are now
> qualified to do anything with nothing.
>
> On Mon, 8 Nov 2004, Jason Clark wrote:
>
>> I would try a combination of two things, First the iptables ttl target. =
Reset
>> every outgoing packet to have a ttl of 255. Second, Their are patches fo=
r
>> linux that allow you to fake out these passive os fingerprints. I cant r=
ecall
>> the name of the patches off hand, but a quick google should turn up the
>> result you need.
>>
>>       Jason
>> We the willing, led by the unknowning, are doing the impossible, for the
>> ungrateful. We have done so much, for so long, with so little. We are no=
w
>> qualified to do anything with nothing.
>>
>> On Mon, 8 Nov 2004, ?=CC=EC=C8=CA wrote:
>>
>>> hi,i am use coyote nat to  ,but my ISP Detecting NAT Devices using
>>> sFlow,and now ,i can't connect internet,
>>> please look up :
>>> http://www.sflow.org/detectNAT/
>>> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dpri=
nt
>>> and
>>> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dpri=
nt
>>>
>>>
>>> it say:
>>>
>>> Detecting NAT Routers
>>> Thursday, April 24 2003 @ 08:35 AM CDT
>>> Contributed by: opticfiber
>>> A great paper written by Peter Phaal explains the simple method used in=
 his
>>> companies product, Sflow, to detect multiple host behind a NAT firewall=
=2E
>>> The secret, it would seem is simply monitoring of the TTL of out going
>>> packets and comparing them to a host know not to be using a NAT firewal=
l.
>>>
>>> Another method only touched upon by Phaal is passive OS finger printing=
,
>>> although this method is less reliable, an statistical analasys could
>>> determine if multiple operating systems were using the same network net=
work
>>> device. If this were the case it would be reasonable to assume that tha=
t
>>> host was in fact a NAT device.
>>>
>>> AT&T Labs has published a paper explaining how to count the number of
>>> devices behind a NAT device. The method AT&T uses, relies on the fact t=
hat
>>> most operating systems (excluding Linux and Free BSD) use IP header ID'=
s as
>>> simple counters. By observing out of sequence header ID's, an analasys =
can
>>> calculate how many actual hosts are behind a NAT device.
>>>
>>> Each of these methods can be easily defeated through better sterilizati=
on
>>> by the router itself. In the first example, if the TTL for each TCP pac=
ket
>>> was re-written by the router for each packet to the value of 128, the f=
irst
>>> method would no longer function. For the second method, sterilizing IP
>>> header information and stripping unneeded TCP flags would successfully
>>> undermine this scheme. For the last Method, counting hosts behind a rou=
ter.
>>> Striping the fragmentation flag for syn packets, and setting the IP ID =
to
>>> '0', (like Linux and Free BSD both do) would make it impossible to coun=
t
>>> hosts behind a NAT router.
>>>
>>>
>>>
>>> how to set iptables rule to do it:
>>>
>>> example????
>>>
>>> iptables -I FORWARD -j TTL --ttl-set 128
>>>
>>>
>>>
>>> ??
>>>
>>> and more?
>>>
>>>
>>>
>>>
>>>
>>> who can help me?
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>                                                            wsgtrsys
>>>
>>>                                                           2004.11.8
>>>
>>>
>>>
>>
>
---1463747325-521201269-1099918362=:12531--

