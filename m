From: "Alexis" <alexis@tpys.com.ar>
Subject: how to delete a group of rules
Date: Sat, 27 Nov 2004 14:17:44 -0300
Message-ID: <E1CY6Df-0008Fx-00@deer.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all, im coding a frontend for iptables based on php and mysql.
 
But i have an issue when i try to delete a group of rules, it cant be done. 
 
suppose this
 
a chain called "x1"
 
delete the chain implies 
 
- empty the chain
- delete all  rules that reference the chain
 
the first line is easy to do  with iptables -F x1 , but if (as an example)
in filter::INPUT i have 2 or more references to this chain, executing
iptables -D INPUT -j x1 will delete only the first one and not all rules
that references x1.
 
Does exist any way to do this from command line using iptables, or code a
script to do this is the solution?
 
 
Thank you.
 
 
