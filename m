From: "Ezsra McDonald" <ezsra.mcdonald@gmail.com>
Subject: out of state packits
Date: Fri, 3 Mar 2006 08:39:30 -0600
Message-ID: <10bc97fe0603030639w5a135f9breace8cc43d05c20b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Greetings Gurus,

I have noticed in the past few weeks that my logs
from several hosts show what appear to be rejections on high ports. I
have seen this before on a checkpoint firewall where the issue was out
of state packits. What would cause this on a network? I don't know
where to start looking for the problem.

Any ideas?

Here is an example of one of my logwatch report:


Denied 4690 packets on interface eth0
   From 4.79.181.14 - 3 packets
      To 172.25.14.167 - 3 packets
         Service: 4980 (tcp/4980) (RULE 7 -- DENY,eth0,none) - 3 packets
   From 4.79.181.135 - 8 packets
      To 172.25.14.167 - 8 packets
         Service: 56322 (tcp/56322) (RULE 7 -- DENY,eth0,none) - 6 packets
         Service: 65382 (tcp/65382) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 12.30.97.45 - 6 packets
      To 172.25.14.167 - 6 packets
         Service: 2697 (tcp/2697) (RULE 7 -- DENY,eth0,none) - 6 packets
   From 64.12.138.89 - 2 packets
      To 172.25.14.167 - 2 packets
         Service: 3039 (tcp/3039) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 64.123.125.242 - 2 packets
      To 172.25.14.167 - 2 packets
         Service: 6818 (tcp/6818) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 65.164.125.251 - 5 packets
      To 172.25.14.167 - 5 packets
         Service: 5686 (tcp/5686) (RULE 7 -- DENY,eth0,none) - 3 packets
         Service: 55569 (tcp/55569) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 65.174.231.18 - 3 packets
      To 172.25.14.167 - 3 packets
         Service: 65533 (tcp/65533) (RULE 7 -- DENY,eth0,none) - 3 packets
   From 66.210.76.179 - 2 packets
      To 172.25.14.167 - 2 packets
         Service: 62944 (tcp/62944) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 68.98.201.147 - 6 packets
      To 172.25.14.167 - 6 packets
         Service: 53706 (tcp/53706) (RULE 7 -- DENY,eth0,none) - 6 packets
   From 68.99.115.15 - 2 packets
      To 172.25.14.167 - 2 packets
         Service: 7369 (tcp/7369) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 68.227.180.134 - 19 packets
      To 172.25.14.167 - 19 packets
         Service: 3998 (tcp/3998) (RULE 7 -- DENY,eth0,none) - 3 packets
         Service: 4192 (tcp/4192) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 6003 (tcp/6003) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 6395 (tcp/6395) (RULE 7 -- DENY,eth0,none) - 3 packets
         Service: 13573 (tcp/13573) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 51164 (tcp/51164) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 60957 (tcp/60957) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 62797 (tcp/62797) (RULE 7 -- DENY,eth0,none) - 3 packets
   From 69.150.96.2 - 3 packets
      To 172.25.14.167 - 3 packets
         Service: 53390 (tcp/53390) (RULE 7 -- DENY,eth0,none) - 3 packets
   From 70.182.232.7 - 13 packets
      To 172.25.14.167 - 13 packets
         Service: 2778 (tcp/2778) (RULE 7 -- DENY,eth0,none) - 3 packets
         Service: 3432 (tcp/3432) (RULE 7 -- DENY,eth0,none) - 3 packets
         Service: 4759 (tcp/4759) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 13563 (tcp/13563) (RULE 7 -- DENY,eth0,none) - 3 packets
         Service: 50581 (tcp/50581) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 70.239.241.132 - 6 packets
      To 172.25.14.167 - 6 packets
         Service: 59198 (tcp/59198) (RULE 7 -- DENY,eth0,none) - 6 packets
   From 161.200.192.6 - 6 packets
      To 172.25.14.167 - 6 packets
         Service: 5501 (tcp/5501) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 7993 (tcp/7993) (RULE 7 -- DENY,eth0,none) - 2 packets
         Service: 41972 (tcp/41972) (RULE 7 -- DENY,eth0,none) - 2 packets
   From 163.191.231.2 - 6 packets
      To 172.25.14.167 - 6 packets
         Service: 63151 (tcp/63151) (RULE 7 -- DENY,eth0,none) - 6 packets
   From 165.176.32.18 - 21 packets
      To 172.25.14.167 - 21 packets
         Service: 3273 (tcp/3273) (RULE 7 -- DENY,eth0,none) - 7 packets
         Service: 49558 (tcp/49558) (RULE 7 -- DENY,eth0,none) - 7 packets
         Service: 52479 (tcp/52479) (RULE 7 -- DENY,eth0,none) - 7 packets
   From 165.201.28.130 - 8 packets
      To 172.25.14.167 - 8 packets
         Service: 63546 (tcp/63546) (RULE 7 -- DENY,eth0,none) - 8 packets
   From 165.201.68.65 - 5 packets
      To 172.25.14.167 - 5 packets
         Service: 1228 (tcp/1228) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 7980 (tcp/7980) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 12866 (tcp/12866) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 14314 (tcp/14314) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 48521 (tcp/48521) (RULE 7 -- DENY,eth0,none) - 1 packet
   From 165.201.180.70 - 2 packets
      To 172.25.14.167 - 2 packets
         Service: 61988 (tcp/61988) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 63754 (tcp/63754) (RULE 7 -- DENY,eth0,none) - 1 packet
   From 172.25.14.20 - 5 packets
      To 172.25.14.167 - 5 packets
         Service: 48065 (udp/48065) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 49890 (udp/49890) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 50930 (udp/50930) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 54123 (udp/54123) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 55647 (udp/55647) (RULE 7 -- DENY,eth0,none) - 1 packet
   From 172.25.14.170 - 1440 packets
      To 172.25.14.167 - 1440 packets
         Service: 16192 (udp/16192) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16231 (udp/16231) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16387 (udp/16387) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16419 (udp/16419) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16451 (udp/16451) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16469 (udp/16469) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 16487 (udp/16487) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 16491 (udp/16491) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 16603 (udp/16603) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16831 (udp/16831) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16832 (udp/16832) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16834 (udp/16834) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16890 (udp/16890) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16908 (udp/16908) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16947 (udp/16947) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 16948 (udp/16948) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 16955 (udp/16955) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 16959 (udp/16959) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 16976 (udp/16976) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 16988 (udp/16988) (RULE 7 -- DENY,eth0,none) - 4 packets
         Service: 17017 (udp/17017) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17068 (udp/17068) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17069 (udp/17069) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17079 (udp/17079) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17080 (udp/17080) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17083 (udp/17083) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17084 (udp/17084) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17085 (udp/17085) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17088 (udp/17088) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17164 (udp/17164) (RULE 7 -- DENY,eth0,none) - 1 packet
         Service: 17180 (udp/17180) (RULE 7 -- DENY,eth0,none) - 1 packet

 And on it goes.

