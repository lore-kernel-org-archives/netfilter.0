From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding intranet ip's
Date: Sun, 20 Oct 2002 09:30:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021020083031.NSFY292.mta03-svc.ntlworld.com@there>
References: <1035076906.2599.8.camel@sandy.vk2kcf.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035076906.2599.8.camel@sandy.vk2kcf.ampr.org>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 20 October 2002 2:21 am, Gary Hodder wrote:

> Hi all,
>
> I am wanting to route 192.168.x.x ip's, the Linux kernel will not do
> this and hasn't for a while.

I'm not sure what you mean by "the kernel will no do this".   My kernels 
certainly do.

Do you have /proc/sys/net/ipv4/ip_forward = 1 ?

That controls forwarding of *all* packets by the kernel - I'm not aware of 
anythign to selectively control 192.168.x.y

Antony.

-- 

This is not a rehearsal.
This is Real Life.

