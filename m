From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: IP Vs DNS
Date: Tue, 11 Oct 2005 20:46:19 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0510112044100.13393@darkstar.sysinfo.com>
References: <434C28FB.3000805@ttienterprises.org>
	<20051011231030.GA18418@salty>
	<434C520F.4050308@ttienterprises.org>
	<200510111932.14894.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510111932.14894.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


 	[SNIP]

>
> I spent more than 10 minutes on this, start to now, so let's look at
> those NASA records again.
>
> ;; ANSWER SECTION:
> www.nasa.gov.           600     IN      CNAME   www.nasa.gov.speedera.net.
> www.nasa.gov.speedera.net. 120  IN      A       208.254.75.142
> www.nasa.gov.speedera.net. 120  IN      A       208.254.75.143
>
> $ host 208.254.75.142
> Host 142.75.254.208.in-addr.arpa not found: 3(NXDOMAIN)
> $ host 208.254.75.143
> Host 143.75.254.208.in-addr.arpa not found: 3(NXDOMAIN)
>
> Two different hosts, neither with reverse DNS.
>
> You have to consider how fast your target is moving as you take aim at
> it. This particular one moves very fast. Resolving this once an hour
> won't really do much for you. In general you've got the right idea,
> though.


Now, that's interesting, never nocited here myself that sites like this 
might change so drmatically over such a small space of time, but I guess 
the costs of avoinding repeated DDOS attacks has made such things a 
reality of net-life.

Thanks for the info and research sir.

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

iD8DBQFDTFzest+vzJSwZikRAskoAJ4qkdVOrnqK5J8v+XHRsSLQYgeMoACdEZNx
97cmYj5cfauZ4WwNAPZzOyA=
=xs9p
-----END PGP SIGNATURE-----

