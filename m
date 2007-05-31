From: Bgs <bgs@bgs.hu>
Subject: syn DDoS attack solution
Date: Thu, 31 May 2007 18:19:14 +0200
Message-ID: <465EF582.4070904@bgs.hu>
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


  Hi all,


  We recently got under a low traffic botnet DDoS attack. All attacker 
nodes opened a single tcp session (just SYN part) and then did nothing. 
This rules out rate limiting solutions and syncookie doesn't help 
either. (Thousands of attacking nodes).


  I'd like to know you thoughts about two possible approaches in solving 
this:

- syn proxy: already used for example by Cisco. The router handles the 
first part of the connection and only routes packets to the client if 
the connection seems good. (Good against single/spoofed incoming SYNs 
but may be used to wait for the first packet with actual data as well).
- Implement a conntrack solution that gives a timestamp to the 
connection. Then this timestamp could be used to drop the connection if 
no data arrives within a configured time limit (good for open inactive 
connections only). Of course appropriate close toward the local client 
has to be done as well.

What's your opinion?

Bye
Bgs

