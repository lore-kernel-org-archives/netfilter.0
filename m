From: Unknown <unknown@unknown.invalid>
Subject: Re: Beginners Luck??
Date: Mon, 26 Jan 2004 18:12:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <24045.5538420521$1075159041@news.gmane.org>
References: <200401270952.58501.chakkerz@optusnet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <200401270952.58501.chakkerz@optusnet.com.au>
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
To: chakkerz@optusnet.com.au, netfilter@lists.netfilter.org

On January 26, 2004 05:52 pm, Christian Unger wrote:
> Hi
>
> I'm running Linux 2.6.1 and iptables 1.2.8 ... there are a few issues that
> are a mistery to me.
>
> Iptables comes with the kernel? or does the kernel merely contain support,
> and then an additional program sorta, jacks into that support?
>
> Is there a reason why after running a firewall i might not be able to start
> java applications (eg jEdit 4.1) - I get a splash screen but it just sits
> there. this is using Java 1.4.2_01 (as shipped with Slackware 9.1)


	netfilter firewall is made up of two separate but related components.
	kernel modules do the low level stuff and a userspace application 
	manipulates what the low level stuff actually does. 
	the "iptables" command is part of the userspace component
	-- look for xxxx/lib/iptables directory to see the userspace
	libraries --- look for xxxx/bin/iptable* xxx/bin/ip6table*
 	to find the executables.
	
	/lib/modules/*/kernel/net/ipv*/netfilter contains the kernel module
	components -- yours might be built into the kernel.

	Yes ... java needs to talk through 127.0.0.1 and blocking all traffic through
	lo and the ip address 127.0.1 will cause problems.

	Alistair.

