From: Rick Morris <rmorris@wedohosting.com>
Subject: How not to track connections?
Date: Wed, 13 Aug 2003 12:31:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308131231.16565.rmorris@wedohosting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all.

I have a linux box running 2.4.21 using the NETMAP patch to NAT a /22 onto 
local IP addresses, with the following rules.

iptables -t nat -A PREROUTING  -d 64.141.0.0/22 -j NETMAP --to 192.168.0.0/22
iptables -t nat -A POSTROUTING -s 192.168.0.0/22 -j NETMAP --to 64.141.0.0/22

My problem is that one machine behind this router is getting bursts of a few 
hundred thousand (yes, > 100,000) connections and overflowing ip_conntrack, 
even with ip_conntrack_max set at 500000

So what I want to do is remove one class C from this NETMAP'd netblock, and 
route it directly out another ethernet interface. I believe inserting this 
rule in the beginning of the PREROUTING chain will do that:

iptables -t nat -A PREROUTING -d 64.141.3.0/24 -j RETURN

And then add in the appropriate routing rules to make this work.

From what I read, this will not actually stop the conntrack module from 
tracking the connections.

I've found 2 references to modules that should prevent conntrack from tracking 
these connections, and would like some advice on which one is appropriate.

1) raw
iptables -t raw -A PREROUTING -d 64.141.0.3/24 -j NOTRACK

2)25_natcore-nohelper.patch
which I read as being able to deal with the problem by itself, since the 
target for 64.141.0.3/24 is RETURN

Can someone provide some insite here? Which one (both?) of these will do what 
I'm after, are there any caveats?

Alternately, am I way off base here, and should I route the /24 previous to 
the nat box so it doesn't see the traffic at all? 

Thanks very much.

-- 
Rick Morris
WeDoHosting.com
http://www.wedohosting.com


