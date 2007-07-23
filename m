From: =?iso-8859-2?B?o3VrYXN6IE5pZXJ5Y2izbw==?= <nofast@welnowiec.net>
Subject: Re: ipset and kernel 2.6.22
Date: Mon, 23 Jul 2007 15:58:23 +0200
Message-ID: <op.tvw7rlc5343eys@comnetlap2.biuro.lan>
References: <20070723102420.GA5224@safeTpin.homeunix.org>
	<op.tvw0mjt6343eys@comnetlap2.biuro.lan>
	<Pine.LNX.4.64.0707231502340.30647@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0707231502340.30647@blackhole.kfki.hu>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

> On Mon, 23 Jul 2007, =A3ukasz Nierych=B3o wrote:
>
>> In my opninion ipset iptree still does not work as it should be.
>> My test:
>>
>> []# ipset -N viruses iptree --timeout 100
>> []# ipset -A viruses 172.16.14.12
>>
>> Test1:
>> []# ipset -T viruses 172.16.14.12
>> 172.16.14.12 is in set viruses
>> Test2:
>> []# ipset -T viruses 172.16.14.111
>> 172.16.14.111 is in set viruses
>> Test3:
>> []# ipset -T viruses 172.16.140.111
>> 172.16.140.111 is NOT in set viruses
>>
>> ...
>>
>> Test2 172.16.14.111 shoud NOT be in set viruses, every IP from example  =

>> subnet
>> 172.16.14.0/24
>> is reported as "in set", (look at test2).
>>
>> Everything is ok after IPTRE_GC_TIME 5*60  (line 33 in ip_set_iptree.c)
>> When I changed this label to 60 this module iptree worked ok after 60s.
>>
>> To test again you have to unload ipset module. Something is wrong few =20
>> minutes
>> after module is loaded...
>
> That looks like a real bug. Which kernel and pom-ng version are you =20
> using?

My kernel: 2.6.22.1 PREEMPT i686 pentium4
Patch: 130-netfilter-ipset.patch
 from this page
https://dev.openwrt.org/browser/trunk/target/linux/generic-2.6/patches-2.6.=
22/

This kernel was not pathed by any other patch than
130-netfilter-ipset.patch
140-netfilter_time.patch
150-netfilter_imq.patch

[]# ipset -V
ipset v2.2.9a Protocol version 2

The same was when I reported this
https://lists.netfilter.org/pipermail/netfilter/2007-May/068730.html
on earlier version of kernel ( + pom-ng )

=A3ukasz Nierych=B3o

