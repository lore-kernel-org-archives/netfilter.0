From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: blocking same src/dst traffic (land attacks?)
Date: Fri, 1 Apr 2005 01:56:01 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0504010155500.20748@darkstar.sysinfo.com>
References: <3BEC0FC090F538409A0736B2D37DA0ED0246F62D@icptex02.corp.icpt.net>
	<20050401083631.12f83349.akolinare@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050401083631.12f83349.akolinare@gmx.net>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 1 Apr 2005, Akolinare wrote:

>> What type of rule could you write to block same src/dst traffic. This is
>> inregards to blocking land attacks coming in from the outside interface.
>
> I have rules blocking incoming traffic with source ip-addresses from my own network. If you don't have a transit gateway this should be a simple solution to avoid land attacks.
>

Is all that really needed?  I was of the impression that;

           echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter

did the trick...


Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           admin & senior security consultant:  sysinfo.com
                           http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                           -Tom Robins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCTPCEst+vzJSwZikRAisEAKCe30/g42Gw6bWesUwm8jRyUIAsIQCgrv4N
4qnXHoZZaAAE1uoIdL/bq2I=
=Y4au
-----END PGP SIGNATURE-----

