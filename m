From: lukasz <kukems@pf.pl>
Subject: problem with marks in filter table
Date: Fri, 21 May 2004 10:20:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405211020.15279.kukems@pf.pl>
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

iptables -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark

iptables -t mangle -A PREROUTING -p tcp -m mark ! --mark 0 -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp -m ipp2p --ipp2p -j MARK \
 --set-mark 1

iptables -t mangle -A PREROUTING -p tcp -m mark ! --mark 0 -j CONNMARK\ 
--save-mark

Hi i`m using above configuration to mark my ipp2p traffic. and it works fine.

iptables -t mangle -L -v

Chain PREROUTING (policy ACCEPT 641K packets, 450M bytes)
 pkts bytes target     prot opt in     out     source               
destination
  549  141K CONNMARK   tcp  --  any    any     anywhere             anywhere            
CONNMARK restore
   68  8351 ACCEPT     tcp  --  any    any     anywhere             anywhere            
MARK match !0x0
   19  9409 MARK       tcp  --  any    any     anywhere             anywhere            
ipp2p v0.5c --ipp2p MARK set 0x1
   19  9409 CONNMARK   tcp  --  any    any     anywhere             anywhere            
MARK match !0x0 CONNMARK save

 Up to here everything is ok.
But i want to accept marked packages trough filter table matching marked 
packages, and it does`nt work:

iptables -A FORWARD -p tcp -j ACCEPT -m mark --mark 1

iptables -A FORWARD -j DROP -s 192.168.9.0/24 -d 0/0
iptables -A FORWARD -j DROP -d 192.168.9.0/24 -s 0/0


