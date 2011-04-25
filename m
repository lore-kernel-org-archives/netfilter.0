From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset v6.latest bugs?
Date: Mon, 25 Apr 2011 22:03:31 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu>
References: <4DB5614C.3040808@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB5614C.3040808@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, 25 Apr 2011, Mr Dash Four wrote:

> I think I have stumbled upon a couple of ipset bugs. Here is what happens:
> 
> [root@test1 ~]# ipset -N test hash:ip
> [root@test1 ~]# ipset -L test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 1024 maxelem 65536
> Size in memory: 16512
> References: 0
> Members:
> [root@test1 ~]# ipset -A test 10.4.0.0-10.7.255.255
> ipset v6.4: Element cannot be added to the set: it's already added
> [root@test1 ~]# ipset -F test
> [root@test1 ~]# ipset -L test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 2048 maxelem 65536
> Size in memory: 32896
> References: 0
> Members:
> [root@test1 ~]# ipset -A test 10.4.0.0-10.7.255.255
> ipset v6.4: Element cannot be added to the set: it's already added
> [root@test1 ~]# ipset -F test
> [root@test1 ~]# ipset -L test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 4096 maxelem 65536
> Size in memory: 65664
> References: 0
> Members:
> [root@test1 ~]# ipset -X test
> [root@test1 ~]# ipset -N test hash:ip
> [root@test1 ~]# ipset -L test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 1024 maxelem 65536
> Size in memory: 16512
> References: 0
> Members:
> [root@test1 ~]# ipset -A test 10.4.0.0/14
> ipset v6.4: Element cannot be added to the set: it's already added
> [root@test1 ~]# ipset -F test
> [root@test1 ~]# ipset -L test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 2048 maxelem 65536
> Size in memory: 32896
> References: 0
> Members:
> [root@test1 ~]# ipset -A test 10.4.0.0/14
> ipset v6.4: Element cannot be added to the set: it's already added
> [root@test1 ~]# ipset -F test
> [root@test1 ~]# ipset -L test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 4096 maxelem 65536
> Size in memory: 65664
> References: 0
> Members:
> 
> 
> Given the above, the following concern me:
> 
> 1. The maximum number of elements in hash:ip set is 64k, but when I try to add
> more than that I am warned that the element is "already added". The error
> message displayed is misleading as I am not attempting to add an element
> "already added", but exceeding the range of elements permitted in this type of
> set. I think the error message should reflect that. This, presumably, happens
> when there is an overlap, which usually occurs when, for example, integer is
> used instead of long.

The default hash size is relatively small: 1024. Therefore it's exhausted 
quite fast when adding so many elements and the hash type tries to solve 
the issue by doubling the hash. However, with the given input you use, it 
is not taken into account that some of the first elements are already 
successfully added to the set, and after resizing, the adding starts with 
the first element again. That is why it fails with a misleading error 
message. It's a non-critical bug, I'll fix it this week.
 
> 2. There seems to be a huge memory leak - don't know whether this is as a
> result of the error in 1 above. When I add elements to hash:ip set and then
> clear the entire set, the "Size in memory" value of the set doubles every time
> I do that (16512 initially, then 32896, 65664 ...). I have tried a similar
> operation with hash:net set, but there is no memory leak there at all.

No, there's no memory leak there: if you check the list of the elements 
you can see that more and more elements could successfully be added to the 
growing hash.
 
> 3. Don't know whether this is a bug, but thought to report it too - hash:net,
> different to hash:ip set, seems unable to accept ip ranges
> (10.4.0.0-10.7.255.255 in my example above) - I get an error every time I
> attempt this operation. Could this behaviour be corrected and I am allowed to
> specify ranges please?

No, because what would be the network you'd want to add to the set then? 
Every /24 in the given range? Or every /16? Or the set type should convert 
the range to a network and add that to the set? And if that can't be 
covered by one network, then add a combination of networks which cover the 
range exactly?
 
> I use the geoip database and all ip addresses there are specified as ranges. I
> cannot use hash:ip as, by its very definition, the set is only limited to 64k
> elements (when ip range is specified, ipset uses internal "conversion" and
> adds each ip address from the specified range as a separate element). To use
> some sort of conversion algorithm to change these ip ranges to a cidr-type
> address (as this is what hash:net insists on) is going to take a lot of
> execution time and additional computer resources.
> 
> 4. The "old" format of iptreemap set is automatically converted to an hash:ip
> set. Why? I think that is wrong, given that such a set could contain, in all
> probability, more than 64k individual ip addresses and when that limit is
> reached no elements could then be added.

Hm, iptreemap should have been limited to 64k elements... That was an 
error on my part, that I forgot to limit that type.

hash:ip type allows more than 64k elements, when defined with a 
non-default "maxelem" parameter.

> I think it makes sense if a "conversion" from the old-style format to the new
> one is attempted, to be done properly (or not attempted at all) - the only
> set, which could possibly be able to handle "old-style" iptreemap sets is
> hash:net, but, as it stands, it does not accept ipranges (see 3 above).
> 
> As a footnote to this, the ipset I used is the latest snapshot from yesterday,
> 24 April as available from kernel.org (for the ipset kernel part) and ipset
> 6.4 (userspace - stripping the kernel part).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
