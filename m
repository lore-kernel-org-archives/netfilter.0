From: Piotrek Kaczmarek <kaczorek@k.daleka.net>
Subject: Re: conntrack error
Date: Fri, 11 Feb 2005 17:32:14 +0100
Message-ID: <20050211163214.GA18236@daleka.net>
References: <20050211105519.GA14110@daleka.net>
	<1108127256.4489.27.camel@hubcap.ljm.dom>
	<20050211152217.GA17270@daleka.net>
	<20050211153322.GA2516@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050211153322.GA2516@bender.817west.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Feb 11, 2005 at 03:33:22PM +0000, Jason Opperisano wrote:
> On Fri, Feb 11, 2005 at 04:22:17PM +0100, Piotrek Kaczmarek wrote:
> > # sysctl net.ipv4.netfilter.ip_conntrack_max
> > net.ipv4.netfilter.ip_conntrack_max = 30000
> 
> i assume you set that manually, as i don't think there's an amount
> of physical RAM that would result in 30000 on the dot...  speaking of
> which--how much physical RAM does this machine have?  you would need 512
> MB RAM for ip_conntrack_max to be automatically calculated to 32768,
> even though the conntrack table would only really use around 12 MB of
> kernel memory.  also--is this machine dedicated solely to firewalling,
> or is there something else chewing up your RAM?

Yes, I set it by hand, I have 256mb of ram, currently there are ~17000 connections
and 'free' shows 70mb of free memory. That machine is dedicated to routing/firewalling

-- 
Piotr Kaczmarek

