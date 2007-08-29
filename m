From: Matton <Matton@tele2allin.be>
Subject: Re: match time & kernel 2.6.22.5
Date: Wed, 29 Aug 2007 18:30:51 +0200
Message-ID: <1188405051.46d59f3bb65ac@www.versateladsl.be>
References: <1188035937.46cffd61754e5@www.versateladsl.be>
	<s6n5d35rsik72pb7cm45ttoonlmpjd2k73@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s6n5d35rsik72pb7cm45ttoonlmpjd2k73@4ax.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Andrew Schulman <andrex@alumni.utexas.net>
Cc: netfilter@lists.netfilter.org

Hi Andrew,
Thank for our help,
now the new kerl is build with iptables time match.
This is the first time I add match for iptables and this procedrue is not
described on netfilter extra docs

Selon Andrew Schulman <andrex@alumni.utexas.net>:

> > I want to add the match time.
> > I apply the last snapshot with this patch ( patch-o-matic-ng-20060702)
> > 
> > The compilation stop after with this errors:
> 
> Are you really using patch-o-matic-ng-20060702 ?  That's more than a year
> old.  I just finished building kernel 2.6.22 with the time match using
> pom-ng-20070826, and it worked fine.  
> 
> Try using the latest snapshot of pom-ng.  You'll have to tell it to download
> the time patch; see 'perldoc runme' for details.
> 
> Good luck,
> Andrew.
> 
> 
> 


-- 
Famille Matton
Moreremanslaan, 48C
B-1700 Dilbeek

