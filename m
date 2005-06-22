From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 15:26:02 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506221519210.21678@darkstar.sysinfo.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
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
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 22 Jun 2005, Jan Engelhardt wrote:

>
>> Actually, a null scan should be generating INVALID packets, and if one
>
> Does it really? What if there happens to be a null-flags/xmas-flags tcp packet
> in an otherwise well-behaved tcp connection? I'd guess it would match
> ESTABLISHED, even if it has got null flags.

Perhaps my understanding of these kinds of scans is innacurate, but, a 
null scan has no flags set, and xmas scan has all the flags set, thus 
would these not cancel one another or still be two sets of invalid scans 
hitting you at once?  no flags all flags still invalid in my book.


>
>> turns on those detections and rejections within the kernel, as well as
>> perhaps adding a rule or two to DROP INVALID packets they should be
>> covered, should they not? And thus with far less resource over head as
>> extensive rules in their ruleset?
>
> That depends on what you want.


what we want is for the firewall to be imune to invalid packets generated 
by these kinds  of scans, yes?  to not give out port information when hits 
with these bogus packets that no decent application should be spewin in 
the first place?

>
> The full fun (shortened here) currently present in AS_IPFW is:
>
>    (base is iptables -P INPUT DROP)
>    iptables -A scanchk -j REJECT --reject-with host-unreach -m random \
>      --average 20;
>    iptables -A INPUT -g scanchk -p tcp ! --syn -m state --state INVALID;
>    iptables -A INPUT -j TARPIT -p tcp;
>    iptables -A INPUT -j REJECT --reject-with net-unreach -m random \
>      --average 10;
>
> Of course you can all DROP that, but I like to actively hinder unwanted
> senders, and so, the implementation of this hindering requires REJECT.
>
>
REJECT is the ind way to end a connection and does not slow an automated 
scanner one bit, while a DROP lets that attack tool keep the socket open 
on it;s end and tries to wait for feedback from the other end, and thus 
slows or stops the scanner in t's tracks, if not totally for each attepted 
connection to each port for its timeout period.  That to me is the way I 
want my firewall to respond to bogus script kiddies hitting me with their 
messing little scanners as they play and try to learn the processes that 
should put their lame little butts in jail and cost mom and dad tons of 
cash for rasing little deamons in the first place <smile>.

Of course, perhaps I'm incorrect in my analysis, and open to pointers to 
my misunderstanding of the processes.

Thanks,

Ron DuFresne
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

iD8DBQFCubtOst+vzJSwZikRAgvzAJ4qlQ+8xlz38DhQHAQFHq96UxvOcwCfbKJX
5aJ5eG0RmV4hO6X40B5hK8A=
=sjxD
-----END PGP SIGNATURE-----

