From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: DisableExternalCache on conntrackd 0.9.14 not syncing to kernel
Date: Wed, 03 Aug 2011 15:15:18 +0100
Message-ID: <4E3957F6.2050105@tolaris.com>
References: <4E317ECF.3020404@tolaris.com> <4E385AE3.6020801@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E385AE3.6020801@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Thank you for your help, Pablo. My comments below.

On 2011-08-02 21:15, Pablo Neira Ayuso wrote:
> You want to inject your flow-state information inmediately, right? In
> that case, you can to explicitly set DisableExternalCache On. Removing
> the DisableExternalCache clause from the config file defaults to off (as
> it shows your config file).

Correct, that's what I want. I'll try the "On" argument instead. The
manual states to use the "Off" argument, albeit in an unclear example:

http://conntrack-tools.netfilter.org/manual.html

Can someone correct it?

> Active/active with asymmetric routing for stateful firewalls is poor
> design for stateful firewalls. I don't recommend it to you. Please read:
> http://1984.lsi.us.es/~pablo/docs/intcomp09.pdf.

I read that white paper. It made fine reading on a recent flight. Thank you.

What I want is not true active/active asymmetric routing. IE, I don't
need state information to propagate ahead of user traffic (thus adding
latency). I just want active/backup, but where both the active and the
backup have each others' state tables in the kernel. This way, if an
asymmetric loop does occur (due to stale ARP data), the traffic will
pass the firewall. If the state data has propagated by that time, of course.

> There are few differences between 0.9.14 and 1.0.0, but I suggest you to
> upgrade to 1.0.0 since you'll benefit from several fixes of minor bugs
> that happened during that period.

I'll attempt to use or repackage 1.0.0 for Ubuntu lucid. If so, I'll
publish it in my PPA. Thanks.

Regards,
Tyler

-- 
"No one can terrorize a whole nation, unless we are all his accomplices."
   -- Edward R. Murrow
