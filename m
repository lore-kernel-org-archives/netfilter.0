From: Knute Johnson <knute2009@www.knutejohnson.com>
Subject: Re: newbie question: UDP is stateless ... right?
Date: Fri, 30 Jan 2009 11:13:21 -0800
Message-ID: <49835151.8010701@www.knutejohnson.com>
References: <87fa72960901301050n7d982887waadc1fc090fc96ed@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87fa72960901301050n7d982887waadc1fc090fc96ed@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mr Vandeley <mr.vandeley@gmail.com>
Cc: netfilter@vger.kernel.org

Mr Vandeley wrote:
> Hi,
> Please, excuse me this newbie question, but I don't understand
> correctly. For what I know, UDP connections are not statefull, so I
> can't track them... right?
> What I've been doing on my firewalls was explicitely accepting
> incoming packets from UDP privileged ports and so accepting answers to
> my UDP requests. Now I have found that if I accept RELATED,ESTABLISHED
> traffic without saying anything about the protocol, UDP answers will
> be accepted.
> I know that this isn't a question related to Netfilter but is the only
> place I know to ask about this.
> 
> thanks.

That's true if you have the correct modules installed.  I ran into this 
problem with netbios dns packets which are UDP.  I had to add 
nf_conntrack_netbios_ns to my /etc/modules file and then it would work. 
  This wasn't really clear to me at the time.  I thought all you needed 
was the iptables rule that said RELATED,ESTABLISHED.  There are a bunch 
of those modules.

-- 

Knute Johnson

"The urge to save humanity is almost always a false front for the urge 
to rule."

   H.L. Mencken

