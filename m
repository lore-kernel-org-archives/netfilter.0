From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: Packets that should have been DNATted appearing in INPUT table
Date: Tue, 11 Jan 2005 19:15:27 +0100
Message-ID: <008901c4f809$87cd7680$4206a8c0@loki>
References: <Pine.LNX.4.05.10501101924120.16399-100000@darkstar.sysinfo.com><002801c4f7ee$ccf74210$4206a8c0@loki>
	<20050111162914.GA14045@bender.817west.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

On Tuesday, January 11, 2005 5:29 PM,
Jason Opperisano wrote:

> all the packets that were part of the established connections in step
> 2 will no longer have a conntrack entry that ties them to the DNAT,
> and they will end up in INPUT and get dropped.

Thats a very interesting theory! I would never have thought of that myself. 
And you are right, I actually do restart my firewall quite often during 
testing phase. There are just 2 things still preventing me from being 
completely happy:
1) The drops still happen after running the firewall for several hours. Its 
just a feeling, but isn't that a very long time for a tcp connection?
2) When I take a look at /proc/net/ip_conntrack it does not empty when 
restarting the firewall, so I thought, existing connections should go 
unharmed.

Maybe I looked in the wrong places, but are there detailed information about 
how DNAT works internally (apart from reading the sources ;-))?

Something I could also imagine, is that those 
somehow-not-handled-as-i-expected-packets are just bogus packets not 
belonging to any connection. In that case, namely that these packages are of 
no use anyhow (and that they would have been dropped at the target box, 
because of not belonging to any existing connection or initialising a new 
connection themselves), it would be perfectly correct to drop them at the 
router.
But there are still things, I do not understand, if thats the case:
Reverting to my mostly favourite game (comparing counters) I noticed the 
following:

Chain PREROUTING (policy ACCEPT 646K packets, 32M bytes)
 pkts bytes target     prot opt in     out     source 
destination
    0     0 LOG        tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4664 state INVALID LOG flags 0 level 6 prefix 
`SUSPICIOUS: '
  582 31900 LOG        tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4664 LOG flags 0 level 6 prefix `NORMAL: '
  582 31900 DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4664 to:192.168.6.10
    0     0 LOG        tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4664 LOG flags 0 level 6 prefix `SUSPICIOUS: '

For me it looks perfectly normal and like should-be-working. But in INPUT 
the drops are still there:

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source 
destination
   22  1096 DROP       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4664

I also noticed that the LOG rule in nat PREROUTING has far less matches 
counted than the same LOG rule in mangle PREROUTING.

Perhaps you can tell me, whether I am right if i think that either
1) The critical packets have matched DNAT but somehow DNAT thought that it 
should not alter the destination and rather direct it to INPUT
2) The critical packets have never even entered nat PREROUTING (seems 
probable, but I have no proof)

Unfortunately, even if either of the two cases really happens, I still don't 
have any explanation, why it does...

Thank you very much,

Marius 


