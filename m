From: Oumer Teyeb <oumer@cpk.auc.dk>
Subject: libipq with pthreads
Date: Mon, 26 May 2003 08:34:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ED1B592.7060308@cpk.auc.dk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I have a libipq program that compiles perfectly with this

gcc -g -Wall -Wunused -DNETFILTER_VERSION=\"1.2.7\" -rdynamic -o test 
test.c /usr/local/lib/iptables.o /usr/local/lib/libiptc.a -ldl -lipq

and I wanted to put multithreading features on it and in my system I run 
pthread programs as

gcc  -D_POSIX_C_SOURCE=199056 -D_REENTRANT -ansi -lpthread -o 
test_thread test_thread.c

so I put some pthread functionality in my original pthread program and 
tried to compile with the following

gcc -g -Wall -Wunused -DNETFILTER_VERSION=\"1.2.7\" 
-D_POSIX_C_SOURCE=199056 -D_REENTRANT -ansi -rdynamic -o test test.c 
/usr/local/lib/iptables.o /usr/local/lib/libiptc.a -ldl -lipq -lpthread

but this time I get the error:

 >In file included from /usr/local/include/libipq.h:37
 >from test.c: 2:
 >/usr/include/linux/netfilter_ipv4/ip_queue.h:27: 'IFNAMSIZ' undeclared 
here (not a function)
 >/usr/include/linux/netfilter_ipv4/ip_queue.h:28: 'IFNAMSIZ' undeclared 
here (not a function)
 >/usr/include/linux/netfilter_ipv4/ip_queue.h:35: confused by earlier 
errors, bailing out

I think the problem is with some order of library binding, but I 
couldn't figure it (I tried to link one library before the other and the 
like).
What is wrong?









