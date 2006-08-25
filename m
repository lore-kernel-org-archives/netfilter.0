From: Matt Singerman <msingerman@ncemch.org>
Subject: creating one rule for both tcp and udp?
Date: Fri, 25 Aug 2006 13:59:40 -0400
Message-ID: <44EF3A8C.6000004@ncemch.org>
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

I was wondering, if I wanted to fliter packets on a specific port, can I 
write a single rule to work on both tcp and udp traffic, or will I have 
to write one rule for each?

Support, for instance, that I want to allow TCP and UDP packets from any 
host on port 548 to a machine with IP address 192.168.1.4, could I write 
a rule like:

-A FORWARD -s 0/0 -d 141.161.111.203  -p all --dport 548 -j ACCEPT

(please note, I am just using port 548 as an example.)

Now, I know that this doesn't work, because I tried it :)  I can back 
the error:

iptables v1.3.5: Unknown arg `--dport'

I am guessing that is because "-p all" include ICMP, which doesn't take 
the --dport argument.  Am I wrong about that?

So, to do this, I would have to do two rules:

-A FORWARD -s 0/0 -d 141.161.111.203  -p tcp --dport 548 -j ACCEPT
-A FORWARD -s 0/0 -d 141.161.111.203  -p udp --dport 548 -j ACCEPT

Now, I would prefer not to do this, because in a lot of places, I would 
have to add a whole lot of rules.  So, I ask, is there a way to comine 
TCP and UDP into a single rule?

Thanks!

