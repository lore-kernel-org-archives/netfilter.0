From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: long ruleset perfomance issue
Date: Mon, 04 Apr 2005 10:35:35 -0500
Message-ID: <42515EC7.90506@riverviewtech.net>
References: <005901c5390b$a363fe30$03c01751@jg>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005901c5390b$a363fe30$03c01751@jg>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: anton@web-sat.com
Cc: netfilter@lists.netfilter.org

Based on the fact that you are wanting to mark traffic for 4500 IPs means to me that you are dealing with approximately 18 class C networks.  Thus I'd be tempted to do some of the following:

iptables -t mangle -N FORWARD_1_1_1_0
iptables -t mangle -N FORWARD_1_1_2_0
iptables -t mangle -N FORWARD_1_1_3_0
iptables -t mangle -A FORWARD -d 1.1.1.0/24 -j FORWARD_1_1_1_0
iptables -t mangle -A FORWARD -d 1.1.2.0/24 -j FORWARD_1_1_2_0
iptables -t mangle -A FORWARD -d 1.1.3.0/24 -j FORWARD_1_1_3_0
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.1 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.2 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.3 -j MARK --set-mark 1
...
iptables -t mangle -A FORWARD_1_1_2_0 -d 1.1.2.1 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_2_0 -d 1.1.2.2 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_2_0 -d 1.1.2.3 -j MARK --set-mark 1
...
iptables -t mangle -A FORWARD_1_1_3_0 -d 1.1.3.1 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_3_0 -d 1.1.3.2 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_3_0 -d 1.1.3.3 -j MARK --set-mark 1

This will make is such that your packets don't have to traverse as many rules in the FORWARD chain directly.  In fact there would only be 18 conditional JUMP to sub chain rules in the main FORWARD chain.  In this situation there would be 255 entries in the sub chains.  You end up with a pseudo tree structure like this

FORWARD
   |
   <sbunet 1.1.1.0/24 -j FORWARD_1_1_1_0
      |
      <ip 1.1.1.1 -j MARK>
      <ip 1.1.1.2 -j MARK>
      <ip 1.1.1.3 -j MARK>
   <sbunet 1.1.2.0/24 -j FORWARD_1_1_2_0
      |
      <ip 1.1.2.1 -j MARK>
      <ip 1.1.2.2 -j MARK>
      <ip 1.1.2.3 -j MARK>
   <sbunet 1.1.3.0/24 -j FORWARD_1_1_3_0
      |
      <ip 1.1.3.1 -j MARK>
      <ip 1.1.3.2 -j MARK>
      <ip 1.1.3.3 -j MARK>

Yielding 18 conditionals in your first level and 255 conditionals in your 2nd level with 2 decisions having to be made.  Something you could do to possibly speed this up would be to play with the tree structure.  I.e. you could build something where you had 36 conditionals in your first level based on 128 subnets and then only 128 conditionals in your 2nd level, though this is more comparisons that would have to be done.  I have a feeling that the math will work out the best if you end up with something along the lines of 18 conditionals on the first level and 2, 4, 8, or 16 conditionals on the 2nd level with sub levels below that.  Assuming that we are only working with one class C for the moment you could build a structure like this with 16 items to choose from and 2 decisions that would have to be made.

