From: "Joao TERRA" <j_petrucci@terra.com.br>
Subject: Re: bytes counting
Date: Fri, 23 Apr 2004 14:22:20 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008501c42957$8b4895a0$6300a8c0@netsolutionsfort.com.br>
References: <086C43C9A9A1A541BFDFABCFDA05F58901448BAB@mailnew.tecnun.es>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

You can put the rule on:
#iptables -t mangle -I POSTROUTING -o INTERFACE_OF_192.168.0.50_SUBNET -d
192.168.0.50
then you can account in both directions separately
----- Original Message -----
From: "Arrizabalaga, Saioa" <sarrizabalaga@ceit.es>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 23, 2004 10:42 AM
Subject: bytes counting


Hello everyone,

I have been reading some mails in this listing and it is said the best
place to count bytes/packets is the mangle table, but I have a problem.

I have three network cards in my linux box: eth0 (private LAN), eth1
(private LAN) and eth2 (internet).

I would like to count the bytes/packets from/to 192.168.0.50 (it is in
eth0) that goes/comes to/from internet (eth2).

These are the rules I have:

iptables -A POSTROUTING -t mangle -o eth2 -s 192.168.0.50

With this rule I catch all the packets going from 192.168.0.50 to eth2,
but I know where to put the rule to catch the packets going from eth2 to
192.168.0.50, because as far as I can see it, when I put the rule:
iptables -A PREROUTING -t mangle -i eth2 -d 192.168.0.50 nothing is
caught because the packet has not been SNAT-ed yet. Am I wrong?

Any help would be appreciated.

Saioa Arrizabalaga





