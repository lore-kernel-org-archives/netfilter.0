From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 02:07:10 -0400
Message-ID: <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I apologize for sending so many emails regarding the same topic but, I'm
trying to get this right.

I finally (I think) changed my previous script to write different
filters:

## Download
## Parent ID: 2, Associated with iface: eth1 -- LAN Interface.
$tc qdisc del dev eth1 root
$tc qdisc add dev eth1 root handle 2: htb r2q 1

$tc class add dev eth1 parent 2:0  classid 2:1 htb rate 15000kbit ceil
15000kbit

##  User Name
$tc class   add dev eth1 parent 2:11    classid 2:1001 htb rate 739kbit
ceil 739kbit prio 3
$tc filter  add dev eth1 parent 2:0     protocol ip u32 match ip dst
172.16.100.11/32 classid 2:1001
$tc qdisc   add dev eth1 parent 2:1001  handle 501: sfq perturb 2

etc....

All users have basically the same format.

Now, for the upload I cant get it shape with squid running in the
middle. If I remove squid then, traffic shaping works ok.

Andy recommended to use ifb but, I don't know where to get the download
from. Is supposed to be on kernel 2.26.20 and up and I'm running a
kernel that "qualifies" but, cant really get ifb to do anything.

Well, time to go to bed. Please correct me if I have something wrong
with the rule set.

Thanks.



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
> Is there something else to do instead?
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

