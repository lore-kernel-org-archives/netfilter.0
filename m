From: James Stickland <jstic04@cp.centennialcollege.ca>
Subject: NAT Helpers?
Date: Sat, 10 Sep 2005 01:05:08 -0400
Message-ID: <43226984.5070607@cp.centennialcollege.ca>
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


	My problem with this network setup is that when the terminal server 
attempts to join the domain, or do such things as browse all the network 
shares (as opposed to typing in their ip address), it attempts 
connections to the 10.10.10.7 broadcast address.  The problem lies 
within the router  - it does not forward broadcasts.  With netfilter, 
are there any nat helpers I can use  for forwarding  broadcasts between 
interfaces? Im looking for something similar to the  cisco ip nat helpers.

If such things exist for netfilter, could someone also please provide 
examples?  Thanks




