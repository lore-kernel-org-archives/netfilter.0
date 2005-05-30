From: Cian Masterson <cianm@klasonline.com>
Subject: Kernel panic when routing large pings on an XScale (IXP425).
Date: Mon, 30 May 2005 15:26:02 +0100
Message-ID: <429B227A.1000306@klasonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

I am using iptables on an Intel ixp425 (XScale/ARM processor) and am 
finding that I get a kernel panic when I try to send large (65k) pings 
to the board, or route them across the board.  Iptables is not 
configured with any rules (see below) so all traffic is passed through 
the board.  I don't see any problems with regular pings/FTP 
transfers/etc and I have left a chain of boards passing traffic over the 
weekend with no problems, however the board will always experience a 
kernel panic within 30 seconds of me initiating large pings.  I have 
applied the ixp425_eth_1_1_update_nf_bridge.patch patch that I got from 
Intel 
(http://developer.intel.com/design/network/products/npfamily/ixp400_osc.htm) 
to no avail.  I am running version 1.4 of Intel's software but before 
anyone suggests it upgrading to 1.5 is simply not an option at this 
point, unfortunately.

If I don't insert the iptables modules the board passes large pings 
without any problems so it is definitely a ixp425_eth.o/netfilter 
interaction problem.  I've downloaded and searched through the archives 
for this board and have found a posting from Rob Ranslam of Intel 
stating that if I also have ebtables then I'll need an extra patch from 
sourceforge, however I *don't* have ebtables so I can't see how that 
patch would be needed in my case.  The documentation for the Intel patch 
seems to relate to bridging, and I've seen posts from others who say 
routing works but bridging doesn't but my problem definitely relates to 
routing.  Has anyone seen a problem like this and/or can anyone offer 
any ideas as to where I should be looking for the problem as I'm a 
netfilter newbie?  Thanks.

Slan,
Cian

PS:  Below is the output of iptables --list for reference;
  root@(none):~# iptables 
--list                                                 
  Chain INPUT (policy 
ACCEPT)                                                    
  target     prot opt source               
destination                           
   
                                                                              

  Chain FORWARD (policy 
ACCEPT)                                                  
  target     prot opt source               
destination                           
   
                                                                              

  Chain OUTPUT (policy 
ACCEPT)                                                   
  target     prot opt source               
destination                           
  root@(none):~#



