From: Dian Brits <dian.brits@epiuse.com>
Subject: RE: Compile problems with iptables 1.2.7
Date: Tue, 1 Oct 2002 18:28:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B0A500E93795D311AD4300A0C9A98F4801610ABD@lara.epiuse.co.za>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Anders Fugmann' <afu@fugmann.dhs.org>, Dian Brits <dian.brits@epiuse.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

ok i've tried using 1.2.7a but i still get this:

kagisofw:/usr/local/iptables/src/iptables-1.2.7a $ /kernel/src/linux
<
Extensions found:
cc -O2 -Wall -Wunused -I/usr/local/kernel/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c
extensions/libipt_conntrack.c
In file included from extensions/libipt_conntrack.c:14:
/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:28:
`IP_CT_DIR_MAX' undeclared here (not in a function)
/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:29:
`IP_CT_DIR_MAX' undeclared here (not in a function)
/usr/local/kernel/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:29:
`IP_CT_DIR_MAX' undeclared here (not in a function)
extensions/libipt_conntrack.c: In function `parse_status':
extensions/libipt_conntrack.c:103: `IPS_EXPECTED' undeclared (first use in
this function)
extensions/libipt_conntrack.c:103: (Each undeclared identifier is reported
only once
extensions/libipt_conntrack.c:103: for each function it appears in.)
extensions/libipt_conntrack.c:105: `IPS_SEEN_REPLY' undeclared (first use in
this function)
extensions/libipt_conntrack.c:107: `IPS_ASSURED' undeclared (first use in
this function)
extensions/libipt_conntrack.c: In function `parse':
extensions/libipt_conntrack.c:202: `IP_CT_DIR_ORIGINAL' undeclared (first
use in this function)
extensions/libipt_conntrack.c:259: `IP_CT_DIR_REPLY' undeclared (first use
in this function)
extensions/libipt_conntrack.c: In function `print_status':
extensions/libipt_conntrack.c:364: `IPS_EXPECTED' undeclared (first use in
this function)
extensions/libipt_conntrack.c:368: `IPS_SEEN_REPLY' undeclared (first use in
this function)
extensions/libipt_conntrack.c:372: `IPS_ASSURED' undeclared (first use in
this function)
extensions/libipt_conntrack.c: In function `matchinfo_print':
extensions/libipt_conntrack.c:420: `IP_CT_DIR_ORIGINAL' undeclared (first
use in this function)
extensions/libipt_conntrack.c:440: `IP_CT_DIR_REPLY' undeclared (first use
in this function)
make: *** [extensions/libipt_conntrack_sh.o] Error 1

regards
dian

-----Original Message-----
From: Anders Fugmann [mailto:afu@fugmann.dhs.org]
Sent: Tuesday, October 01, 2002 17:37 PM
To: Dian Brits
Cc: 'netfilter@lists.netfilter.org'
Subject: Re: Compile problems with iptables 1.2.7


Dian Brits wrote:
> hi there,
> 
> i'm trying to install iptables 1.2.7 on kernel 2.4.17, i've already
applied
> the patch-o-matic patches to my kernel but when i try to compile iptables
i
> get the following output:
> 
Please try and repoduce with iptables 1.2.7a. Version 1.2.7 should never 
have been out.

Regards
Anders Fugmann



-- 
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.

