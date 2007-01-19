From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Filtering in PREROUTING
Date: Fri, 19 Jan 2007 17:25:52 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0701191723530.21488@darkstar.sysinfo.com>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
	<web-4020726@bk3.webmaillogin.com>
	<45AED516.30800@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45AED516.30800@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 17 Jan 2007, Grant Taylor wrote:

 	[SNIP]


>
> Some times there are reasons to do non standard things for very special 
> reasons, usually very stringent performance reasons.  If you are wanting to 
> filter in the mangle table to prevent the connection tracking system from 
> seeing traffic (if even that will do so), you should consider the raw table, 
> which is used specifically to tell the kernel not to track specific packets. 
> Oh, by the way, the raw table only has PREROUTING and OUTPUT chains.
>
>

Or, how about a shorter reply with a tiny bit of common sense;  filter 
implies seperation, thus the common sense place to "filter traffic" would 
be in the filter tables, yes?

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
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFsP8jst+vzJSwZikRAgATAKDLabkeh7wtKs8mYSNMzG8VrOQThgCeO9j0
76Nn0QW2R+X0mNYAHxPgTEw=
=QqWZ
-----END PGP SIGNATURE-----

