From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Tools for creation of iptables
Date: Mon, 14 Mar 2005 14:51:21 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503141448320.7042@darkstar.sysinfo.com>
References: <20050314163755.86B4A7FE@mail.817west.com>
	<20050314164225.GA10865@bender.817west.com>
Mime-Version: 1.0
In-Reply-To: <20050314164225.GA10865@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 14 Mar 2005, Jason Opperisano wrote:

> On Mon, Mar 14, 2005 at 05:40:08PM +0100, Seferovic Edvin wrote:
>> Hi list,
>>
>> are there some tools for creation of iptables rules that you could refer me
>> to. I would appreciate it when you could write an opinion to the tool you
>> maybe use.
>
> the kids seem to be fond of fwbuilder:
>
> 	http://www.fwbuilder.org/
>
> i personally haven't ever used it to create an actual iptables rule
> set, so i can't give an informed opinion.
>

I've looked t a number of these 'tools' including fwbuilder, and the main 
problem with them is, they are mostly written for redhat systems, and the 
problem with redhat systems is that most the lernel and glic hacks redhat 
impliments makes it near impossible to POM in new netfilter code and 
recompile.  Redhat is not the way to go if one wishes to be in tune with 
the latest and greatest or  more then the minimum defaults included these 
days.

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

iD8DBQFCNes9st+vzJSwZikRAgZoAKCuG6xXxBxD9ujxvFwsY9L2o/oREACgroqq
z2OP7RaxarCVsYLp5NjiLWs=
=2UKG
-----END PGP SIGNATURE-----

