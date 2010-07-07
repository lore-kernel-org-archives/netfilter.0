From: Jesper Dangaard Brouer <hawk@comx.dk>
Subject: Re: QoS weirdness : HTB accuracy
Date: Wed, 7 Jul 2010 12:50:59 +0000 (UTC)
Message-ID: <loom.20100707T144848-17@post.gmane.org>
References: <067c83163988908ef546d7ff7f560a17@localhost> <4BF32BB0.7010700@redfish-solutions.com> <e6bd0cff8dafc8b3af0760facb5fdc8c@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Julien Vehent <julien <at> linuxwall.info> writes:
 
> On Tue, 18 May 2010 18:07:12 -0600, "Philip A. Prindeville"
> <philipp_subx <at> redfish-solutions.com> wrote:
> > 
> > Sorry for the late response:  could this be an "aliasing" issue caused
> > by sampling intervals (granularity)?
> > 
> > -Philip
> 
> I was, in fact, an error in my ruleset. I had put the 'linklayer atm' at
> both the branch and leaf levels, so the overhead was computed twice,
> creating those holes in the bandwidth.

I have checked the HTB kernel code, and my understanding is that, you must
set it on both the leaf and the root, for the shaping to be correct.

It is the expected behavior that small packets cause a significant
reduction in the available bandwidth on the ATM link. See my answer to your 
original post.

-- 
Med venlig hilsen / Best regards
  Jesper Brouer
  ComX Networks A/S
  Linux Network Kernel Developer
  Cand. Scient Datalog / MSc.CS
  Author of http://adsl-optimizer.dk
  LinkedIn: http://www.linkedin.com/in/brouer


