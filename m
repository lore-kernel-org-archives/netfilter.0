From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: Wed, 08 Sep 2004 14:00:27 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413F56CB.2090509@pbl.ca>
References: <200409072333.i87NXJZA012251@bassett.home.org>	
	<413F12D1.3050108@pbl.ca>
	<1094665198.23966.21.camel@nostromo.bgsecm.com>	
	<413F4E20.9040807@pbl.ca>
	<1094667545.11117.30.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094667545.11117.30.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Jose Maria Lopez wrote:
[snip]
> there are things simply impossible.

Impossible? There's no such thing ;-)

> I don't see the difference with Solaris. If you want to upgrade your
> Solaris you have to apply a lot of upgrades, also to the kernel. That's
> the impression I have from the little contact I had with Solaris.

Not really.  Solaris (well, SunOS actually) has "disadvantage" of being 
closed-source.  So Sun had to publish API and document data structures 
garanteed not to change in set period of time (as defined in Solaris 
device driver development guides).  That allows for a third party to 
provide loadable kernel module that works with current version of 
Solaris kernel (both generic and patched), and possibly future versions 
of Solaris kernel (up to some point).  Of course, if developer doesn't 
wonder into the undocumented land ;-)  More than once I used kernel 
module compiled for previous version of Solaris (one was driver for 
Sun's unfortunate BigMac ethernet card, don't remember exatly what the 
others were).

If there was such a thing in Linux kernel, bringing some of the new 
features might be a bit slower and harder task for core Linux developers 
(you can't just change that function call, or data structure), but on 
the other hand some of the "impossible" to implement features would 
become "possible"...

Becoming way off topic, anyhow...

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

