From: suneel cumar <suneelcumar@yahoo.com>
Subject: patch-o-matic error while comipling for pptp
Date: Mon, 29 Aug 2005 22:15:16 -0700 (PDT)
Message-ID: <20050830051516.46883.qmail@web90101.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi All,

i was try to patch nat_pptp for allowing more pptp
connection out to pptp server.


On compiling using patch-o-matic latest package 
patch-o-matic-ng-20050610 for 
ip_nat_proto_gre
ip_nat_pptp

i started patching with extra option

./runme --extra

On selecting the package it found following error.


unable to find ladd slot in src
/usr/src/linux-2.6.5-1.358/net/ipv4/netfilter/Makefile
(./pptp-conntrack-nat/linux-2.6/./net/ipv4/netfilter/Makefile.ladd)

Let guru's guide me configuring it successfully.


Regards,
Suneel






		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 

