From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Watched a DDoS attack for hours and couldn't do much :S
Date: Mon, 27 Nov 2006 12:57:26 -0600
Message-ID: <456B3516.8060309@riverviewtech.net>
References: <200611270803.kAR81k2Y030892@mail3.jubileegroup.co.uk>	<Pine.LNX.4.58.0611270829210.30530@mail3.jubileegroup.co.uk>
	<1164647806.21896.18.camel@srv1.iihs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1164647806.21896.18.camel@srv1.iihs.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

AntiProxy wrote:
> Actually, it's an external attack, apparently from a whole bunch of
> compromised machines..

Do you have any idea who initiated the attack and / or why?

> One thing i thought off, was to pipe tcpdump's output into a couple awks
> and seds and generate IPTABLE rules on the fly..

Something you might consider would be to look at either how the ULog daemon
works, or possibly NetLink (CONFIG_IP_NF_QUEUE) directly.  Either way, I
believe it would be possible to write a daemon that can have the kernel
communicate which packets it is seeing that are not already (explicitly)
processed by IPTables rules and then use a different method (NetFilter
APIs?) to dynamically update the firewall rule(s) on the fly.

I have no experience in this area, probably evident by using the wrong terms
/ names for the existing resources to communicate with the kernel.  However
I think there is at least a direction to go with this.  If you would like
help developing such, I'm willing to try to help.



Grant. . . .


