From: Jason Opperisano <opie@817west.com>
Subject: Re: random match and 2.6 kernel
Date: Thu, 28 Oct 2004 20:55:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1099011335.2986.55.camel@hubcap.ljm.dom>
References: <A51CE256-293B-11D9-912B-000A957651A0@iacookie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A51CE256-293B-11D9-912B-000A957651A0@iacookie.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-10-28 at 19:46, cookie wrote:
> Hello-
>    I am new to the list.  I have been using netfilter for some time but  
> had
> always used the default setup.
>    Recently I came across Hisham Mardam Bey's website that details "Load  
> Balancing
> Across Multiple Links"
> http://linux.com.lb/wiki/index.pl? 
> node=Load%20Balancing%20Across%20Multiple%20Links
> and saw the first use of the random match.
>    I was anxious to try it, but I am running Fedora Core and a 2.6  
> kernel.
>    And after looking online and inside pomng-20040621, I came to the  
> conclusion that
> the random match was only available to the 2.4 kernel.  But being new  
> to using pom,
> I thought it would be wise to check with everyone before I threw in the  
> towel.
> Thanks
> Brian Cook

heh--someone just asked this a few days ago
(http://marc.theaimsgroup.com/?l=netfilter&m=109876208621196&w=2)

the quick test for 2.6 compatibility in POM is to look in the patch
directory for a "linux-2.6" directory.  if it's not there, you can check
CVS (again--no dice on the random patch).  last ditch is to search the
netfilter-devel archives to see what sort of activity might be taking
place.  i think i recall some talk about "random" and "nth" being merged
into a single module, but never saw anything come out of that.

speaking of which, might "nth" help your situation (as it is ported to
2.6)?

-j

-- 
Jason Opperisano <opie@817west.com>


