From: DEXTER <dexter@fiktiv.szgtikol.kando.hu>
Subject: Linux - NAT Question
Date: Sun, 11 Dec 2005 23:05:40 +0100
Message-ID: <439CA2B4.60803@fiktiv.szgtikol.kando.hu>
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

Hi!

I've tried to search the web for this, but i couldn't find any userful
information about it.

So.. There are about 400 (or more) computers, which goes through a BSD
box, doing NAT.

The problem is, when all of the users do theys general daily things,
than the BSD machine runs out of free ports, to do nat, and drops
connections.

My question is, on Linux, how is the nat working, i mean how many ports
is it using for nat, and what happens when it runs out of free ports? Is
there any possibility to do the nat on 2 or more machines, with
something like "load balancing" or so...

If there is any documentation in this topic, than pls share me.


thx!


