From: Chris Brown <chris@wavetex.com>
Subject: Bridging firewall setup
Date: Tue, 16 Dec 2003 10:55:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDF38FF.3090109@wavetex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all, new to the list. I'm trying to get a bridging firewall setup on 
a RH 9 box and I'm not having much luck. The bridge itself works fine 
but when I try to add rules using netfilter they seem to be ignored and 
packets I'm trying to block go on through. I've been digging through the 
list archives, google, various forums and HOWTOs and I still haven't 
found the answer so I'm hoping someone here can point out what I'm doing 
wrong :)

Here's what I have. The bridge is nothing special, its not the gateway 
and it doesn't do NAT. It does do traffic shapping but turning that part 
on/off didn't seem to make a difference here.

I decided to start simple by blocking some (presumably) msblast traffic 
on port 135. From the HOWTOs I've been reading all rules on the bridge 
should be in chain FORWARD so I did:

iptables -F
iptables -X # RH has some user-defined chains and i just dumped those
iptables -A FORWARD -p udp --dport 135 -j DROP
iptables -A FORWARD -p tcp --dport 135 -j DROP

Nothing ... traffic still gets through ... so I explicitly added the 
interface

iptables -i br0 -A FORWARD -p udp --dport 135 -j DROP
# same for tcp

Still nothing.
Next I tried filtering connection attempts to mysql from the outside 
world (something I want to do anyway) (IP address hidden to protect the 
innocent :) )
iptables -A FORWARD -d x.x.x.x/24 -p tcp --dport 3306 -j DROP

Tried to connect to mysql from the outside world. No luck I can still 
get to it.

For grins I also tried the rules on INPUT and on OUTPUT with the same 
results. I tried enabling ip forwarding which some of HOWTOs I read said 
was an optional step but that didn't make a difference either, that also 
seemed to be if I were to be using the machine as the gateway. A friend 
of mine even suggested using -t nat -A PREROUTING which didn't make a 
lot of sense to me but I tried it anyway, still with the same result.

I don't see any errors when I execute the commands and I can see all the 
rules in iptables -L but they don't seem to do anything ... its very 
perplexing, any ideas?

thanks in advance
Chris

-- 
Chris Brown
System Administrator / Web Application Developer
Wavetex Inc.
903-533-1700
http://wavetex.com/


