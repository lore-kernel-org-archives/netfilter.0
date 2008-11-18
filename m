From: bahamin takhtaei <b_takhtaei@yahoo.com>
Subject: Re: specified protocl number problem
Date: Tue, 18 Nov 2008 01:35:45 -0800 (PST)
Message-ID: <661657.80032.qm@web55307.mail.re4.yahoo.com>
References: <49227324.4080508@critical.com>
Reply-To: b_takhtaei@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49227324.4080508@critical.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
I change the rules to these:

iptables -A INPUT -p 200 -j QUEUE
iptables -A OUTPUT -p 200 -j QUEUE

and send some packets with protocol-number=200 to target,
but Iptables can't QUEUE the packets still!


--- On Tue, 11/18/08, Bill Chappell <chappewr@critical.com> wrote:

> From: Bill Chappell <chappewr@critical.com>
> Subject: Re: specified protocl number problem
> To: "bahamin takhtaei" <b_takhtaei@yahoo.com>
> Cc: "netfilter" <netfilter@vger.kernel.org>
> Date: Tuesday, November 18, 2008, 2:47 AM
> The packets you are seeing (TCP, UDP, and ICMP)
> are what you would get if you were to specify
> "-p all".
> "all" is not as inclusive as one might expect.
> To get packets with other protocols, you must
> specific them explicitly.
> 
> Bill
> 
> bahamin takhtaei wrote:
> > Hi everybody,
> > 
> > Why I can't QUEUE some ip-protocol packets such as
> IGMP, AH, ESP and so on?
> > I add these rules to Iptables:
> > 
> > iptables -A INPUT -j QUEUE
> > iptables -A OUTPUT -j QUEUE
> > 
> > and I see that TCP, UDP and ICMP packets are queued
> only and other protocol packets are not! But I see them by
> tcpdump. :(
> > 
> > 
> > 
> >       --
> > To unsubscribe from this list: send the line
> "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> > 
> 
> -- William Chappell, Software Engineer, Critical
> Technologies Inc.
> * Creativity * Diversity * Expertise * Flexibility *
> Integrity *
> Suite 400 Technology Center, 4th Floor 1001 Broad St, Utica
> NY 13501
> 315-793-0248 x148 FAX -9710
> <bill.chappell@critical.com> www.critical.com


      
