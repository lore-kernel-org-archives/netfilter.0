From: Kevin Van Workum <vanw@usna.edu>
Subject: ip_conntrack limit && stateless firewalls
Date: Fri, 11 Feb 2005 09:49:40 -0500
Message-ID: <Pine.CYG.4.62.0502110943440.2348@MI340a.chem.mathsci.usna.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm having a problem with my firewall where packets are being dropped due 
to the ip_conntrack limit. I could up the limit, but my users need 30k+ 
connections simultaneously and with the minimum overhead. And I only have 
1 firewall box. So I'd like to disable or by-pass ip_conntrack some how to 
avoid dropped packets and reduce over head. How can I do this, and more 
importantly, would it be helpful.

Kevin

