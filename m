From: Magnus Von Rosen <magnus.von.rosen@axis.com>
Subject: newbie problem? Compilation error:ll_proto.c:36: `ETH_P_ECHO' und
	eclared
Date: Wed, 15 May 2002 11:18:20 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB01341692@mailse01.axis.se>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Howdy,

Im working on a thesis and I'm learning Linux as I go along.
I tried to compile the 1.2.6a IPtables at my RedHat-machine with kernel 2.4.18.
I get the following message when running "make".

gcc -D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall -g -I../include-glibc -include ../include-glibc/glibc-bugs.h -I/usr/src/linux/include -I../include -DRESOLVE_HOSTNAMES   -c -o ll_proto.o ll_proto.c
ll_proto.c:36: `ETH_P_ECHO' undeclared here (not in a function)
ll_proto.c:36: initializer element is not constant
ll_proto.c:36: (near initialization for `llproto_names[1].id')
make[1]: *** [ll_proto.o] Error 1
make[1]: Leaving directory `/home/magnusvr/tmp/iproute2/lib'
make: *** [all] Error 2


Any help is appreciated. Thanks,

Magnus von Rosen, Sweden.
magnusvr@axis.com

