From: Anoop S <anoop@it-om.com>
Subject: Proxy ARP problem
Date: 25 Jan 2003 12:27:04 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043477839.30581.3.camel@brahmos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


I dont know if this the proper place to ask this.
but i m having this problem which i have to solve urgently..pls help

i have set up bandwidth management on a system (tc) and have used 
Proxy ARP to make it transparent to the network.

eth0 of this system is connected to a NT machine running Symantec Raptor
firewall and eth1 is connected to the LAN.

the problem is that the firewall drops the packets coming from the lan
saying that they are broadcast/multicast. if the firewall is removed,
all works fine. 

cant make out the reason for this

thanks for your help
regards
Anoop s


