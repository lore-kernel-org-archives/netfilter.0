From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Are established connections interrupted when iptables is
	restarted?
Date: Wed, 22 Dec 2004 15:11:43 +0000
Message-ID: <200412221511.43567.gdh@acentral.co.uk>
References: <200412221506.iBMF6cDX082047@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412221506.iBMF6cDX082047@jkcpub.iserver.net>
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

On Wednesday 22 December 2004 15:06, Deepak Seshadri wrote:
> Hello group,
>
> I make changes in the /etc/sysconfig/iptables file and then do a "service
> iptables restart". Would this interrupt the established connections through
> the firewall?

Provided that 'service iptables restart' does not unload the conntrack module, 
then the established-connections table will not be reloaded - you will likely 
have a second or two of no connectivity while the ruleset is reloaded, 
though.

Cheers,
Gavin.

