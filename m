From: vinay mathew <vinaymathew80@yahoo.com>
Subject: Re: [LARTC] Compiling sch_tbf.c in user space
Date: Thu, 17 Feb 2005 13:37:47 -0800 (PST)
Message-ID: <20050217213747.35928.qmail@web50405.mail.yahoo.com>
References: <42136ED7.8020800@wildgooses.com>
Mime-Version: 1.0
In-Reply-To: <42136ED7.8020800@wildgooses.com>
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
Content-Transfer-Encoding: 7bit
To: Ed Wildgoose <lists@wildgooses.com>
Cc: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

Thanx for the idea Ed.Can u clarify another point for
me  if u have an idea about it cos im new to this.I
understand that i can route packets from different
interfaces to a common tbf attached to an IMQ
device.Now i need to know whether the packets after
passing through this IMQ device are then automatically
forwarded to the correct actual hardware interfaces to
be further delivered to their respective destinations.
Example: my router has 4 interface cards
eth0,1,2,3.Packets from 0 are destined to 2 and
packets from 1 to 3.However all packets are first to
be routed through a common shaping mechanism which im
assuming now to be a tbf attached to the IMQ
device.This is the scenario i am currently trying to
model by sending the packets to user space and thro a
tbf implemented in user space which i think is turning
out to be a little complex.Thanx again for the help
kind regards
vinay
--- Ed Wildgoose <lists@wildgooses.com> wrote:

> 
> >If this is not possible does any one have a simple
> >basic implementation of the token bucket filter
> that i
> >can use in my program to test this scenario or any
> >other ideas on how to implement this tbf in user
> >space.
> >  
> >
> 
> It's not as neat, but IMQ might help here?
> 
> Ed W
> 



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Helps protect you from nasty viruses. 
http://promotions.yahoo.com/new_mail

