From: Casey Scott <casey@phantombsd.org>
Subject: Re: verifying set-mark
Date: Sat, 23 Feb 2008 10:14:21 -0800 (PST)
Message-ID: <25498998.61203790461346.JavaMail.root@tomcat.phantombsd.org>
References: <1203720563.27608.55.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1203720563.27608.55.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org

Is there a way with tcpdump to verify that the marks are actually
getting set though?

Casey

----- "Matt Zagrabelny" <mzagrabe@d.umn.edu> wrote:

> On Fri, 2008-02-22 at 14:40 -0800, Casey Scott wrote:
> > Ultimately, I am trying to mark packets for a tc filter. Should I
> > not be using the iptables set-mark to do that?
> 
> I think set-mark is fine for that.
> 
> I suggest marking some packets in the prerouting chain and then
> logging
> them in input chain. Something like the following:
> 
> $iptables --table mangle --append PREROUTING
> --in-interface $in_interface
> --destination $host --jump MARK --set-mark $mark_integer
> 
> $iptables --table filter --append INPUT
> --in-interface $in_interface
> --match mark --mark $mark_integer --jump LOG
> 
> > 
