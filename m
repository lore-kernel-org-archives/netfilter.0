From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: time match: build errors with kernel 2.6.21
Date: Tue, 29 May 2007 06:11:46 -0400
Message-ID: <osun53dmddsubdnjb6492ceq4buai332pk@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

I'm trying to build kernel 2.6.21 with the time match patch.  The build
fails as follows:

  CC [M]  net/ipv4/netfilter/ipt_time.o
net/ipv4/netfilter/ipt_time.c: In function 'init':
net/ipv4/netfilter/ipt_time.c:142: warning: implicit declaration of
function 'ipt_register_match'
net/ipv4/netfilter/ipt_time.c: In function 'fini':
net/ipv4/netfilter/ipt_time.c:147: warning: implicit declaration of
function 'ipt_unregister_match'

<snip>

  Building modules, stage 2.
  MODPOST 253 modules
WARNING: "ipt_register_match" [net/ipv4/netfilter/ipt_time.ko] undefined!
WARNING: "ipt_unregister_match" [net/ipv4/netfilter/ipt_time.ko] undefined!
make[2]: *** [__modpost] Error 1

Any help would be appreciated.

Thanks,
Andrew.


