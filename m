From: "hard__ware" <hard__ware@hotmail.com>
Subject: ipt_iplimit - IPtables 1.2.7a - Kernel 2.4.18 Issue Resolved
Date: Sun, 29 Sep 2002 21:18:24 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE29obC32qU4Z5flHgS00004b68@hotmail.com>
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

Hello Eveyone .. :D

just been doing alot of kernel patching / hacking lately with Netfilter , (i
luv it :-D ).

I found that with iptables 1.2.7a  Tar.gz & the Patch-o-matic for it, that
when you include

the ipt_iplimit Extension (Info at
http://www.netfilter.org/documentation/pomlist/pom-base.html#iplimit )

When using this on a RH 7.3 system with a custom 2.4.18-10 kernel i found
that the Module compiles with insmod erros becuase of an unresloved symbol
..

went for a bit of google to find to many differnet patchs on this subjct so
i decided to do it myself,,,

To my amusment it actually worked ? ( what i broke im not sure, but it works
great fo me. )
may require a little rule tweaking in your firewall script to get it working
well.

here is what i included to the Redhat 7.3  Kernel 2.4.18-10 Source before a
Re-Compile..

-------------------------------------------
+ ~src/linux-2.4/net/ipv4/netfilter/Makefile
+++
+ O_TARGET := netfilter.o
-+ M_OPJS := ipt_iplimit.o

#### here is what is used to be ####
---
- O_TARGET := netfilter.o
-
---------------end of patch---------------

---------This one goes near of file--------
+ ~src/linux-2.4/net/ipv4/netfilter/ip_conntrack_standalone.c
+++
+EXPORT_SYMBOL(ip_conntrack_expected_related);
+EXPORT_SYMBOL(ip_conntrack_unexpected_related);
-+EXPORT_SYMBOL(ip_conntrack_find_get);
+EXPORT_SYMBOL(ip_conntrack_tuple_taken);

---
-EXPORT_SYMBOL(ip_conntrack_expected_related);
-EXPORT_SYMBOL(ip_conntrack_unexpected_related);
-EXPORT_SYMBOL(ip_conntrack_tuple_taken);
--------------------EOP-------------------

Now Make sure you re-do your Kernel Config...

#### In the Netfilter section it will come up with a (NEW)
#### ipt_iplimit select (m) or yes and compile it in.. :D
### Run the following from your Kernel SRC Dir  ####
###   For you first time newb's plz run /> make mrproper # First, Thanks #

make config

### This next one cleans out any other build we preformed previously ###
make clean

### Now here's a real nice one. Sick of two many connetions being tracked by
netfilter that are not even ### being used or conntrack's that didnt recive
a CLOSE or FIN message, this way you can lower the ### default Time To Tive
for TCP connection tracking while using NetFilter / Iptables.  Try setting
the
### time value's in this lower,  Expecially the one that Says 5 Bloody Days
???? What Tha ??? ---->
###  --- 5 DAYS, /* TCP_CONNTRACK_ESTABLISHED, */

+++
here is what is did to my test box, ( Dual PIII 866 1024 MB SDRAM 2.4.18-10
SMP Custom)
+++
+ ~src/linux-2.4/net/ipv4/netfilter/ip_conntrack_proto_tcp.c

= { 30 MINS,  /* TCP_CONNTRACK_NONE, */
    30 MINS, /* TCP_CONNTRACK_ESTABLISHED, */
    2 MINS, /* TCP_CONNTRACK_SYN_SENT, */
    60 SECS, /* TCP_CONNTRACK_SYN_RECV, */
    2 MINS, /* TCP_CONNTRACK_FIN_WAIT, */
    1 MINS, /* TCP_CONNTRACK_TIME_WAIT, */
    12 SECS, /* TCP_CONNTRACK_CLOSE, */
    1 MINS, /* TCP_CONNTRACK_CLOSE_WAIT, */
    60 SECS, /* TCP_CONNTRACK_LAST_ACK, */
    2 MINS, /* TCP_CONNTRACK_LISTEN, */
};
------------------------EOP-----------------------------

#### now we can continue on with our mission ..#####

make dep
make bzImage
make modules
make modules_install

#### and if all goes well (like my Dual P3) it compiles with no errors and
you wont gets Insmod errors ect


....

anyway let me know what yas think :D

catch ya

Hard__warE

{the void has struck}








