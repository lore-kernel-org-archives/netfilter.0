From: Jiri Popelka <jpopelka@redhat.com>
Subject: conntrack thinks that ICMPv6 Echo reply to ICMPv6 Echo request sent
 to IPv6 multicast address is INVALID
Date: Fri, 23 Mar 2012 19:07:06 +0100
Message-ID: <4F6CBBCA.6010106@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

1) I have two virtual machines with interfaces on the same link:
A) fe80::5054:ff:fe09:e0b9/64
B) fe80::5054:ff:fe80:d951/64

2) I set up IPv6 packet filter on A with ip6tables:
# ip6tables -F
# ip6tables -A INPUT -m conntrack --ctstate INVALID -j REJECT 
--reject-with icmp6-adm-prohibited
# ip6tables -A INPUT -p ipv6-icmp -j ACCEPT
# ip6tables -A INPUT -j REJECT --reject-with icmp6-adm-prohibited

3) ping6 B from A:
# ping6 -I eth2 fe80::5054:ff:fe80:d951
PING fe80::5054:ff:fe80:d951(fe80::5054:ff:fe80:d951) from
fe80::5054:ff:fe09:e0b9 eth2: 56 data bytes
64 bytes from fe80::5054:ff:fe80:d951: icmp_seq=1 ttl=64 time=0.265 ms
<OK>

4) ping6 'all nodes' from A:
# ping6 -I eth2 ff02::1
PING ff02::1(ff02::1) from fe80::5054:ff:fe09:e0b9 eth2: 56 data bytes
<no response, reply is rejected>

5) remove the first line from ip6tables
# ip6tables -D INPUT 1

6) ping6 'all nodes' from A:
# ping6 -I eth2 ff02::1
PING ff02::1(ff02::1) from fe80::5054:ff:fe09:e0b9 eth2: 56 data bytes
64 bytes from fe80::5054:ff:fe09:e0b9: icmp_seq=1 ttl=64 time=0.072 ms
64 bytes from fe80::5054:ff:fe80:d951: icmp_seq=1 ttl=64 time=0.318 ms 
(DUP!)
<OK>

I see this with kernels 2.6.32 and 3.3.0.
Is it a known bug or my misunderstanding ?

thanks
-- 
Jiri
