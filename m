From: "David O'Brien" <dobrien@naccrra.org>
Subject: Using External NATTED addresses Inside the Firewall
Date: Tue, 18 May 2004 15:29:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.2.20040518151903.03c3ee30@mail.naccrra.org>
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

I've got an external interface eth1 with ip's x.x.x.128/25
I have internal interface eth0 with ip's 192.168.123.0/24

I have some 1:1 NAT rules active

-A PREROUTING -d x.x.x.250 -p tcp -j DNAT --to-destination 192.168.123.252
-A PREROUTING -d x.x.x.160 -p tcp -j DNAT --to-destination 192.168.123.75
-A PREROUTING -d x.x.x.199 -p tcp -j DNAT --to-destination 192.168.123.31

and the corresponding POSTROUTING entries

-A POSTROUTING -s 192.168.123.252 -o eth1 -p tcp -j SNAT --to-source x.x.x.250
-A POSTROUTING -s 192.168.123.75 -o eth1  -p tcp -j SNAT --to-source x.x.x.160
-A POSTROUTING -s 192.168.123.31 -o eth1  -p tcp -j SNAT --to-source x.x.x.199

and the FORWARD entries

-A FORWARD -d 192.168.123.31 -p tcp -j ACCEPT
-A FORWARD -d 192.168.123.31 -p udp -j ACCEPT
-A FORWARD -d 192.168.123.252 -p tcp -m multiport --dport 80,3000,143,3389 
-j ACCEPT
-A FORWARD -d 192.168.123.252 -p udp -m multiport --dport 80,3000,143,3389 
-j ACCEPT
-A FORWARD -d 192.168.123.75 -p tcp -j ACCEPT
-A FORWARD -d 192.168.123.75 -p udp -j ACCEPT

What I need to happen is when a user on an Internal 192.168.123.x address 
tries to pull up
a web page or check mail or anything off of one of the three 1:1 NAT'd 
boxes they can by using the
real x.x.x.250 , .199 , or .160 addresses and or the boxes hostname. 
Another DNS server for just
internal use isn't possible right now. I need an iptable rule (probably 
OUTPUT)  that redirects
the x.x.x.whatever address back to the internal address is it's one of the 
three and if it's
coming from the inside.

TIA
-Dave



David G. O'Brien
Web Services Coordinator / Systems Administrator

NACCRRA
The Nation's Network of Child Care Resource & Referral
1319 F Street NW, Suite 500
Washington, DC 20004
(202) 393-5501 ext. 113
(202) 393-1109 fax



