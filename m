From: <skmail@mcewen.wcnet.org>
Subject: string patch-o-matic patch compile problem
Date: Mon, 17 Jun 2002 11:53:13 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206171151260.8743-100000@mcewen.wcnet.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi all-

I'm trying to patch a stock 2.4.18 kernel with a few extras from the
current patch-o-matic.  The only one that seems to have trouble so far
(kernel compile in progress) is the string match support.  Here is the
output of my kernel compile.  Can somebody help?  TIA

gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   
-DKBUILD_BASENAME=ipt_limit  -c -o ipt_limit.o ipt_limit.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   -DKBUILD_BASENAME=ipt_mac  
-c -o ipt_mac.o ipt_mac.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   
-DKBUILD_BASENAME=ipt_multiport  -c -o ipt_multiport.o ipt_multiport.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   
-DKBUILD_BASENAME=ipt_time  -c -o ipt_time.o ipt_time.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   
-DKBUILD_BASENAME=ipt_state  -c -o ipt_state.o ipt_state.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   
-DKBUILD_BASENAME=ipt_iplimit  -c -o ipt_iplimit.o ipt_iplimit.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   
-DKBUILD_BASENAME=ipt_unclean  -c -o ipt_unclean.o ipt_unclean.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i486   
-DKBUILD_BASENAME=ipt_string  -c -o ipt_string.o ipt_string.c
ipt_string.c:80:72: macro "max" passed 3 arguments, but takes just 2
ipt_string.c: In function `search_sublinear':
ipt_string.c:53: warning: subscript has type `char'
ipt_string.c:78: warning: subscript has type `char'
ipt_string.c:80: `max' undeclared (first use in this function)
ipt_string.c:80: (Each undeclared identifier is reported only once
ipt_string.c:80: for each function it appears in.)
make[3]: *** [ipt_string.o] Error 1
make[3]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[1]: *** [_subdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux/net'
make: *** [_dir_net] Error 2






