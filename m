From: Justin Schoeman <justin@expertron.co.za>
Subject: Traffic shaping questions and possible extensions
Date: Thu, 23 Aug 2007 17:28:44 +0200
Message-ID: <46CDA7AC.40009@expertron.co.za>
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

Hi,

It has been quite a while since I looked at what was happening in Linux 
traffic shaping, so I am not sure if this has been discussed / improved 
on since I last looked.

We use a traffic shaper based on HTB.  The basic principals work fine, 
but we have a problem with 'intermittent trafic' like http and 
interactive ssh sessions.

Each of these categories of traffic have their own class, and are 
allocated a certain 'guaranteed' rate. However, if other traffic is 
bursting into this bandwidth, we see that very often it takes so long 
for the other traffic to throttel back that the effective QoS is very bad.

If we hard cap the other traffic to leave the guarantee open, then web 
and ssh access is very very good.

So the problem seems to lie with getting other traffic to slow down quicker.

Are there any current solutions/suggestions to working around this?

If not, I have one possible solution, and I would appreciate any 
feedback on it:

At the moment, if traffic cannot be sent immediately (there is no 
bandwidth available for it), then it is first queued, and if the queue 
gets too long, packets are dropped.

This will slow down the sender, but relies on the expiry of TCP timers 
to acheive this.

What I was thinking was that for bulk traffic that needs (and can 
tolerate aggresive throtling), instead of queueing the packet, keep a 
history of the last ACK packet sent, and resend it.

The receiver will see this as a duplicate ack, and immediately enter a 
congestion avoidance algorithm, throtling the data.

Is this feasible, or is it a Really Stupid Idea (TM)?

Thanks!
Justin

