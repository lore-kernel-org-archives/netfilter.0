From: Joe Giles <jgiles@windowsproof.com>
Subject: Time module
Date: Wed, 9 Aug 2006 12:13:51 -0600
Message-ID: <200608091213.51972.jgiles@windowsproof.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I have a simple question that I hope I can have answered on this list.

After fighting with the kids last school season as to what time they can 
access the internet after hours for leasure time, and loosing due to their 
inability to follow directions, I was looking into imposing a time limit for 
their access using fwbuilder, a front end to iptables.

However, after setting up a simple test rule, I noticed that the firewall 
compiler was complaining about a missing time module for iptables (I don't 
have the actual module name in hand, but can get it if its needed).

So, I went to the Netfilter web site and found the module that I needed, time 
module, and it was stated that I could get it from P-O-M. However, I 
downloaded the latest snapshot (As per the instructions) but I fail to find 
the time module in any of the repos (  submitted, pending, base, extra, 
userspace).

Could someone point me in the general, or explicit direction to where I need 
to go to get this module compiled into my kernel?

Thanks a million!!!

Joe Giles

