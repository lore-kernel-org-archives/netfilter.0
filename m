From: "Landon Chelf" <landonc@starrobbins.com>
Subject: Multi NIC Gateway and HostAP Box
Date: Fri, 15 Aug 2003 14:32:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006b01c3635b$a7d0ab30$6901a8c0@Station13>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I've been working on getting HostAP up an running on my redhat 9 box.  I
can see my access point from other wireless clients but I can't seem to
get inet access through hostap.  I know it has something to do with
iptables and I'm not an iptables guru or anything.  

Ok here is my setup:
Eth0 = Internet
Eth1 = Private Net1
Wlan0 = Access Point

I can access the internet locally fine but I can't access it from the
wireless clients.  Below is what I currently have as my iptables setup.
Thanx to anyone who can help me get this up.

*filter

:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

# Accept all traffic from the loopback interface.
-A INPUT -i lo -j ACCEPT

# Accept legitimate responses to traffic we generate.
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow inbound DNS requests from the wireless network.
-A INPUT -s 0/0 -p udp --dport 53 -j ACCEPT
-A INPUT -s 0/0 -p tcp --dport 53 -j ACCEPT

# Allow inbound DHCP from the Local wireless network
-A INPUT -i wlan0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# Allow all traffic from the LAN to be forwarded to the WLAN. 
-A FORWARD -i eth0 -o wlan0 -j ACCEPT

# Forward all legitimate responses to forwarded traffic.
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

------------------------------------------------

Sincerely,
Landon


