From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Firewall Configuration Question...  Is this possible?
Date: Tue, 2 Aug 2005 14:03:35 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0508021353420.6731@darkstar.sysinfo.com>
References: <1122684637.8190bfctim@linux.a-f.k12.mi.us>
	<42ED1E7A.4030301@gmx.co.uk>
	<Pine.LNX.4.60.0508011308200.3645@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0508020821090.18879@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508020821090.18879@yvahk01.tjqt.qr>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter <netfilter@lists.netfilter.org>, /dev/rob0 <rob0@gmx.co.uk>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 2 Aug 2005, Jan Engelhardt wrote:

>
>> doable, but not adised, a firewall should be single purpose, most servers
>> should be single purpose where possible.  But then this is not often the case.
>> But a firewall certainly should be a single purpose system much like a router
>> is, they do similair work anyways.
>
> Having many servers has two disadvantages: Power consumption and
> administration expense (you gotta install and upgrade each of them).
> A "service split" [for load balance] is not bad, but you can also overdo it.
>

security basics 101, servers have their single purpose.  Make monitoring 
for pathces for that specific service for that admin easier, makes for not 
a single point of failure, and is more important for the network choke 
points such as FW's.  Of course, I'm coming at this with a corporate 
perspective, not a little home network.



>> putting a web servers on the firewall makes the firewall and the whole internal
>> network subject to any issues that the web services now face, plus you now have
>> to allow naother set of ports/protocols directly to the system and not merely
>
> You don't run a webserver with root.

Of course not, but surely you understand once a shell is gotten on a 
system getting root is ussually trivial, especially in nost default 
installs whence evertything and the kitchen sink go in.  Few folks 
actually do minimal installs these days, and many distributions of Linux, 
and I'm guessing a number of the *BSD's are a pain to inimalize.  Same is 
getting to be more and more true of the major vendored unix's as well.


As many have stated, it also depends upon your security posture, and the 
importance of what you are protecting.  No if I recall the admin in 
question that raised the issue had a .edu in their address.  They have 
been most notorious for *not*  doing the right thing and trying to 
"conserve" resources to the extenxt that they tend to be the bain of most 
corporate and hiome user systems/netowrks due to their usser exploiting 
easiliy the weaknesses that tend to be inherent in their design and 
deployment.  Ths my emphasis in this reguard in stating the better 
implimentation.  Now if you really wanna argue further these basics, I'd 
invite you to the firewal wizards list to talk about minimal security 
design implementaions and what does not work in actually trying to secure 
a network.

Thanks,

Ron DuFresne
<doable does not imply best practice>
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFC77V6st+vzJSwZikRAieXAKCwkqu0TxY8ODhUCs9UzNh0h0h3rACfYNbR
/iE6/PiSusxtPlbMyHrE69Y=
=QeMp
-----END PGP SIGNATURE-----

