From: Jeff Simmons <jsimmons@goblin.punk.net>
Subject: Re: Questions on state
Date: Sun, 13 Mar 2005 18:09:51 -0800
Message-ID: <200503131809.51240.jsimmons@goblin.punk.net>
References: <200503131623.42711.jsimmons@goblin.punk.net>
	<1110764535.19878.5.camel@hubcap.ljm.dom>
Reply-To: jsimmons@goblin.punk.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1110764535.19878.5.camel@hubcap.ljm.dom>
Content-Disposition: inline
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

On Sunday 13 March 2005 17:42, Jason Opperisano wrote:

> > Is a connection ONLY added to the state table when the first packet
> > matches a rule that contains the --state NEW directive, or can it happen
> > in some other way?
>
> connections begin getting added to the conntrack table as soon as the
> ip_conntrack module is loaded.

The ip_conntrack module adds ALL connections to the conntrack table? Even ones 
where the state isn't used by the filter table?

--
Jeff Simmons                                   jsimmons@goblin.punk.net
     Simmons Consulting - Network Engineering, Administration, Security

"You guys, I don't hear any noise. Are you sure you're doing it right?"
	-- My Life With The Thrill Kill Kult

