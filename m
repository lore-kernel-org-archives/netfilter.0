From: Jason Opperisano <opie@817west.com>
Subject: Re: List of all modules with their utilization
Date: Thu, 03 Feb 2005 17:43:20 -0500
Message-ID: <1107470600.3866.7.camel@hubcap.ljm.dom>
References: <BAY22-F15234DA3B6F75D3C1C495EF37F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <BAY22-F15234DA3B6F75D3C1C495EF37F0@phx.gbl>
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
To: netfilter@lists.netfilter.org

On Thu, 2005-02-03 at 17:25, Alexander Bellia wrote:
> Thanks Samuel,
> 
> But what about just the regular modules that comes under the 
> /lib/modules/..../netfiller directories. There are a lot of modules like 
> ipt_owner, ipt_physdev, etc....

so much for thinking for one's self...

the link Samuel provided was to the pom-base modules.  there are also
pom-extra modules--which if you look over to the left-hand side of the
web page, you'll see a link to "extra repository."  if you wanna get
fancy you could just s/base/extra/ in the link that was already
provided.

also--all that information listed there is in the "help" file of each
POM patch directory.  if i ever need to know what a POM module does; i
just:

cd /path/to/extracted/pom
less patchname/help

but that's just me...

-j

--
"When will I learn? The answer to life's problems aren't at the bottom
 of a bottle, they're on TV!"
	--The Simpsons


