From: Simon Turvey <simon@catandsimon.com>
Subject: Re: Question about POM
Date: Sun, 13 Feb 2005 20:14:11 +0000
Message-ID: <cuocah$8mk$1@sea.gmane.org>
References: <cuo6t4$q0h$1@sea.gmane.org>
	<1108322722.17214.1.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108322722.17214.1.camel@nostromo.bgsecm.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jose Maria Lopez Hernandez wrote:

>>Are the POM patches only supposed to apply to a particular 2.4.x or 
>>2.6.x?  The reason I ask is that the ipsec* patches don't seem to apply 
>>cleanly to my 2.6.10 tree.
> 
> 
> They are supposed to be for both 2.4 and 2.6, but in my own
> experience it works better on newer kernels. Now that Netfilter
> doesn't gives you an official pom you can check their snapshots
> from the CVS. The last one should be prepared for 2.6.10.

Curious.  It was patch-o-matic-ng-20050212.tar.bz2 that I grabbed from 
the site.  There seems to have been a minor reorganisation of some of 
the files in at least net/ipv4 that prevent the patches applying 
cleanly.  The complete absence of any changelogs in POM doesn't help much :(

Simon


