From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: Problem Compiling iptables 1.2.7a
Date: Thu, 28 Nov 2002 09:32:19 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211280927570.1994-100000@ts1.alberni.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have applied the patch-o-matic patches to a fresh copy of the 2.4.19
kernel.  A few patches didn't go through, but nothing major.  I compiled the
kernel, and that went without a hitch.  Now I go to compile the iptables
binary and libraries and this is what I get:

cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_ah_sh.o -c
extensions/libipt_ah.c
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c
extensions/libipt_conntrack.c
In file included from
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:64,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:6: #error
Only in kernel.
In file included from
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:64,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:130: warning: 	N_CLASSA' redefined
/usr/include/netinet/in.h:145: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:136: warning: 	N_CLASSB' redefined
/usr/include/netinet/in.h:151: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:142: warning: 	N_CLASSC' redefined
/usr/include/netinet/in.h:157: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:147: warning: 	N_CLASSD' redefined
/usr/include/netinet/in.h:162: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:151: warning: 	N_EXPERIMENTAL' redefined
/usr/include/netinet/in.h:165: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:152: warning: 	N_BADCLASS' redefined
/usr/include/netinet/in.h:166: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:155: warning: 	NADDR_ANY' redefined
/usr/include/netinet/in.h:169: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:158: warning: 	NADDR_BROADCAST' redefined
/usr/include/netinet/in.h:171: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:161: warning: 	NADDR_NONE' redefined
/usr/include/netinet/in.h:173: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:167: warning: 	NADDR_LOOPBACK' redefined
/usr/include/netinet/in.h:179: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:171: warning: 	NADDR_UNSPEC_GROUP' redefined
/usr/include/netinet/in.h:183: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:172: warning:         NADDR_ALLHOSTS_GROUP' redefined
/usr/include/netinet/in.h:184: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:173: warning: 	NADDR_ALLRTRS_GROUP' redefined
/usr/include/netinet/in.h:185: warning: this is the location of the previous definition
/usr/src/linux/include/linux/in.h:174: warning:         NADDR_MAX_LOCAL_GROUP' redefined
/usr/include/netinet/in.h:186: warning: this is the location of the previous definition
In file included from
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:65,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_rsh.h:16: #error
Only in kernel.
make: *** [extensions/libipt_conntrack_sh.o] Error 1

Compiling iptables is getting to be a right pain.  I can't use the existing
kernel (2.4.9) because patch-o-matic can apply barely any patches, and none
of the ones that it does apply are ones that I need.  It is suggested I
downgrade to 2.4.19, so I do that, and after much woe, figure that it must
be the iptables binary and its libraries.  Following the instructions on the
netfilter.org site doesn't get me very far.  Is there an easy way to do
this, or does everybody have these sorts of problems?

-- 
Aaron Clausen


