From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Fri, 04 Feb 2011 22:44:58 -0400
Message-ID: <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296761916.7587.29.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Thu, 2011-02-03 at 19:38 +0000, Andrew Beverley wrote:
> On Wed, 2011-02-02 at 22:17 -0400, Optimum Wireless Services wrote:
> > I would like to know how can I run some sort of benchmark test on a
> > network that would simulate 10,20,50,100 users connected to see if my gw
> > is handling the traffic well.
> > 
> 
> I suggest using tc-viewer to see what your qdisc is actually doing
> during peak use:
> 
> tc-viewer --iface=eth1 --zero --counter=1 --unit=kbit
> 
> > Here's a snip of what the script looks like:
> > 
> > ################ 
> > Now Download interface
> > 
> > $tc qdisc del dev eth1 root
> > $tc qdisc add dev eth1 root handle 2: htb r2q 1
> > 
> > $tc class add dev eth1 parent 2:0  classid 2:1 htb rate 15500kbit ceil
> > 15525kbit
> > 
> 
> Does the sum of all the leaf classes below add up to the root rate
> above? From the HTB manual: "The rate supplied for a parent should be
> the sum of the rates of its children."
> 

Hi Andy.

The sum of my users' classes or leafs rate would not be equal to the
parent's. They will never add up to the total root class since I will be
adding rules every once in a while so, if my root total BW is 15Mbps and
I have 100 users at 512kbps each then, that could be a problem. 

Is there something else to do instead?

