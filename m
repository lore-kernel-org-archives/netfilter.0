From: =?unknown-8bit?b?P8zsyMo=?=<wsgtrsys@21cn.com>
Subject: Re: how to set iptables to hide NAT router?
Date: Tue, 9 Nov 2004 14:18:02 +0800 (CST)
Message-ID: <2a958890858197.15515@webmail2.inner-21cn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: jason@jasonandjessi.com

i use=20
iptables -t mangle -A PREROUTING -i eth0 -j TTL --ttl-set 129
can set out packet's ttl to 128

but i search "patches for linux that allow you to fake out these passive os=
 fingerprints."
i can't find it=20

also,i find this :
http://ippersonality.sourceforge.net/

it said:
=20
The Linux IP Personality patch adds to your Linux 2.4 kernel the ability to=
 have different 'personalities' network wise, that is to change some charac=
teristics of its network traffic, depending on different parameters (anythi=
ng you can specify in an iptables rule: src/dst IP address, TCP or UDP port=
, etc.)=20

The characteristics that can be changed are:=20

TCP Initial Sequence Number (ISN)=20
TCP initial window size=20
TCP options (their types, values and order in the packet)=20
IP ID numbers=20
answers to some pathological TCP packets=20
answers to some UDP packets=20
They are deeply configurable.=20

This patch relies on the wonderful framework created by Rusty Russel: netfi=
lter. More precisely, the patch adds a new iptables target (in a kernel mod=
ule) that can be used in the mangle table with a (patched) iptables. This t=
arget is very configurable. See the documentation section for more details =
on how it works.=20





but it's for kernel2.4.19 and iptables 1.2.2

i am use kernel2.4.25 and iptables 1.2.9,may be can't patch my soft?

and i??? how to do?




>Try this
>iptables -t mangle -A OUTPUT -o eth0 -j TTL --ttl-set 128
>iptables -t mangle -A FORWARD -o eth0 -j TTL --ttl-set 128

        Jason
>We the willing, led by the unknowning, are doing the impossible, for the=20
>ungrateful. We have done so much, for so long, with so little. We are now =

>qualified to do anything with nothing.

On Mon, 8 Nov 2004, Jason Clark wrote:

> Very little overhead. It's just tweaking a value in the tcp headers for=20
> packets that pass through.
>
>       Jason
> We the willing, led by the unknowning, are doing the impossible, for the =

> ungrateful. We have done so much, for so long, with so little. We are now=
=20
> qualified to do anything with nothing.
>
> On Mon, 8 Nov 2004, Piszcz, Justin Michael wrote:
>
>> What kind of overhead would that carry?
>>=20
>> -----Original Message-----
>> From: netfilter-bounces@lists.netfilter.org=20
>> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason Clark
>> Sent: Monday, November 08, 2004 6:13 AM
>> To: ?=CC=EC=C8=CA
>> Cc: netfilter@lists.netfilter.org
>> Subject: Re: how to set iptables to hide NAT router?
>>=20
>> Correction, better set that ttl to 128 which is the windows default, not
>> 255.
>>=20
>>        Jason
>> We the willing, led by the unknowning, are doing the impossible, for the
>> ungrateful. We have done so much, for so long, with so little. We are now
>> qualified to do anything with nothing.
>>=20
>> On Mon, 8 Nov 2004, Jason Clark wrote:
>>=20
>>> I would try a combination of two things, First the iptables ttl target.=
=20
>>> Reset
>>> every outgoing packet to have a ttl of 255. Second, Their are patches f=
or
>>> linux that allow you to fake out these passive os fingerprints. I cant =

>>> recall
>>> the name of the patches off hand, but a quick google should turn up the
>>> result you need.
>>>=20
>>>       Jason
>>> We the willing, led by the unknowning, are doing the impossible, for the
>>> ungrateful. We have done so much, for so long, with so little. We are n=
ow
>>> qualified to do anything with nothing.
>>>=20
>>> On Mon, 8 Nov 2004, ?=CC=EC=C8=CA wrote:
>>>=20
>>>> hi,i am use coyote nat to  ,but my ISP Detecting NAT Devices using
>>>> sFlow,and now ,i can't connect internet,
>>>> please look up :
>>>> http://www.sflow.org/detectNAT/
>>>> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dpr=
int
>>>> and
>>>> http://www.topsight.net/article.php?story=3D2003042408350170&mode=3Dpr=
int
>>>>=20
>>>>=20
>>>> it say:
>>>>=20
>>>> Detecting NAT Routers
>>>> Thursday, April 24 2003 @ 08:35 AM CDT
>>>> Contributed by: opticfiber
>>>> A great paper written by Peter Phaal explains the simple method used i=
n=20
>>>> his
>>>> companies product, Sflow, to detect multiple host behind a NAT firewal=
l.
>>>> The secret, it would seem is simply monitoring of the TTL of out going
>>>> packets and comparing them to a host know not to be using a NAT firewa=
ll.
>>>>=20
>>>> Another method only touched upon by Phaal is passive OS finger printin=
g,
>>>> although this method is less reliable, an statistical analasys could
>>>> determine if multiple operating systems were using the same network=20
>>>> network
>>>> device. If this were the case it would be reasonable to assume that th=
at
>>>> host was in fact a NAT device.
>>>>=20
>>>> AT&T Labs has published a paper explaining how to count the number of
>>>> devices behind a NAT device. The method AT&T uses, relies on the fact =

>>>> that
>>>> most operating systems (excluding Linux and Free BSD) use IP header ID=
's=20
>>>> as
>>>> simple counters. By observing out of sequence header ID's, an analasys=
=20
>>>> can
>>>> calculate how many actual hosts are behind a NAT device.
>>>>=20
>>>> Each of these methods can be easily defeated through better sterilizat=
ion
>>>> by the router itself. In the first example, if the TTL for each TCP=20
>>>> packet
>>>> was re-written by the router for each packet to the value of 128, the =

>>>> first
>>>> method would no longer function. For the second method, sterilizing IP
>>>> header information and stripping unneeded TCP flags would successfully
>>>> undermine this scheme. For the last Method, counting hosts behind a=20
>>>> router.
>>>> Striping the fragmentation flag for syn packets, and setting the IP ID=
 to
>>>> '0', (like Linux and Free BSD both do) would make it impossible to cou=
nt
>>>> hosts behind a NAT router.
>>>>=20
>>>>=20
>>>>=20
>>>> how to set iptables rule to do it:
>>>>=20
>>>> example????
>>>>=20
>>>> iptables -I FORWARD -j TTL --ttl-set 128
>>>>=20
>>>>=20
>>>>=20
>>>> ??
>>>>=20
>>>> and more?
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>> who can help me?
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>                                                            wsgtrsys
>>>>=20
>>>>                                                           2004.11.8
>>>>=20
>>>>=20
>>>>=20
>>>=20
>





