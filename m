From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Compile problems with iptables 1.2.7
Date: Tue, 01 Oct 2002 20:13:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D99E5AF.8020805@fugmann.dhs.org>
References: <B0A500E93795D311AD4300A0C9A98F4801610ABD@lara.epiuse.co.za>
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
To: Dian Brits <dian.brits@epiuse.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Dian Brits wrote:
> ok i've tried using 1.2.7a but i still get this:
> 
> kagisofw:/usr/local/iptables/src/iptables-1.2.7a $ /kernel/src/linux
> <
> Extensions found:
> cc -O2 -Wall -Wunused -I/usr/local/kernel/src/linux/include -Iinclude/
> -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c
> extensions/libipt_conntrack.c
 > In file included from extensions/libipt_conntrack.c:14:
 >/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:28:
 > `IP_CT_DIR_MAX' undeclared here (not in a function)

I guess the kernel source is located at '/usr/local/kernel/src/linux/'. 
What version is it? (the kernel source), and what patches have you 
applied from pom?

There should be an enum at the top of 
'/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h', 
defining the constant `IP_CT_DIR_MAX'. Either its not there, or the 
compiler does not like that one. What compiler are you using?

Also try reproduce with a vanilla 2.4.19 kernel source.

Regards
Anders Fugmann

-- 
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.


