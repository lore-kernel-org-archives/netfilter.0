From: Jason Opperisano <opie@817west.com>
Subject: Re: VPN through the firewall
Date: Thu, 3 Mar 2005 17:29:49 -0500
Message-ID: <20050303222949.GA6531@bender.817west.com>
References: <42263F2C.9030600@jump-technologies.com>
	<1109805779.4455.1.camel@hubcap.ljm.dom>
	<422787FC.6020308@jump-technologies.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <422787FC.6020308@jump-technologies.com>
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

On Thu, Mar 03, 2005 at 03:56:12PM -0600, Marty Phee wrote:
> Yes, PPTP I believe.

mmm hmmm...

> Jason Opperisano wrote:
> >On Wed, 2005-03-02 at 17:33, Marty Phee wrote:
> >
> >>I've got a SUSE box running my home firewall and a WinXP work machine 
> >>that I use to VPN into the office network.  Before I put this SUSE 9.2 

suse 9.2 == 2.6 kernel-based

> >>in I had a Mandrake 9.1 box that worked just fine.

mandrake 9.1 == 2.4 kernel-based

mandrake also had a tendency to ship the pptp/gre conntrack/nat kernel
modules as part of their kernels...

Gary W. Smith can speak to this much better than myself, but 2.6 +
pptp/gre conntrack/nat is not a winning combo, AFAIK...

-j

--
"Alright brain, you don't like me and I don't like you. But let's just
 get through this and then I can get back to killing you with beer."
        --The Simpsons

