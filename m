From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: new tcp connections, without SYN
Date: Wed, 9 Apr 2003 16:58:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091658.34306.mklingens@ism.nl>
References: <7497DCA1C240C042B28F6657ADFD8E09268776@i2km11-ukbr.domain1.systemhost.net> <1049893612.22719.31.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049893612.22719.31.camel@elendil.intranet.cartel-securite.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 09 April 2003 15:06, Cedric Blancher wrote:
> Timers for Netfilter's conntrack should be the same as TCP stacks. So,
> if conntrack times out, then destination TCP stack should time out too.
> that means if a ACK gets so delayed that related conntrack entry gets
> dropped, than it would be also dropped by destination TCP stack.

Aaah... that might explain my problem with 'new, not syn'.

Problem is that our firewall is a non-masquerading router for a class C subnet 
and that we don't have the ability to set the timeouts on all machines behind 
it.

Isn't there a workaround to avoid this problem on the netfilter machine?

-- 
Martijn


