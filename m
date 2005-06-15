From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Why does this connection stop being tracked?
Date: Wed, 15 Jun 2005 12:24:27 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506151223310.25078@darkstar.sysinfo.com>
References: <20050614161105.GN750@strugglers.net>
	<Pine.LNX.4.58.0506151312470.27260@blackhole.kfki.hu>
	<20050615113045.GF754@strugglers.net>
	<Pine.LNX.4.60.0506151154340.25078@darkstar.sysinfo.com>
	<20050615161055.GT754@strugglers.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050615161055.GT754@strugglers.net>
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
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 15 Jun 2005, Andy Smith wrote:

> On Wed, Jun 15, 2005 at 12:07:52PM -0400, R. DuFresne wrote:
>>>> You have two choices: either disable TCP SACK support on all your
>>>> real/virtual machines behind your firewall, or upgrade the kernel on the
>>>> firewall.
>>>
>>> Do you have any instructions or a pointer to documentation onhow to
>>> temporarily disable SACK?  If it was a /proc setting that would be
>>> ideal; I don't really want to have to recompile kernels though.
>>>
>>
>> why?  you are certainly missing out on how to fix and patch a systems when
>> bugs in the kernel affect it, to the ability to add features that your
>> dist maintainer has not enabled by default, or to change params in the
>> kernel such as moving away or to kernel modules as opposed to stack
>> functionality mapping.
>
> I'm sorry, I didn't phrase that very well.  I'm perfectly happy to
> compile new kernels and indeed I am required to run a patched 2.6.11
> plus some other patches that I have to apply manually in order to
> use Xen.
>
> $ uname -a
> Linux curacao.strugglers.net 2.6.11curacaoxen0-steven-hand1 #1 Sat Jun 4 18:49:26 UTC 2005 i686 GNU/Linux
>
> I just didn't want to make a new kernel and reboot in order to test
> the suggestion of disabling SACK as the downtime of a reboot on a
> machine with multiple virtual machines is unpopular.
>


Oh, well, then that is a different situation <smile>, nevermind...

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

iD8DBQFCsFY/st+vzJSwZikRAmQoAJ9ZztFRW/7lDOvnX/cFIfJ0AttoFQCfeZ5S
DpMMHOGiMSpHBcFH3koU4Yg=
=eJeJ
-----END PGP SIGNATURE-----

