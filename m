From: "Rajesh B. V." <rajeshbv@intotoinc.com>
Subject: Problem with MASQUERADE of L2TP packets
Date: Thu, 13 Nov 2003 16:28:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.0.20031113162745.01ae15e8@172.16.1.10>
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

Hi All,

I am facing a problem in sending traffic through L2TP tunnel using Linux 
iptables MASQUERADE feature.
SG1 in following setup is having iptables with MASQUERADE. The rule is:

# iptables -t nat -A POSTROUTING -j MASQUERADE -o ppp0

Test set-up:

192.168.1.82 192.168.1.254
LAN PC ----------------- SG 1 ( LAC Mode ) --------------- SG2 ( LNS Mode )
172.16.3.83 172.16.3.73
6.6.6.7 ---- l2tp tunnel ---- 6.6.6.6

After estabilshing the L2TP tunnel, when we issue ping from LAN PC 
(192.168.1.82) to LNS IP address (6.6.6.6) we observe the packets sent out 
by SG1 having strange Source IP in both inner and outer IP header.
# ping 6.6.6.6 (from 192.168.1.82)

Problem:
The outer IP header is having the source IP as 6.7.1.254 (last two octets 
of PPP IP + last two octets of ethernet IP).
And the inner IP header (PPP) is having source as 6.6.6.7 instead of 
192.168.1.82 (actual packet originator).

If i disable the iptables rule with MASQUERADE then the traffic is going fine.

Can anyone suggest, what is the mistake in configuration or is it the 
problem with L2TP itself ?

Regards,
--Rajesh


