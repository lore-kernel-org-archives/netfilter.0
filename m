From: Bob Miller <bob@computerisms.ca>
Subject: Re: iptaccount vs nfacct
Date: Thu, 13 Feb 2014 09:43:40 -0800
Message-ID: <1392313420.30958.690.camel@worklian>
References: <1392252442.30958.596.camel@worklian>
	 <1392281738.17306.91.camel@ice-age2.regit.org>
Reply-To: bob@computerisms.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1392281738.17306.91.camel@ice-age2.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

Hi Eric,

> I wrote this some time ago to explain how you can connect nfacct and
> ulogd2:
> https://home.regit.org/2012/07/flow-accounting-with-netfilter-and-ulogd2/
> One advantage of nfacct combined to ulogd is that you can use ulogd2
> connector to graphite:
> https://home.regit.org/2012/12/visualize-netfilter-accounting-in-graphite/

Thank you very much for your reply, much appreciated :)  I did come
across that page earlier, but perhaps didn't give it the attention I
should have.  Now that the whole idea has been swimming around my head a
couple days it makes more sense to me.

One thing I am not clear on from your page is per-IP statistics.
Specifically the reason I use bandwidth accounting at all is to identify
abusers or heavy usage in a local network (mostly to keep my ISP honest
and bandwidth overage to a minimum).  

If I understand the examples correctly, then I would need to set up an
nfacct table for each IP in the subnet, and then create a matching rule
for each table in iptables.  As opposed to the ACCOUNT target where if I
create a rule matching a subnet, it outputs stats for every IP in the
subnet.  

Am I understanding correctly?  or is there an easier way to gather the
per-IP statistics using nfacct?

