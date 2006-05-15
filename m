From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: ip forwarding and iptables
Date: Mon, 15 May 2006 17:41:37 -0500
Message-ID: <e4b032$e9r$1@sea.gmane.org>
References: <002301c67865$88d8d6e0$cf34000a@sven>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002301c67865$88d8d6e0$cf34000a@sven>
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

Angel Tsankov wrote:
> I have 2 PCs: one configured as gateway (PC1) and the other one (PC2) 
> configured to use PC1 as gateway. PC1 runs a custom Linux distribution. 
> It has ip
> forwarding enabled (e.g. by echo 'net.ipv4.ip_forward = 1' >> 
> /etc/sysctl.conf).
> As far as I understand, I do not need to do anything else to make the 
> kernel route traffic to and from PC2, right?
> However, if I have one PC more - PC3, and I do not wnat to route traffic 
> to and from it I need to configure the kernel, e.g. with
> the help of iptables. Now if I do so, i.e. use iptables to configure the 
> kernel, save the iptables configuration, setup the system
> to reload it at startup (using the init.d scripts), is there any moment 
> (during system startup) when ip forwarding has been enabled
> but the iptables configuration has not yet been loaded and traffic could 
> be routed to and from PC3?

It's pretty hard to guess what your "custom Linux distribution" might
be doing.  Usually, at startup the iptables service is started before
starting networking, and during shutdown networking is stopped before
stopping (unloading) iptables.

How much more you might need to do in order to get traffic routed
depends on details about your network addressing that you have not
provided.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


