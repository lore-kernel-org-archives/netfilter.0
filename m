From: Eric Leblond <eric@regit.org>
Subject: Re: iptaccount vs nfacct
Date: Thu, 13 Feb 2014 20:55:55 +0100
Message-ID: <1392321355.17306.112.camel@ice-age2.regit.org>
References: <1392252442.30958.596.camel@worklian>
	 <1392281738.17306.91.camel@ice-age2.regit.org>
	 <1392313420.30958.690.camel@worklian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1392313420.30958.690.camel@worklian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bob@computerisms.ca
Cc: netfilter@vger.kernel.org

Hello,

On Thu, 2014-02-13 at 09:43 -0800, Bob Miller wrote:
> Hi Eric,
> 
> > I wrote this some time ago to explain how you can connect nfacct and
> > ulogd2:
> > https://home.regit.org/2012/07/flow-accounting-with-netfilter-and-ulogd2/
> > One advantage of nfacct combined to ulogd is that you can use ulogd2
> > connector to graphite:
> > https://home.regit.org/2012/12/visualize-netfilter-accounting-in-graphite/
> 
> Thank you very much for your reply, much appreciated :)  I did come
> across that page earlier, but perhaps didn't give it the attention I
> should have.  Now that the whole idea has been swimming around my head a
> couple days it makes more sense to me.
> 
> One thing I am not clear on from your page is per-IP statistics.
> Specifically the reason I use bandwidth accounting at all is to identify
> abusers or heavy usage in a local network (mostly to keep my ISP honest
> and bandwidth overage to a minimum).  
> 
> If I understand the examples correctly, then I would need to set up an
> nfacct table for each IP in the subnet, and then create a matching rule
> for each table in iptables.  As opposed to the ACCOUNT target where if I
> create a rule matching a subnet, it outputs stats for every IP in the
> subnet.  
> 
> Am I understanding correctly? 

Yes.

> or is there an easier way to gather the
> per-IP statistics using nfacct?

I have on my todo list to be able to use ipset counter to get per object
counters. I need to cook a ulogd2 input module for that. But I don't
manage to find the time...

BR,
-- 
Eric Leblond <eric@regit.org>

