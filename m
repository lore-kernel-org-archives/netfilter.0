From: Matton <Matton@tele2allin.be>
Subject: match time & kernel 2.6.22.5
Date: Sat, 25 Aug 2007 11:58:57 +0200
Message-ID: <1188035937.46cffd61754e5@www.versateladsl.be>
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
To: netfilter list <netfilter@lists.netfilter.org>

Hi all,

I want to add the match time.
I apply the last snapshot with this patch ( patch-o-matic-ng-20060702)

The compilation stop after with this errors:

make modules
.../...
...
net/ipv4/netfilter/ipt_time.c: In function 'match':
net/ipv4/netfilter/ipt_time.c:60: error: 'ktime_t' has no member named
'off_sec'
net/ipv4/netfilter/ipt_time.c:64: error: 'ktime_t' has no member named
'off_sec'
net/ipv4/netfilter/ipt_time.c:64: error: 'ktime_t' has no member named
'off_sec'
net/ipv4/netfilter/ipt_time.c:68: error: 'ktime_t' has no member named
'off_sec'
net/ipv4/netfilter/ipt_time.c: At top level:
net/ipv4/netfilter/ipt_time.c:116: warning: initialization from incompatible
pointer type
net/ipv4/netfilter/ipt_time.c:117: warning: initialization from incompatible
pointer type
net/ipv4/netfilter/ipt_time.c: In function 'init':
net/ipv4/netfilter/ipt_time.c:124: warning: implicit declaration of function
'ipt_register_match'
net/ipv4/netfilter/ipt_time.c: In function 'fini':
net/ipv4/netfilter/ipt_time.c:129: warning: implicit declaration of function
'ipt_unregister_match'
make[3]: *** [net/ipv4/netfilter/ipt_time.o] Error 1


This kernel is linux-2.6.22.5.
This the same with kernel source for FC6.

Where is the mistake ?

Thanks for help-- 
Famille Matton
Moreremanslaan, 48C
B-1700 Dilbeek

