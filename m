From: Wolfgang Meyerle <procrash@neusob.de>
Subject: Qos Problem
Date: Sun, 13 Feb 2005 20:55:25 +0100
Message-ID: <420FB0AD.9050008@neusob.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi, has anybody of you ever tried Qos with iptables?
===============================

My Problem is that when I set up htb to classify my packets every 
traffic should go to one of three classes.

-The first class is the priorisized one (thought for myself to put in 
http packets)
-the second one is for peer2peer traffic which should be unpriorisized.
-And third is for the rest of the packets.

Now classifying works very good, but when I want to surf the www the htb 
qdisc doesn't seem to give my http packets fast sending.
My Browser reacts ver slow and surfing seems quite impossible.
I thought the problem could be in the pfifo fast queues that the every 
leaf is assigned by htb.
For this I introduced and bfifo with limit for every leaf.
I gave it simply a limit of 1500bytes no exactly knowing what I'm doing.
Now I can browse perfectly but the throughput of my peer2peer program is 
slow as hell.

To differentiate the Peer2Peer Traffic I uses ipp2p filter with iptables.

What's wrong in my thoughts? Can anybody of you tell me?

Cheers
Wolfgang Meyerle


