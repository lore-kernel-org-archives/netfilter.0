From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ICMP types
Date: Sat, 30 Apr 2005 19:22:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504301921220.3546@darkstar.sysinfo.com>
References: <8a79f08aaeef.8aaeef8a79f0@vsnl.net>
	<42740CF5.9070705@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42740CF5.9070705@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sat, 30 Apr 2005, Taylor, Grant wrote:

> le / institutions have made political decisions to DROP ICMP traffic in an 
> attempt to not become part of a reflected ICMP DDoS attack on someone.


just deny pings to the broadcast address and this can be eliminated, and 
this can be done in sysctl, does not require iptables rules and overhead.


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

iD8DBQFCdBNOst+vzJSwZikRAmcBAJ4vOhlII62xQqlT3E/J8qClhzTEpwCgrw2S
nzYG9/nCSrqD6gkdfonifvk=
=vWVU
-----END PGP SIGNATURE-----

