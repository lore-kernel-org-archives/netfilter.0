From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: iptables mangle & iproute
Date: Wed, 18 Dec 2002 08:41:28 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFFE760.1020204@inbox.lv>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NETFILTER <netfilter@lists.netfilter.org>

i all,
an extract of my rule tables...
40:     from all to 203.x.x.64/25 lookup TABLEa
40:     from all fwmark       40 lookup TABLEa
50:     from 203.x.x.0/24 lookup TABLEb

iptables mangles are as follows..
root@ICG:root# iptables -nvL -t mangle
Chain PREROUTING (policy ACCEPT 7995K packets, 2646M bytes)
  pkts bytes target     prot opt in     out     source destination
   85  6908 MARK       all  --  *      *       0.0.0.0/0 203.x.x.64/25 
MARK set 0x40

Chain INPUT (policy ACCEPT 526K packets, 252M bytes)
  pkts bytes target     prot opt in     out     source destination
     0     0 MARK       all  --  *      *       203.x.x.64/29 0.0.0.0/0 
          MARK set 0x40


im not able to find the problem for why i cant trace or ping to 
203.x.x.64/25 network and vice-versa.
i want to add that all forwading rule are there.. it was working when i 
didnt used _fwmark_ ..want to use fwmark for policy routing...
one last but not least things to ask is --> _marking_ based policy 
routing a good solution that one without _marking_  ???

thanking in advance...
A.H