iptables -t mangle -A FORWARD -d 1.1.1.0/28 -j FORWARD_1_1_1_0
iptables -t mangle -A FORWARD -d 1.1.1.16/28 -j FORWARD_1_1_1_16
iptables -t mangle -A FORWARD -d 1.1.1.32/28 -j FORWARD_1_1_1_32
iptables -t mangle -A FORWARD -d 1.1.1.48/28 -j FORWARD_1_1_1_48
iptables -t mangle -A FORWARD -d 1.1.1.64/28 -j FORWARD_1_1_1_64
iptables -t mangle -A FORWARD -d 1.1.1.80/28 -j FORWARD_1_1_1_80
iptables -t mangle -A FORWARD -d 1.1.1.96/28 -j FORWARD_1_1_1_96
iptables -t mangle -A FORWARD -d 1.1.1.112/28 -j FORWARD_1_1_1_112
iptables -t mangle -A FORWARD -d 1.1.1.128/28 -j FORWARD_1_1_1_128
iptables -t mangle -A FORWARD -d 1.1.1.144/28 -j FORWARD_1_1_1_144
iptables -t mangle -A FORWARD -d 1.1.1.160/28 -j FORWARD_1_1_1_160
iptables -t mangle -A FORWARD -d 1.1.1.176/28 -j FORWARD_1_1_1_176
iptables -t mangle -A FORWARD -d 1.1.1.192/28 -j FORWARD_1_1_1_192
iptables -t mangle -A FORWARD -d 1.1.1.208/28 -j FORWARD_1_1_1_208
iptables -t mangle -A FORWARD -d 1.1.1.224/28 -j FORWARD_1_1_1_224
iptables -t mangle -A FORWARD -d 1.1.1.240/28 -j FORWARD_1_1_1_240
#iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.0 -j MARK --set-mark 2 #We shouldn't really need this line.
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.1 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.2 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.3 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.4 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.5 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.6 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.7 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.8 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.9 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.10 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.11 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.12 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.13 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.14 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_0 -d 1.1.1.15 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.16 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.17 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.18 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.19 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.20 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.21 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.22 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.23 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.24 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.25 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.26 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.27 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.28 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.29 -j MARK --set-mark 1
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.30 -j MARK --set-mark 2
iptables -t mangle -A FORWARD_1_1_1_16 -d 1.1.1.31 -j MARK --set-mark 1

And so on and so forth.  The problem that you start to run in to is really how do you create the tree properly so that it can be traversed quickly and efficiently.  Take the worst case example, where the IP is the last possible IP to choose from where it would have to traverse 16 conditionals to decide to jump to the next chain and then 16 more conditionals to decide what to mark the packet as.  That is a total of 32 conditionals (plus the one to get in to the class C structure) and 2 actions.  Would it be more efficient to brake the tree down to levels of 4 conditionals so that there would be a total of 16 conditionals (worst case) and 4 jumps?  If you are really paranoid you could brake it down to 2 conditionals and 8 jumps.  It's all in playing with the numbers and where the performance break is at and if you want to go through the trouble or not.  Of course a quick dirty Perl script 
 would make this a LOT easier.  If you want a related topic to see what is going on here r
ead up on B-Trees and the likes for databases.  B/c after all iptables is a small database in the kernel's memory of what to do with various packets that you are trying to efficiently and quickly search and traverse.

As an aside that has already ben mentioned you could use the iptables-save and iptables-restore commands as these make bulk changes to the tables / chains at one time (one invocation of the iptables binary) vs calling iptables for each and every line.

I hope this helps you some and does not confuse you.  If you need any more help or would like help writing a Perl script to do the layout for you I'd be glad to help with that (with and honorable mention ;) too.



Grant. . . .




anton@web-sat.com wrote:

> Hello,
> I need to mark packets going through a linux router with iptables for some 4500 ip addresses(to use with tc bandwidth shaping filters).
> This list needs to be updated every 10 minutes.
> So i made a shell script file looking like:
> 
> /usr/local/sbin/iptables -F 
> /usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.1 -j MARK --set-mark 1
> /usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.3 -j MARK --set-mark 2
> /usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.2 -j MARK --set-mark 1
> and so on for 4500 times.
> 
> When i run this script on Xeon 2.4ghz cpu it takes 2-3 minutes real time with 100% cpu load to process.
> During this time server becomes unusable. 
> Is there any way to make it run faster, like optimizing ruleset or trying a different approach?
> I have tried to search on this issue but was not successful.
> 
> Any input is greatly appreciatred.
> 
> Thank you,
> Anton
> 
> 


