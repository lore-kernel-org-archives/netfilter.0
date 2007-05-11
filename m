From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Policy targets...
Date: Fri, 11 May 2007 12:14:15 +0200
Message-ID: <464441F7.3050808@freemail.hu>
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
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Hi all,

I was reading the iptables manual because I needed the correct arguments 
of the policy (-P) command.
Here it is:

       -P, --policy chain target
              Set the policy for the chain to the given target.  See the 
section TARGETS for the legal targets.  Only built-in (non-user-defined) 
chains can
              have policies, and neither built-in nor user-defined 
chains can be policy targets.

So I checked the TARGETS.

TARGETS
       A  firewall rule specifies criteria for a packet, and a target.  
If the packet does not match, the next rule in the chain is the 
examined; if it does
       match, then the next rule is specified by the value of the 
target, which can be the name of a user-defined chain or one of the 
special values ACCEPT,
       DROP, QUEUE, or RETURN.

My question is: What is the difference between the ACCEPT and the RETURN 
target in policy ??? :D

Thanx.

Swifty

