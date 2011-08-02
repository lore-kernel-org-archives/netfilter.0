From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: DisableExternalCache on conntrackd 0.9.14 not syncing to kernel
Date: Tue, 02 Aug 2011 22:15:31 +0200
Message-ID: <4E385AE3.6020801@netfilter.org>
References: <4E317ECF.3020404@tolaris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E317ECF.3020404@tolaris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Tyler J. Wagner" <tyler@tolaris.com>
Cc: netfilter@vger.kernel.org

Hi,

On 28/07/11 17:22, Tyler J. Wagner wrote:
> Hi all,
> 
> I've configured two routers, in active-backup mode, but where both can
> route to all endpoints at all times. Under some circumstances, traffic
> can enter at the backup. So I'm trying to provide either a full
> active-active asymmetric solution, or at least active-active symmetric,
> where the backup has the active's sessions in the kernel table at all times.
> 
> Two questions:
> 
> 1. "Mode FTFW { DisableExternalCache Off }" does not appear to work as
> advertised. The backup router continues to show connections in "cache
> external", and these connections are not synced to the local kernel. Can
> you tell me why?

You want to inject your flow-state information inmediately, right? In
that case, you can to explicitly set DisableExternalCache On. Removing
the DisableExternalCache clause from the config file defaults to off (as
it shows your config file).

> 2. Does anyone have advice on the best way practice to configure
> conntrackd for complete active/active asymmetric routing? I want to
> avoid flushing sessions at failover, and just have them sync state full
> time.

Active/active with asymmetric routing for stateful firewalls is poor
design for stateful firewalls. I don't recommend it to you. Please read:
http://1984.lsi.us.es/~pablo/docs/intcomp09.pdf.

I started some work to allow active/active setup with load-sharing.

http://1984.lsi.us.es/git/?p=cluster-match-scripts/.git;a=summary

It's still preliminary and undocumented, I'm looking for someone
interested in sponsoring this effort with no success.

> Details:
> 
> conntrackd is 0.9.14-2ubuntu1 on Ubuntu 10.04 lucid. This is the package
> Ubuntu provides for 11.04 natty, backported to lucid. The package is
> unchanged from the Ubuntu sources. All else is stock lucid.

There are few differences between 0.9.14 and 1.0.0, but I suggest you to
upgrade to 1.0.0 since you'll benefit from several fixes of minor bugs
that happened during that period.

You may use the conntrack-tools 1.0.0 debian packages in sid:
http://packages.debian.org/unstable/net/conntrack

> Both routers are configured as in the attached file (with the exception
> of IPv4_interface).
