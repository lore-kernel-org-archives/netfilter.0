From: Scott van Looy <scott@ethosuk.org.uk>
Subject: Re: question about netmeeting
Date: Wed, 9 Oct 2002 20:50:28 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210092049031.22191-100000@fire.ethosuk.org.uk>
References: <F10E4DFowMtNi2yWkF10000655d@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F10E4DFowMtNi2yWkF10000655d@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Oct 7 Hang Lee did spake thusly:

> Dear sir,
>  I want to ask a question about netmeeting. I use iptables to be a nat 
> server. But my computer can't use netmeeting througt the server. And what 
> does i do? I try to find the patch from www.iptables.org. But the link is 
> broken. Thank you for your helpful hand.

You need to go to netfilter.org, patch your kernel with all of base and 
some of extra from patch-o-matic, recompile your kernel and then recompile 
iptables - then you can load the h323 contrack module and hey presto, 
it'll work :)

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

"One day I woke up and discovered that I was in love with tripe."
-- Tom Anderson



