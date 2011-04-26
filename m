From: Ricky Huang <rhhuang@soe.ucsd.edu>
Subject: Using NFQUEUE rule on INPUT but yet still receiving packets on OUTPUT
Date: Mon, 25 Apr 2011 18:01:36 -0700
Message-ID: <C6AF76D8-2438-4BB1-9677-A598E5D62200@soe.ucsd.edu>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi all,

I am trying to write a userspace packet manipulator using libnetfilter_=
queue and ran into this problem: after compiling nfqnl_test.c and added=
 the following ICMP rule to iptables 'iptables -A INPUT -s 0/0 -p ICMP =
-j NFQUEUE',  so no my table looks like:
"
Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20
NFQUEUE    icmp --  anywhere             anywhere            NFQUEUE nu=
m 0

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
"

the callback in nfqnl_test.c fires regardless the machine is SENDING or=
 RECEIVING PINGs.

I thought the rule 'iptables -A INPUT=85" hooks NFQUEUE to the INPUT ch=
ain, meaning *only* the incoming ICMP packets get queued.  And when I P=
ING /from/ the machine, it should go only go through OUTPUT chain (and =
subsequently POSTROUTING chain).


So why would the callback in nfqnl_test.c get called on both incoming a=
nd outgoing PINGs?  Am I having some fundamental misunderstanding of th=
e iptable rules?