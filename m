From: =?windows-1251?b?z+7q7vLo6+Xt6u4g?= =?windows-1251?b?yu7x8ujq?= 
	<casper@meteor.dp.ua>
Subject: Reasons for SFQ not being fair
Date: Tue, 29 Apr 2008 15:53:37 +0300
Message-ID: <20080429155337.wck83yqoessw4gcw@new.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi there,

I've been using SFQ as the ending for every class of HTB for very  
long. All working just as expected.

After implementing the abillity to do "limited speed, unlimited  
traffic" clients I've experienced SFQ not being fair for those.  
Precisilly, one of several connections gets bandwidth other stailed or  
they run in turn.

Setup:

1. There are 2 HTB classes for "limited speed, unlimited traffic"  
clients each direction each ending with SFQ:
  - base class (3:9900): for traffic < limit (2.5 Mbit/s for all)
  - land class (3:9910): for landing traffic > limit (1 kbit/s for all)

2. For each of those clients I insert 2 tc filters each direction:
  - tc filter add dev $IN_DEV parent $IN_PARENT_CLASS protocol ip prio  
10 handle $HANDLE10 fw police rate $IN_RATE buffer 10k continue  
classid $IN_BASE_CLASS
  - tc filter add dev $IN_DEV parent $IN_PARENT_CLASS protocol ip prio  
11 handle $HANDLE10 fw classid $IN_LAND_CLASS

All this work perfect except SFQ fairness/flow speed division.

My thinkings:

# tc -s -d qdisc ls dev eth3 (filtered)
qdisc sfq 9900: parent 3:9900 limit 128p quantum 1514b flows 128/1024  
perturb 10sec
  Sent 23753684098 bytes 71470965 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc sfq 9910: parent 3:9910 limit 128p quantum 1514b flows 128/1024  
perturb 10sec
  Sent 38036550 bytes 26648 pkt (dropped 1320085, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 162525b 126p requeues 0

In the "land" class there are too many droped packets. That's logical  
because the rate is low (1 kbit/s) and there are only 128 packets  
length queue. I think this is causing problems/unfairness because  
droped packets means tcp retransmitions in best case and reconnects in  
worst.

I didn't found a way to encrease the limit of 128 packet for the SFQ  
it probably complile time limit.

Any hints/suggestions on how to tune SFQ?


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


