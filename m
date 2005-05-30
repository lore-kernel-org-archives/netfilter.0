From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How to filter OUTPUT chain ala Zonealarm
Date: Mon, 30 May 2005 17:16:07 -0500
Message-ID: <429B90A7.9050202@riverviewtech.net>
References: <4299DD5B.4050705@mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4299DD5B.4050705@mindspring.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

Larry Alkoff wrote:
> The nice feature of Zonealarm for Windows is it will check outgoing 
> packets and ask if you want to allow a specific _program_ to access the 
> web.
> 
> In addition, it will warn if a program is asking for server rights.
> 
> This would be a nice feature.
> Is there any way to do this in Iptables?
> 
> If so could you outline how it would be done and I'll play with it on my 
> firewall script.

The only way that I think you could do this in Linux would be to use the QUEUE target and send the traffic to a user space daemon that identified the traffic and communicated with a user.  You may want to take a look at NuFW (http://www.nufw.org)as they do something close to this that might give you a direction to head with it.  (IMHO) I don't think what you are wanting to do will be as useful as Zonealarm on Windows for the simple fact that ZA is running on the system generating the traffic where as most of my IPTables firewalls are running on a central network ingress / egress point where it would be harder to identify which program generated the traffic.  However if you are looking at running this on a Linux notebook or workstation computer you could probably very easily do this.  It depends on what your target system(s) to run this on are.



Grant. . . .

