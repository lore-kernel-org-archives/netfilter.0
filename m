From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Tools for creation of iptables
Date: Mon, 14 Mar 2005 14:57:26 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503141454100.7042@darkstar.sysinfo.com>
References: <EFORWARD1B-SEFLCBTQ00001395@eforward1.name-services.com>
	<1110821783.10432.24.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
In-Reply-To: <1110821783.10432.24.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 14 Mar 2005, John A. Sullivan III wrote:

> On Mon, 2005-03-14 at 17:40 +0100, Seferovic Edvin wrote:
>> Hi list,
>>
>> are there some tools for creation of iptables rules that you could refer me
>> to. I would appreciate it when you could write an opinion to the tool you
>> maybe use.
> <snip>
> Some of my team have used fwbuilder (http://www.fwbuilder.org) in the
> past with great success.  There was recently a post about a new tool,
> http://firewalladmin.sf.net - I subsequently read some impressive
> reviews.  I believe this product is very granular and is specifically a
> rule configurator.


I have not looked at this tool, but need to add that n my looking at a 
number of them not long ago, not only was the main issue with most that 
they were built to use redhat as a base under them and filaed to run 
properly under other dists, but that many require a webserver or other 
toys like mysql and  such to maintain the rules for a site.  YMMV...


We advise that folks learn iptables from the commandline/file, become 
intimate with the base of your perimiter protection, make iptables your 
friend.

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

iD8DBQFCNeyvst+vzJSwZikRApNvAJ4kDyciXOfgGgbSp6cDKispL0OVUwCfRT5a
PFBSBozT8mIVPmWrwAD40z0=
=JfB4
-----END PGP SIGNATURE-----

