From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 12:35:35 +0000
Message-ID: <1296909335.1695.14.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296909336; bh=Z3h/Nmk9Ryyp2Pxtu25hjTKfif3VnaoZNTuGb
	MJH0TU=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=MFAXZR8s
	4CFgeNkiFZcjbctH+MNh6gh/9s8AWRcPJcMP5JDO0AUypfMHiUGW82zmbtkhRsAgI1x
	lWTFL4461au41ywCuNhikcnDfn+QAwyA7gGd9cY8/uAiMa+Gaz2GCCcF9Gb/NB6+exm
	6vnztDaYPTd908HjiR7ASKqbBXQWM=
In-Reply-To: <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Fri, 2011-02-04 at 22:44 -0400, Optimum Wireless Services wrote:
> On Thu, 2011-02-03 at 19:38 +0000, Andrew Beverley wrote:
> > On Wed, 2011-02-02 at 22:17 -0400, Optimum Wireless Services wrote:
> > > I would like to know how can I run some sort of benchmark test on a
> > > network that would simulate 10,20,50,100 users connected to see if my gw
> > > is handling the traffic well.
> > > 
> > 
> > I suggest using tc-viewer to see what your qdisc is actually doing
> > during peak use:
> > 
> > tc-viewer --iface=eth1 --zero --counter=1 --unit=kbit
> > 
> > > Here's a snip of what the script looks like:
> > > 
> > > ################ 
> > > Now Download interface
> > > 
> > > $tc qdisc del dev eth1 root
> > > $tc qdisc add dev eth1 root handle 2: htb r2q 1
> > > 
> > > $tc class add dev eth1 parent 2:0  classid 2:1 htb rate 15500kbit ceil
> > > 15525kbit
> > > 
> > 
> > Does the sum of all the leaf classes below add up to the root rate
> > above? From the HTB manual: "The rate supplied for a parent should be
> > the sum of the rates of its children."
> > 
> 
> Hi Andy.
> 
> The sum of my users' classes or leafs rate would not be equal to the
> parent's. They will never add up to the total root class since I will be
> adding rules every once in a while so, if my root total BW is 15Mbps and
> I have 100 users at 512kbps each then, that could be a problem. 
> 

Hmmm, well HTB is known to misbehave if they don't all add up correctly,
which could explain your problems. Why don't you *try* it with them all
adding up correctly, just temporarily for your current number of users,
to see if this is the problem.

> Is there something else to do instead?
> 

You could have a look at another classful qdisc such as HFSC or CBQ.
However, I've never played with them, so they may not be of any more
help.

Andy


