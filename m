From: Unknown <unknown@unknown.invalid>
Subject: Re: Iptables and Kernel
Date: Mon, 12 Apr 2004 02:00:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12755.3975828507$1081750103@news.gmane.org>
References: <407A27B2.4000101@rd.arkonnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <407A27B2.4000101@rd.arkonnetworks.com>
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
To: Norman Zhang <norman.zhang@rd.arkonnetworks.com>, netfilter@lists.netfilter.org

On April 12, 2004 01:22 am, Norman Zhang wrote:
> Hi,
>
> Is iptables still needed for kernel 2.6.x? I see a lot of iptables
> patches go into the kernel, but not much updates on the
> www.netfilter.org. The logo on netfilter says firewalling, NAT and
> packet mangling for Linux 2.4. So I guess much of the code goes directly
> into the kernel? Also does kernel 2.6.3 support Netmeeting and MSN
> Instant Messengener, or I need the following plug-in,
> http://www.kfki.hu/%7Ekadlec/sw/netfilter/newnat-suite/?

	1) iptables is the userspace component.  Yes it is still needed in 2.6.x -- you still have to use
	it to setup and manage individual rules.

	2) 2.6.x indeed supports many components of netfilter out of the box, however there is still 
	patch-o-matic-ng which can still add functionality not yet in the kernel or in userspace.

	3) No, you do not need patches from newnat-suite by default, you need 
	ip_conntrack_h323 and ip_nat_h323, although you might need newnat if your iptables is really old.

	Keep in mind that *support* of netmeeting in this case is a loose terminology -- I believe that 
	several functionalities are not covered by the h323 patches.


>
> Regards,
> Norman

