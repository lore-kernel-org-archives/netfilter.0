From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: iptables memory question
Date: Wed, 16 Mar 2005 16:44:02 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503161639310.19696@darkstar.sysinfo.com>
References: <3E967CDFB67ED411A2D000D0B78EC6A50492A26A@mail1.marketlinksolutions.com>
Mime-Version: 1.0
In-Reply-To: <3E967CDFB67ED411A2D000D0B78EC6A50492A26A@mail1.marketlinksolutions.com>
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
To: jzorzi@marketlinksolutions.com
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


If you are trying to put up a firewall that has a rule base of 28000 
specific rules, you have more issues then trying to make sure you don;t 
exhaust memory resources.  You'll never manage nor maintain such a beast. 
And gawd forbid, if ya get it running and disappear that yer co-workers or 
replacement has to deal with this.

Sounds like your network topology is far too flat.  I'd segregate the 
broadcast domains in to smaller chunks and put smaller firewalls with 
manageable rule sets in front of those segments.

KISS is the first major principle that we seem to forget in our designs.

Thanks,

Ron DuFresne

On Wed, 16 Mar 2005 jzorzi@marketlinksolutions.com wrote:

> I have about a gigbyte of ram and trying to install approximately 28000
> rules.
> I'm getting  "iptables: Memory allocation problem" error.
> Is this because i don't have enough ram.
> Is there a formula or rule of thumb to calculate how much ram is needed for
> a certain number of rules.
>
>
> Jay Zorzi
> Systems Administrator, Information Technology
>
> MarketLink Solutions
> see further. achieve more.
>
> e - jzorzi@marketlinksolutions.com
> t - 416.260.2800 x299
> f - 416.260.2893
>
>
>

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

iD8DBQFCOKimst+vzJSwZikRAoCmAKCW5qWlkbPvK1ug7GMR8mRpOKdCOACeJPYl
OWQBTeMrgp76k1GwP8lY6vg=
=xk9l
-----END PGP SIGNATURE-----

