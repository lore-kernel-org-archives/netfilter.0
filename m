From: Fred Gansevles <fred@gansevles.defamilie.nl>
Subject: FORWARD-ed packet doens't reach POSTROUTING
Date: Fri, 20 Aug 2004 15:59:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408201559.49352.fred@gansevles.defamilie.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org
Cc: fred@gansevles.defamilie.nl

Hello,

First: I'm not subscribed to this list so please make sure that any reply is 
also sent to: fred@gansevles.defamilie.nl

I have a weird problem trying to setup multiple routes on my NAT-box

I have the following setup:

 <local network>  <NAT-box>
 [192.168.0.0/24]  eth0: 192.168.0.1
     eth1: <adsl.static.ip>
     tunl1: <tunnel to remote NAT-box via eth1>

The remote NAT-box can reach a special subnet which I want to connect to.
The special subnet is also reachable thru eth1, but I want the packages that 
reach the special subnet to be NAT-ted by the remote NAT-box

On my NAT-box I add the following route:

 ip route add <special.sub.net> dev tunl1

the relevant iptables rules are:
 iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.0 -o eth1 \
  -j SNAT --to-source <adsl.static.ip>
 iptables -t nat -A POSTROUTING -o tunl1 \
  -j SNAT --to-source <adsl.static.ip>

All messages originating from my NAT-box for the special subnet are routed 
through tunl1 and SNAT-ted by the second iptables rule

All messages originating from my local subnet for the special subnet are 
routed through tunl1 and *NOT* SNAT-ted by the second iptables rule (the 
packages never reach the POSTROUTING chain)

If I remove the special subnet route with:

 ip route del <special.sub.net> dev tunl1

then all messages originating from my local subnet for the special subnet are 
routed through eth1 and SNAT-ted by the first iptables rule

All messages originating from my NAT-box for the special subnet are directely 
routed through eth1 and *NOT* SNAT-ted (no matching rule for 
SRC=<adsl.static.ip>)

Summarizing: When I want to reach the special subnet using the remote NAT-box 
I can only do this *ON* the NAT-box and all machines in my local subnet cat 
*NOT REACH THE special subnet AT ALL*



Can anybody shed some light on this problem?
Please send relies to: fred@gansevles.defamilie.nl

