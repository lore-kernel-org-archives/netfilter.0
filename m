From: "Pete Davis" <peted@springisd.org>
Subject: Connection or process limit
Date: Fri, 11 Oct 2002 14:24:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sda6df30.020@hiway.springisd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org", netfilter@lists.netfilter.org, , 

I am trying to find out the capacity of my iptables firewall.  Is there
a limit for the state table in terms of connections it can track?  How
about a Linux limit on processes, etc.?  We have a DS3 at 15mb/s and I
want to make sure my box can handle it before I continue on my project. 
Currently, I have a 500mhz Intel box with 256mb of memory and 
server-class Intel 10/100 NICs.  It seems this should be able to handle
it if I tweak the kernel configs properly.

This box is going to be acting more as a screening router than a
firewall (it is a bridging + iptables firewall... no IP on the box). 
The rule set will be minimal as I just want to screen out obvious bad
traffic from getting to the network OUTSIDE my firewall (from the
internet).  The main firewall does a great job for the internal stuff
but I want to help the external stuff as much as possible without
interfering with legitimate traffic. 

Any comments, helpful hints, words of experience...?

