From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Packets Counting
Date: Wed, 16 Mar 2005 16:33:51 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503161631410.19696@darkstar.sysinfo.com>
References: <4238655B@webmail.wichita.edu>
Mime-Version: 1.0
In-Reply-To: <4238655B@webmail.wichita.edu>
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
To: "M. A. Imam" <maimam@wichita.edu>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 16 Mar 2005, M. A. Imam wrote:

> Hi,
>
> How can i count the number of packets on an interface evry 2 or 5 seconds. and
> i want to count only specific packets like only arriving packets from port
> 5001
>
> Any ideas...
>

Or;  how to chew up resources;

cron this to run every 3-5 seconds, minutes, hours, days or years are the 
desire hits you;

iptables -L -v |grep 5001

add redirection to a file and you'll have something more to play with.

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

iD8DBQFCOKZEst+vzJSwZikRAs3RAKCGI8Ji1bMGHHHebbAYi951EUFQQACgosUJ
pSAQIRep4SsVhm82CxpoXMQ=
=XwHT
-----END PGP SIGNATURE-----

