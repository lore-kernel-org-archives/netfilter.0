From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Need to upgrade iptables package ???
Date: Wed, 17 Mar 2004 18:44:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040317174446.2D1161EB7@sterenborg.info>
References: <003701c40c44$f529e710$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003701c40c44$f529e710$0200a8c0@ale>
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
To: "'Netfilter lista (iptables)'" <netfilter@lists.netfilter.org>

> I have Linux Red Hat 9 / Kernel 2.4.20-8 / iptables 1.2.7a
> 
> This iptables version doesn't have the libipt_string module 
> to analyse and filter certain packet strings.

You need to patch the kernel for that.

> I ask you: can I download only the libipt_string module and 
> install it on /lib/iptables or do I have to download a newer 
> iptables version packet and upgrade my 1.2.7a one ???
>
> I'm not an expert so I need the easiest way, and I need to 
> know where I can fetch it.

Normally you would perform these steps :
- Download a new kernel, POM and iptables.
- Patch the kernel with the functionality from POM that you need.
- Compile and install the new kernel.
- Compile and install the new iptables.


Gr,
Rob


