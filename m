From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Tue, 08 Feb 2011 01:01:56 +0000
Message-ID: <1297126916.1742.40.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296909335.1695.14.camel@andybev>
	 <1296958657.3695.22.camel@debian-laptop.OptimumWireless>
	 <1297007648.1613.4.camel@andybev>
	 <1297009712.3928.5.camel@debian-laptop.OptimumWireless>
	 <1297012266.1613.59.camel@andybev>
	 <1297035219.3928.31.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297126933; bh=YMqtpOGa+MzRzXYpRT68ZUxaMdKHZawZV+ows
	0ytcTs=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=Q4BIp5dC
	bCvG5o+NUm/da1ZGV4XX8JL551Zo2qLjmmHdYutjhvLZyh7dKEeKX32SGq9ornVR7yT
	cEKvL49XKtq5vTfEtqu9b3mC1+sruYInPPyYKRSgH5XRNHLt58WiQOuchtnbd8bfE4G
	q1VJbyGgo2fJBKUpHWDPqMlk2Z+J4=
In-Reply-To: <1297035219.3928.31.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Sun, 2011-02-06 at 19:33 -0400, Optimum Wireless Services wrote:
> On Sun, 2011-02-06 at 17:11 +0000, Andrew Beverley wrote:
> > On Sun, 2011-02-06 at 12:28 -0400, Optimum Wireless Services wrote:
> > > On Sun, 2011-02-06 at 15:54 +0000, Andrew Beverley wrote:
> > > > > Just wondering, I have a total of 15Mbps for our total bandwidth. If I
> > > > > devide that into 512kbps then I can only have about 29 users at that
> > > > > rate.
> > > > 
> > > > You could use HTB's "ceil" parameter for each leaf class to specify the
> > > > max rate per user - that value can be anything up to and including the
> > > > maximum rate of the root qdisc. It's the total of all the "rate"
> > > > parameters of the leaf classes that should add up to the root's total.
> > > > 
> > > 
> > > If I have users on different packages then how would I accomplish that?
> > > 
> > 
> > Something like:
> > 
> > tc qdisc add dev ... root handle 1: htb
> > tc class add dev ... parent 1: classid 1:1 htb rate 2000kbit
> > ...
> > tc class add dev .... htb rate 200kbit ceil 2000kbit prio 1
> > tc class add dev .... htb rate 200kbit ceil 2000kbit prio 1
> > tc class add dev .... htb rate 200kbit ceil 1000kbit prio 2
> > tc class add dev .... htb rate 200kbit ceil 1000kbit prio 2
> > tc class add dev .... htb rate 200kbit ceil 500kbit prio 3
> > tc class add dev .... htb rate 200kbit ceil 500kbit prio 3
> > tc class add dev .... htb rate 200kbit ceil 500kbit prio 3
> > tc class add dev .... htb rate 200kbit ceil 500kbit prio 3
> > tc class add dev .... htb rate 200kbit ceil 500kbit prio 3
> > tc class add dev .... htb rate 200kbit ceil 500kbit prio 3
> > 
> > Note that all the rates add up to the root, but that each leaf class has
> > the ceil set at the top limit.
> 
> How would the filtering be done here?

In the same way as Marek's original script. Just replace his HTB leaf
class rules with ones similar to the above.

You could also use something like:

tc filter add dev eth0 parent ... protocol ip handle ... flow \
	hash keys nfct-dst divisor 1024

to balance loads between client IP address rather than connection stream
(which may help a lot if you get it correct).

Andy

> 
> Filter by type of service and attach to one of the leafs?
> 

Filter by IP hash as per Marek's email.

Andy


