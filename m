From: "B. van Ouwerkerk" <bvo@atz.nl>
Subject: nat no traffic returns
Date: Wed, 21 May 2003 11:23:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

This one is really starting to get me.

I have worked with iptables before without connections started from the 
outside. In this case I need to allow connection from the outside to go to 
a box on the inside.

I was under the impression that a rule like:

iptables -t nat -A PREROUTING -i eth0 -p tcp -d public_ip --dport 3389 -j 
DNAT --to 10.0.0.112:3389

would send the incoming packets to the inside box. And that:

iptables -A FORWARD -i eth1 -o eth0 -s 10.0.0.112 -j ACCEPT
or
iptables -A FORWARD -i eth1 -j ACCEPT

Should send any reply from the inside box to the world.

But it isn't happening :(
I have played with several alternative rules but none of them seem to work.

conntrackt holds the following relevant connection:
tcp      6 87 SYN_SENT src=my_own_pc_public_ip dst=public_ip_of_linux_box
sport=1108 dport=21 [UNREPLIED] src=10.0.0.112 dst=my_own_pc_public_ip
sport=21 dport=1108 use=1

I have added rules to log any incoming packet which is intended to travel 
via the nat chain and that indicates the traffic arrives at the box.

I can SSH into the linuxbox and I can connect to the inside box (after 
adding some rules).

Somehow I just don't see why this is happening.. I will go onsite today 
because I need to update the kernel anyway.. and I want to see if I can 
connect to the outside world when I'm sitting behind that box.

Any thought?

TIA,


B.


