From: "Michael P. Soulier" <michael_soulier@mitel.com>
Subject: netfilter oddness
Date: Mon, 17 Feb 2003 17:36:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030217173630.F21013@e-smith.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

    People,

    I'm debugging a problem with using DNAT to create a DMZ. We're getting
problems due to a failure to maintain the source port of the traffic in a
couple of cases. 
    What I'm doing is forwarding UDP in the range 20000:20999 to the box on
the DMZ, but the source port of the traffic is not always being maintained.
I'm hoping someone has seen something like this before. Here is an
annotated packet trace, sniffing all interfaces on the firewall/gateway.
There are 3 NICs on that box, for the external, internal, and DMZ networks. 

-> 6010 sends to tw1 in the field
15:11:30.854033 192.168.17.3.20004 > 66.46.196.131.9000:  udp 172 (DF)
-> traffic is SNAT'd
15:11:30.854065 firewall.mitel.com.20004 > 66.46.196.131.9000:  udp 172 (DF)

-> 6010 sends to tw2 in the field
15:11:30.854227 192.168.17.3.20000 > 66.46.196.139.9000:  udp 172 (DF)
-> traffic is SNAT'd
15:11:30.854243 firewall.mitel.com.20000 > 66.46.196.139.9000:  udp 172 (DF)

-> 6010 sends to ICP
15:11:30.854417 192.168.17.3.20001 > 192.168.1.2.5001:  udp 172 (DF)
-> traffic is routed
15:11:30.854431 192.168.17.3.20001 > 192.168.1.2.5001:  udp 172 (DF)

-> tw2 sends to 6010
15:11:30.856266 66.46.196.139.9000 > firewall.mitel.com.20000:  udp 172 [tos 0xb0]
-> traffic is DNAT'd
15:11:30.856304 66.46.196.139.9000 > 192.168.17.3.20000:  udp 172 [tos 0xb0]

-> 6010 sends to ICP
15:11:30.865773 192.168.17.3.20005 > 192.168.1.2.5000:  udp 172 (DF)
-> traffic is routed
15:11:30.865822 192.168.17.3.20005 > 192.168.1.2.5000:  udp 172 (DF)

-> tw1 sends to 6010
15:11:30.868172 66.46.196.131.9000 > firewall.mitel.com.20004:  udp 172 [tos 0xb0]
-> traffic is DNAT'd
15:11:30.868189 66.46.196.131.9000 > 192.168.17.3.20004:  udp 172 [tos 0xb0]

-------problem---------
-> ICP sends to 6010
15:11:30.873526 192.168.1.2.5000 > firewall.mitel.com.20005:  udp 172 [tos 0xb0]
-> traffic is DNAT'd incorrectly?
15:11:30.873560 192.168.1.2.1024 > 192.168.17.3.20005:  udp 172 [tos 0xb0]
-----------------------

Checking,

ip_nat_core.c
ip_nat_proto_udp.c

    I find that netfilter does try to maintain the port, and do a 1:1 pass
through. However, I can't figure out why it's translating port 5000 to 1024
in this case. 
    Additionally, I found a case where traffic from ports 5000 and 5001
were both translated to a source port of 1024! How connection tracking is
supposed to pull that apart again, I don't know. 

    Any help appreciated. Neither port 5000 or 5001 seem to be occupied,
according to netstat and this trace, so I don't know why it would change
the source port. According to the above code, it will change it if I can't
get uniqueness, 

    Thanks,
    Mike

-- 
Michael P. Soulier <michael_soulier@mitel.com>, 613-592-2122 x2522
SME Solutions, Mitel Networks Corporation
"...the word HACK is used as a verb to indicate a massive amount
of nerd-like effort."  -Harley Hahn, A Student's Guide to Unix

