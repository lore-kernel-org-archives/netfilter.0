From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: DNAT iptables :o)
Date: Sat, 11 Oct 2003 12:52:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOOEKKCCAA.markee@bandwidthco.com>
References: <A59F9B5C2A83424F9A8679E1BAB3E56610DCAB@exchange.zoodomain.org>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A59F9B5C2A83424F9A8679E1BAB3E56610DCAB@exchange.zoodomain.org>
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
To: Slav Rilov <Slav.Rilov@Zoo.org>, netfilter@lists.netfilter.org

Do you have "/proc/sys/net/ipv4/ip_forward" set to 1?

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Slav Rilov
Sent: Friday, October 10, 2003 4:08 PM
To: netfilter@lists.netfilter.org
Subject: DNAT iptables :o)


I have Red Hat intalled, with minimum pakets option:
I am building dual host: eth1 - external, eth0(10.10.1.1 255.255.0.0) -
internal interface
I just want the packet to hit eth0 for testing, but it never dose
I am running the folowing script:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -t nat -A PREROUTING -i eth1 -j DNAT --to-destination 10.10.1.1
iptables -A INPUT -i eth0 -j ACCEPT
iptables -A INPUT -i eth1 -j ACCEPT

I have log that tracks pakets and I see that packet arrives, then it
destination addresses changes to 10.10.1.1 and hits eth1 instead of eth0 and
stops, never gets to eth0

Please help me
Slav



