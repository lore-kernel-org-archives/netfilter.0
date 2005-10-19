From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: compiling ip_set_iptree.o ( and other netfiler patches )
Date: Wed, 19 Oct 2005 11:19:45 +0800
Message-ID: <017001c5d45b$f649c7b0$0100a8c0@newlife>
References: <00e501c5d395$0cb95eb0$0100a8c0@newlife>
	<Pine.LNX.4.58.0510181516400.5575@blackhole.kfki.hu>
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

From: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
> 
> That's due to a backward compatibility issue - I tested the code on
> 2.6.12.x and - as you wrote - you try to use ipset on 2.6.11.x. Please use
> the attached patch which takes care of it.
> 

As it turns out, I tried with kernel 2.6.12.6, gcc 3.4.3, it is the smoothest 
compile of all, the (edited ) messsages I got are :-

  CC [M]  net/ipv4/netfilter/ip_nat_sip.o
net/ipv4/netfilter/ip_nat_sip.c: In function `ip_nat_sip':
net/ipv4/netfilter/ip_nat_sip.c:99: warning: ISO C90 forbids mixed declarations
and code
  CC [M]  net/ipv4/netfilter/ip_conntrack_h323_core.o
  CC [M]  net/ipv4/netfilter/ip_conntrack_h323_h225.o
  CC [M]  net/ipv4/netfilter/ip_conntrack_h323_h245.o
  CC [M]  net/ipv4/netfilter/ip_nat_h323.o
  CC [M]  net/ipv4/netfilter/ip_conntrack_proto_gre.o
  CC [M]  net/ipv4/netfilter/ip_nat_proto_gre.o
  CC [M]  net/ipv4/netfilter/ip_conntrack_proto_sctp.o
  CC [M]  net/ipv4/netfilter/ip_conntrack_quake3.o
  CC [M]  net/ipv4/netfilter/ip_conntrack_pptp.o
net/ipv4/netfilter/ip_conntrack_pptp.c: In function `timeout_ct_or_exp':
net/ipv4/netfilter/ip_conntrack_pptp.c:159: warning: implicit declaration of
ction `__ip_conntrack_expect_find'
net/ipv4/netfilter/ip_conntrack_pptp.c:159: warning: assignment makes pointe
om integer without a cast
  CC [M]  net/ipv4/netfilter/ip_nat_pptp.o
  ......
  CC [M]  net/ipv4/netfilter/ip_set.o
net/ipv4/netfilter/ip_set.c: In function `ip_set_sockfn_get':
net/ipv4/netfilter/ip_set.c:1906: warning: ignoring return value of `copy_to_user', declared with attribute warn_unused_result
  CC [M]  net/ipv4/netfilter/ip_set_ipmap.o
  CC [M]  net/ipv4/netfilter/ip_set_portmap.o
  CC [M]  net/ipv4/netfilter/ip_set_macipmap.o
  CC [M]  net/ipv4/netfilter/ip_set_iphash.o
  CC [M]  net/ipv4/netfilter/ip_set_nethash.o
  CC [M]  net/ipv4/netfilter/ip_set_ipporthash.o
  CC [M]  net/ipv4/netfilter/ip_set_iptree.o
  LD [M]  net/ipv4/netfilter/ip_conntrack_h323.o
 
So conclusion is 2.6.11.x and 2.6.13.x are no good with respect to patch-o-matic-ng !

Cheers.





