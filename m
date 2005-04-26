From: "Holger Brueckner [c]" <hb@ciphirelabs.com>
Subject: problem with conntrack loosing state [signed]
Date: Tue, 26 Apr 2005 18:36:35 +0200
Message-ID: <1114533395.2969.39.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

hello,

(please cc, i'm not a regular on the list)

we're experiencing some strange problems with the conntrack engine
loosing state. following setup:

fw with several interfaces
kernel 2.6.11.X
iptables v1.2.11 (debian)

all ips have a /32 netmask so that every traffic is routed through the
firewall. this is assured by corresponding vlan setup on the switches.

FORWARD is:
Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere            state
INVALID
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
.....
LOGDROP    all  --  anywhere             anywhere

eventually after a day or two pakets pakets which should be matched by
established coming in from the same interface as they go out will get
dropped and logged.

e.g.     srv1 --+-- fw -- srv3
         srv2 --|

"established" packet from srv1 to srv2 will get dropped after some days.
it looks like the syn flags don't trigger the conntrack engine although
the syn "pakets" go through the fw as expected, only pakets with no syn
flag set get dropped.
while this is the case the fw works perfectly for host which are not on
the same interface. so conntrack for connections from srv1 to srv3 or
srv2 to srv3 work as expected. rebooting the firewall is the only
solution to the problem.

there's not very much load on the server yet, last time i checked there
were about 250 conntrack entries. it looks like this might be realted to
Daniel Wittembergs "NAT stops working (more)" thread, at least the
symptoms are quite similar.

any suggestions to further debug this ? we just upgraded to 2.6.12-rc3
to see if this is solved. if not we will downgrade and see if this
happens again.

holger brueckner


-- 
---------------------[ Ciphire Signature ]----------------------
From: hb@ciphirelabs.com signed email body (1373 characters)
Date: on 26 April 2005 at 16:36:15 UTC
To:   netfilter@lists.netfilter.org
----------------------------------------------------------------
: Ciphire has secured this email against identity theft.
: Free download at www.ciphire.com. The garbled lines
: below are the sender's verifiable digital signature.
----------------------------------------------------------------
00fAAAAAEAAAD/bW5CXQUAAPsCAAIAAgACACDyIekZGJnmXEESCWWMu29LEN2zGD
L5vPj6PVwT2NKTZwEAD46rZXne6ITF8oprNxCs8q8OjlSBDfprdoflGwjALEyKpe
h9i85eLona6Se1WejNKCfRKCPNnqfIAy6On0t7qg==
------------------[ End Ciphire Signed Message ]----------------


