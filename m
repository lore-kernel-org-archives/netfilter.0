From: Jason Joines <joines@bus.okstate.edu>
Subject: Another Hardware Sizing Question
Date: Fri, 05 Sep 2003 11:26:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F58B934.3060902@bus.okstate.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

   We have a subnet with a potential of 1022 hosts.  Each machine is 
connected to a 100 Mbps switch.  The connection from our subnet to the 
main university network is I believe OC-3, ~154 Mbps.  There are 
currently less than 500 active machines on the network.  They do the 
normal web brosing, and connect to NetWare and Domino servers outside 
the subnet.  With that, the maximum traffic we've ever seen between our 
subnet and the rest of the world is about 40 Mbps.

   We'd like to put all the boxes on our subnet behind and IPTables 
firewall and NAT them.  We'd also like to take into consideration the 
possibility of the number of machines growing to ~1000.  We have quite a 
few spare PIII 450 boxes setting around.

   What would be the mininum, ideal, etc., hardware setup for this 
environment.


Thanks,

Jason Joines
Open Source = Open Mind
========================


