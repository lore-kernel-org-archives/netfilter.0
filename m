From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: firewall protocols
Date: Thu, 7 Apr 2005 19:29:24 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504071927220.24064@darkstar.sysinfo.com>
References: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
	<42557D73.7070500@provident-solutions.com>
	<Pine.LNX.4.60.0504071609440.23293@darkstar.sysinfo.com>
	<20050407221351.GA8563@samad.com.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050407221351.GA8563@samad.com.au>
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
To: Alexander Samad <alex@samad.com.au>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 8 Apr 2005, Alexander Samad wrote:

>
>
> can always try a netstat -pane | grep 23 to see what is using/listening
> on port 23
>

And that will work, as long as telnetd is presently being used or used 
very recently.  Remember inetd, being the super server launches all it 
cares for as they are asked for...they run for the time required and then 
go sleep, until inetd get a request to relaunch one of the daemons it 
manages...


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

iD8DBQFCVcJWst+vzJSwZikRAjdtAKDOkEvI3kbmsbs2AXni4KPiCWktNQCZAceE
v8tr5NSET+Z6WGM9t3x3YuU=
=XGFv
-----END PGP SIGNATURE-----

