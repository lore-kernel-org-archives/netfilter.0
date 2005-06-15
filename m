From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Why does this connection stop being tracked?
Date: Wed, 15 Jun 2005 12:07:52 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506151154340.25078@darkstar.sysinfo.com>
References: <20050614161105.GN750@strugglers.net>
	<Pine.LNX.4.58.0506151312470.27260@blackhole.kfki.hu>
	<20050615113045.GF754@strugglers.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050615113045.GF754@strugglers.net>
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
To: Andy Smith <andy@strugglers.net>
Cc: netfilter@lists.netfilter.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


 	[SNIP]

>>
>> You have two choices: either disable TCP SACK support on all your
>> real/virtual machines behind your firewall, or upgrade the kernel on the
>> firewall.
>
> Do you have any instructions or a pointer to documentation onhow to
> temporarily disable SACK?  If it was a /proc setting that would be
> ideal; I don't really want to have to recompile kernels though.
>

why?  you are certainly missing out on how to fix and patch a systems when 
bugs in the kernel affect it, to the ability to add features that your 
dist maintainer has not enabled by default, or to change params in the 
kernel such as moving away or to kernel modules as opposed to stack 
functionality mapping.  Not to mention the abilities to streamline the 
kernel to fit your requirements and remove all the xtra trash that gets 
loaded in to make a kernel fit all purposes/needs/enduser-requirements.

basically, you are defeating one of the finer points in the linux realm <as 
well as the BSD's net, open, free>  you are avoiding taking actually 
control of what you are playing with <smile>.  Granted one does not do 
this sort of thing in a prod env on the fly, one tests such things on a 
dev server or desktop emulating what might be in prod. but, it's not all 
that tough to master, and certainly will likely be required at one time or 
another to get things working that were not originally provided, move to a 
newer cleaner kernel, or even to fix problems encountered over the 
stresses of time and all that.  The recipe for doing such is not all that 
complex, and if one backsup the old kernel and properly runs lilo to 
include it in the potential boot process, not all that damaging should on 
finger-fart and make a bed new kernel on first draft. but all admins in 
the free *nix-like realm should learn the particulars of rebuilding 
kernels, it will  at one time or another save their asses.

No salt for the avoiders.

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

iD8DBQFCsFJdst+vzJSwZikRAiaQAKCWHlgggJUxBXu9/CeR//pLYbzHGACfRVev
kG/17gNRcUin+Dk63ai8gCA=
=2VQV
-----END PGP SIGNATURE-----

