From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: IP Vs DNS
Date: Wed, 12 Oct 2005 19:09:56 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0510121901040.16045@darkstar.sysinfo.com>
References: <200510120054.j9C0sDZC013724@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510120054.j9C0sDZC013724@darkstar.sysinfo.com>
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
To: Anthony Sadler <anthonys@faredge.com.au>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 12 Oct 2005, Anthony Sadler wrote:

> Prehaps instead of reload the whole table, why not just reload the particular rule?
> Eg:
>
> 1. Ping www.name.com, dump IP into 1st file. Grep should help you here.
> 2. Pick up IP from 1st file and use it to write rule.
>
> 3. Ping www.name.com, dump IP into 2nd file.
> 4. Pick up IP from 2nd file and insert new rules.
> 5. Using 1st file, delete rules that correspond to 2nd IP.
>
> 6. Ping www.name.com, dump IP into 1st file.
> 7. Pick up IP from 1st file and use it to write rule.
> 8. Using 2nd file, delete rules that correspond to 2nd IP.
>
> You should be able to kick off steps 1,2 yourself, then have scripts do steps 3-5 and 6-8. That way you should limit your downtime and processer usage.


As /dev/rob pointed out for those sites that do change on a regular basis, 
it might well work to script up and cron the first few steps with a tap 
fired off to the admin that a change has bee noted and to fire off the 
second round that affects the FW rule sets in question.  Of course the 
question then is, does that mean that in even scripting through htese 
steps might they miss the next change of IP's entirely...


I think this is a good alternative, and if scripted correctly might save 
time and cpu cycles, but if done by hand certainly might work for the 
opposit.  Still and I'm perhaps missing something, I'm trying to 
understand why, with a multi-hosted site, someone might want to push all 
their packets at a particular system and undo the load balancing and such 
that the site operator<s> put in place to ease congestion on their 
systems?

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

iD8DBQFDTZfHst+vzJSwZikRAjivAKDZviVwlaGkChKAgOoApo+eCWXVrQCgnEUI
zDFr6wuqes56XhzRRk6KvIQ=
=Rp3H
-----END PGP SIGNATURE-----

