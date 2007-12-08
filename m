From: "msn" <msn@vtopia.co.kr>
Subject: Completely DROP for UDP packets.
Date: Sun, 9 Dec 2007 04:39:06 +0900 (KST)
Message-ID: <1368.121.163.60.159.1197142746.squirrel@211.111.194.2>
Reply-To: msn@vtopia.co.kr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, I'm trying to dropping all UDP packets from specific address
but it still has higher CPU usages. anyone has ideas for this
issues ? here's example

A   --+--->  F
B   --+
C   --+

A/B/C sending massive UDP packets to F, also it has address dropping
rules fro A/B/C. Yes, it is works fine. But if i see the CPU usages
of 'F' some of cases it is using more than 20-30% when its(A/B/C)
sending 100M to F. is there any best way to decreasing the CPU usage
of the 'F' ? thanks in advance.

Cheers.

P.S :
1. INPUT filter dropping very higher CPU usages
2. TARPIT and prestate PREROUTING dropping less higher but not satisfied.



