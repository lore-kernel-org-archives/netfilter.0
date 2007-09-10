From: "Steve Finkelstein" <sf@stevefink.net>
Subject: Connection Marking and source routing woes
Date: Mon, 10 Sep 2007 11:17:13 -0400
Message-ID: <e9aa62150709100817s45aa8a15ke394b4c82a383172@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I just introduced a new 10Mbit/s line into my network, and I'm
severely rusty on iptables and experiencing some trouble setting up my
rules properly. I currently have three interfaces on my linux machine.
One is a trunk to a cisco 3560G switch, another is an interface facing
my T1 which is currently my default route for everything. The third
interface I connected today to a 10Mbit/s RCN leased line. What I'm
trying to do now is slowly move everything over to the 10Mbit/s line,
one VLAN at a time. I'd like to start with my wireless VLAN, which is
marked as VLAN 11. I understand that now I have to mangle packets
using iptables, which is fine, I've patched my kernel with the proper
code.

The following are my NAT and Mangle tables:

----

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:nat-out - [0:0]
#
#
# NAT for dmz/firewall/garage
-A PREROUTING -d OLD_IP -j DNAT --to-destination 10.8.10.100
# foo.example.org
-A PREROUTING -d OLD_IP2 -j DNAT --to-destination  10.8.20.2
-A POSTROUTING -j nat-out
# RCN T1, switching to 10Mbit/s
-A nat-out -d ! 10.8.0.0/16 -m mark --mark 0x2 -j SNAT --to-source
New_RCN_UseableIP
-A nat-out -s 10.8.10.0/24 -d ! 10.8.0.0/16 -j SNAT --to-source OLD_IP
-A nat-out -s 172.20.8.2/32 -d !  10.8.0.0/16 -j SNAT --to-source OLD_IP
-A nat-out -s 10.8.20.2/32 -d ! 10.8.0.0/16 -j SNAT --to-source OLD_IP
#
COMMIT
#
*mangle
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:mangle-newconn - [0:0]
:mangle-localconn - [0:0]
:mangle-policyroute - [0:0]
-A PREROUTING -m state --state NEW -j mangle-newconn
-A INPUT -m state --state NEW -j mangle-newconn
-A OUTPUT -m state --state NEW -j mangle-localconn
-A POSTROUTING -m connmark --mark 0 -m state --state NEW -j mangle-policyroute
-A POSTROUTING -m connmark --mark 1 -j MARK --set-mark 1
-A POSTROUTING -m connmark --mark 2 -j MARK --set-mark 2
-A POSTROUTING -m mark --mark 2 -j ROUTE --gw RCN_GW_IP --oif eth2 --continue
-A mangle-newconn -i eth2 -j CONNMARK --set-mark 2
-A mangle-localconn -s  76.8.67.250 -j CONNMARK --set-mark 2
-A mangle-policyroute -d 10.8.0.0/16 -j CONNMARK --set-mark 0
-A mangle-policyroute -s  10.8.11.0/24 -j CONNMARK --set-mark 2
-A mangle-policyroute -s 10.8.14.0/24 -j CONNMARK --set-mark 2
#
COMMIT

-- snip --

If anyone can help me look into this, I'd really appreciate it.

If I'm not providing enough details about my network or setup, please
do reply and I'll make it available.

- sf

