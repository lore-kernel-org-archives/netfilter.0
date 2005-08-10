From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Rules in config file
Date: Wed, 10 Aug 2005 13:20:24 -0500
Message-ID: <200508101320.24952.rob0@gmx.co.uk>
References: <20050810141804.e0876506@freedom.alpha-force.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050810141804.e0876506@freedom.alpha-force.net>
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

On Wednesday 2005-August-10 07:18, Lists wrote:
> Would it be possible to somehow disable changing iptables rules from
> scripts and enable changing only from config file, which loading
> would be protected by special password defined in kernel? Or even

And what process is going to read that config file? A kernel driver? 
Sure, you can write kernel-space software to do things like this, but 
the reasoning behind it is not clear to me. I'd think the chances of 
inclusion in the mainstream kernel are close to zero.

> better, your could preset iptables rules in kernel. That rules would
> be unchangeable.

Is that good? BTW you can accomplish the same thing with an old 80386 
and /sbin/halt ... the machine keeps passing packets after the OS 
stops. I used to have a 386 firewall machine which died with a hard 
drive crash. I left it running 3-4 weeks thereafter, until I needed to 
make changes in the firewall rules.

> I think this would improve Linux firewall security on systems with
> complex and tight rules.

Complex rules often need care and attention. What is the threat model 
addressed by such a change? If someone hostile gets root on your 
machine, you're in trouble. Besides, I think SELinux presents a more 
comprehensive and well-considered approach to that possibility.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

