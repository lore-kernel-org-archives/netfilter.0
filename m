From: Lukasz Hejnak <szift@wp.pl>
Subject: Two ISPs, a bridge and iptables
Date: Mon, 13 Dec 2004 18:11:23 +0100
Message-ID: <20041213171123.GA13902@samuraj>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi
I've been thinking about connecting two ISP's to a linux box and
then firewalling/masqrading that to a local net.
The solution I'm thinking of is:
- connect the ISP's to two different interfaces (say eth0/1)
- connect the local net via a third interface (eth3)
- bridge the two network interfaces into one (eth2)
- doing the rest of the iptables stuff using 
    eth2 as the internet and eth3 as the local net
some ascii art:

   ISP#1      ISP#2
     |          |
===============================
     |          |
   eth0       eth1
     |          |
     ---bridge---
         eth2
	  |   
       iptables   (linux box)
         masq
          |
	 eth3
	  |
===============================
	  |
     local network
    
Now since I still have no playground for this to test, I've got these questions:
Would this solve the problem? 
(local net have access at ISP1+ISP2 bandwidth to the internet)
Would the total load of connections outside be balanced
by iptables/bridge mechanism between the ISP's?
Is this the best/worst/fastest/slowest way to do this?
How will the things change when one of the ISP's fail?

-- 
with regards
Lukasz Hejnak
szift@wp.pl

