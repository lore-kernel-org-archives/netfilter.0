From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: match time & kernel 2.6.22.5
Date: Mon, 27 Aug 2007 10:20:52 -0400
Message-ID: <s6n5d35rsik72pb7cm45ttoonlmpjd2k73@4ax.com>
References: <1188035937.46cffd61754e5@www.versateladsl.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

> I want to add the match time.
> I apply the last snapshot with this patch ( patch-o-matic-ng-20060702)
> 
> The compilation stop after with this errors:

Are you really using patch-o-matic-ng-20060702 ?  That's more than a year
old.  I just finished building kernel 2.6.22 with the time match using
pom-ng-20070826, and it worked fine.  

Try using the latest snapshot of pom-ng.  You'll have to tell it to download
the time patch; see 'perldoc runme' for details.

Good luck,
Andrew.


