From: Jesper Dangaard Brouer <hawk@comx.dk>
Subject: Re: netfilter stats, info and resources usage
Date: Thu, 28 Oct 2010 12:28:56 +0200
Message-ID: <1288261736.29275.20.camel@firesoul.comx.local>
References: <4CC83A67.1010202@register.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC83A67.1010202@register.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sandro Tosi <sandro.tosi@register.it>
Cc: netfilter@vger.kernel.org

On Wed, 2010-10-27 at 16:42 +0200, Sandro Tosi wrote:
> we are using quite a lot iptables and we'd like to gather some 
> stats/information to "what's doing" and hopefully also an idea of the 
> resources used by it (in particular cpu and ram).
> 
> Probably my google search karma is very low today, given the only 
> reference to CPU usage I could find was vague refs to softirq data, and 
> for stats some links like:
> 
> 3. http://people.netfilter.org/hawk/DDoS/2010-04-12__001/list.html
> 
> 3 is very interesting, Jesper: how did you generate it? :)

I use the tool "rrdcollect" to sample a lot of different proc values.

See the rrdcollect.conf config here:
http://people.netfilter.org/hawk/DDoS/rrdcollect_scripts/rrdcollect.conf

The RRD data files are created by a perl script.

I have put the perl script here:
http://people.netfilter.org/hawk/DDoS/rrdcollect_scripts/rrdcollect-create-datafiles.pl

I use the tool 'drraw' to show the graph data, but I have not uploaded
those files... Don't know if its the right tool for the job, but it was
very easy to change things to start with, then when the number of graphs
grew, it sort of got annoying to maintain via drraw.

Have fun!
-- 
Med venlig hilsen / Best regards
  Jesper Brouer
  ComX Networks A/S
  Linux Network Kernel Developer
  Cand. Scient Datalog / MSc.CS
  Author of http://adsl-optimizer.dk
  LinkedIn: http://www.linkedin.com/in/brouer


