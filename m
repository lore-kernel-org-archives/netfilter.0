From: Jason Opperisano <opie@817west.com>
Subject: Re: ip aliasing considered harmful?
Date: Mon, 10 Jan 2005 15:04:43 -0500
Message-ID: <20050110200443.GA10819@bender.817west.com>
References: <1105364334.12623.5.camel@hubcap.ljm.dom>
	<BAY101-F3E491799BCD5242A2D14DDF970@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY101-F3E491799BCD5242A2D14DDF970@phx.gbl>
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

On Mon, Jan 10, 2005 at 06:51:25PM +0000, Curby . wrote:
> Other scripts that try to handle aliases match on both interface and IP; as 
> you hinted, there's no way to handle aliases directly.
> 
> What's the standard way to store these settings so they take effect upon 
> boot?  Since /etc/init.d usually only contains scripts and not custom 
> configurations, i guess /etc/sysconfig/network-scripts/ifup.d would be the 
> one way of doing it.

i don't know that there's necessarily a "standard" way to do this.  if
the aliases are needed solely for iptables nat purposes--i just
add/remove them as part of my firewall script start/stop.

-j

--
"Operator! Give me the number for 911!"
        --The Simpsons

