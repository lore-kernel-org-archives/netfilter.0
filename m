From: "Kyle Centers" <kcent@programmer.net>
Subject: MAC addresses and broadcast pings
Date: Mon, 24 Mar 2003 01:31:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030323173134.59731.qmail@mail.com>
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

Hi All,

I've been working for this for a while now, and don't realy know what to make of it:
The relevant parts of my firewall are as follows, from iptables-save, only edited for clarity:

:INPUT DROP
:FORWARD DROP
:OUTPUT ACCEPT
-A INPUT -m state --state ESTABLISHED -j ACCEPT
-A INPUT -i eth0 -m mac --mac 00:05:5D:FA:3B:50 -j ACCEPT
-A INPUT -i eth0 -m mac --mac 00:05:5D:4E:3C:C6 -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -m mac --mac 00:40:05:C7:04:DE -j ACCEPT
-A INPUT -j LOG --log-prefix "!!DROPPED PACKET!!"

So basic description here is, nothing is allowed, except established connections, and NIC's matching the listed MAC's. Oh and log every thing that isn't allowed. Finally, note that 00:40:05:C7:04:DE (ie the last matched MAC) is the MAC address of eth0, in the firewall itself.

So far so good. Problem is, that when I ping the broadcast address for my subnet (192.168.0.255), from the firewall machine, the firewall does not respond. If I ping the broadcast from any other machine who's MAC is matched in the firewall, the firewall machine responds, but if I ping the broadcast from the firewall itself, it doesn't respond.

When I check my /var/log/kern.log, I can see this (192.168.0.2 is the IP of the firewall):

Mar 23 12:02:24 ifrit kernel: !!DROPPED PACKET!!IN=eth0 OUT= MAC= SRC=192.168.0.2 DST=192.168.0.255 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=37639 SEQ=256

which tells me that my log rule works, and that the packet is at least traversing the INPUT chain. Furthermore, running 'tcpdump -ei eth0' while pinging the broadcast address from the firewall machine shows this:

12:13:00.134364 0:40:05:c7:4:de Broadcast ip 98: ifrit.wvnet.edu > 192.168.0.255: icmp: echo request (DF)
12:13:01.145071 0:40:05:c7:4:de Broadcast ip 98: ifrit.wvnet.edu > 192.168.0.255: icmp: echo request (DF)
12:13:02.146555 0:40:05:c7:4:de Broadcast ip 98: ifrit.wvnet.edu > 192.168.0.255: icmp: echo request (DF)

Which confirms that the ping packets at least have the correct MAC address. Yet, inexplicably, the packets are not being allowed through.

Am I missing something here? Is there something I'm overlooking that would explain why my firewall isn't matching broadcast pings that originate from itself?  Any assistance here would be greatly appreciated.

Thank you

Kyle Centers


-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup


