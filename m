From: Matt Burleigh <matt@mattburleigh.com>
Subject: Re: RH9 question
Date: Wed, 30 Jul 2003 10:36:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F27D803.7010401@mattburleigh.com>
References: <20030730142507.90882.qmail@web11006.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030730142507.90882.qmail@web11006.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: steveng@cometsystems.com
Cc: netfilter@lists.netfilter.org

Steve wrote:

>Hi,
>
>So I've just upgraded my RH9 kernel to 4.2.21 and now
>I get this goofy message that the kernel can't find
>the module for iptables.  I didn't see anything when
>configuring the kernel to add this as a module or
>built in.  Am I just blind or is this not the case
>with the newer kernel?
>
>  
>
Do you have newly built modules in your "/lib/modules/<kernel 
version>/net/ipv4/netfilter" directory?

Matt


