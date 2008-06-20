From: Doug Kehn <rdkehn@yahoo.com>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 06:16:48 -0700 (PDT)
Message-ID: <787076.65754.qm@web52011.mail.re2.yahoo.com>
References: <485B8494.7050608@trash.net>
Reply-To: rdkehn@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485B8494.7050608@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>, Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Hi Patrick,


--- On Fri, 6/20/08, Patrick McHardy wrote:

> Jan Engelhardt wrote:
> > On Friday 2008-06-20 01:57, Doug Kehn wrote:
> > 
> >> iptables -t raw -A PREROUTING -d !
> 192.168.2.0/255.255.255.0 -i br0
> >> -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m
> tcp --dport 80 -m
> >> conntrack --ctstate ESTABLISHED -j NOTRACK
> >>
> >> Does this even make sense?
> > 
> > Yes, but:
> 
> No. The raw table doesn't have conntrack information.

I assume the same holds for -m state as well?  If so, this would explain why the rules are never matched.

Is there a way to have ACKs bypass the proxy and not break connection tracking?

My theory is that when performing a streaming HTTP download (e.g. streaming video over HTTP) having the ACKs traverse the proxy introduces sufficient delay to degrade video playback.  I'm hoping to find a general solution.  Creating a NOTRACK rule for each site is possible but a little cumbersome.

Thanks,
...doug



      
