From: Cory Visi <merlin@phear.lwz.org>
Subject: RE: Static compile issues
Date: Thu, 29 May 2003 11:45:06 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.30.0305291140260.18659-100000@phear.lwz.org>
References: <1054212845.749.37.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054212845.749.37.camel@tux.rsn.bth.se>
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
To: Netfilter <netfilter@lists.netfilter.org>, Martin Josefsson <gandalf@wlug.westbo.se>

On 29 May 2003, Martin Josefsson wrote:

> On Thu, 2003-05-29 at 01:10, George Vieira wrote:
> > No, don't enable it.. why bother.
> >
> > I've noticed that there are more and more people with problems on 2.4.20 kernel. Not sure the reason behind it or if it's the kernel or netfilter causing it.. but so far my 2.4.19 is fine.. not that it helps you...
>
> Why oh why can't anyone use google or read through an archive of this
> list? I've helped _lots_ of people with this problem.
>
> The solution is _very_ simple.
>
> Recompile iptables against your new kernel and it _will_ work again.

Ahh, but that's the best part:
(This is iptables-1.2.7a)

# make
Extensions found: IPv4:ipv4options IPv4:IPV4OPTSSTRIP IPv4:mport IPv4:NETMAP IPv4:nth IPv4:pool IPv4:POOL IPv4:psd IPv4:quota IPv4:random IPv4:realm IPv4:time IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:REJECT IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:25: conflicting types for `IPPROTO_IP'
/usr/include/netinet/in.h:32: previous declaration of `IPPROTO_IP'
/usr/src/linux/include/linux/in.h:26: conflicting types for `IPPROTO_ICMP'
/usr/include/netinet/in.h:36: previous declaration of `IPPROTO_ICMP'
/usr/src/linux/include/linux/in.h:27: conflicting types for `IPPROTO_IGMP'
/usr/include/netinet/in.h:38: previous declaration of `IPPROTO_IGMP'
/usr/src/linux/include/linux/in.h:28: conflicting types for `IPPROTO_IPIP'
/usr/include/netinet/in.h:40: previous declaration of `IPPROTO_IPIP'
/usr/src/linux/include/linux/in.h:29: conflicting types for `IPPROTO_TCP'
/usr/include/netinet/in.h:42: previous declaration of `IPPROTO_TCP'
/usr/src/linux/include/linux/in.h:30: conflicting types for `IPPROTO_EGP'
/usr/include/netinet/in.h:44: previous declaration of `IPPROTO_EGP'
/usr/src/linux/include/linux/in.h:31: conflicting types for `IPPROTO_PUP'
/usr/include/netinet/in.h:46: previous declaration of `IPPROTO_PUP'
/usr/src/linux/include/linux/in.h:32: conflicting types for `IPPROTO_UDP'
/usr/include/netinet/in.h:48: previous declaration of `IPPROTO_UDP'
/usr/src/linux/include/linux/in.h:33: conflicting types for `IPPROTO_IDP'
/usr/include/netinet/in.h:50: previous declaration of `IPPROTO_IDP'
/usr/src/linux/include/linux/in.h:34: conflicting types for `IPPROTO_RSVP'
/usr/include/netinet/in.h:60: previous declaration of `IPPROTO_RSVP'
/usr/src/linux/include/linux/in.h:35: conflicting types for `IPPROTO_GRE'
/usr/include/netinet/in.h:62: previous declaration of `IPPROTO_GRE'
/usr/src/linux/include/linux/in.h:37: conflicting types for `IPPROTO_IPV6'
/usr/include/netinet/in.h:54: previous declaration of `IPPROTO_IPV6'
/usr/src/linux/include/linux/in.h:39: conflicting types for `IPPROTO_PIM'
/usr/include/netinet/in.h:78: previous declaration of `IPPROTO_PIM'
/usr/src/linux/include/linux/in.h:41: conflicting types for `IPPROTO_ESP'
/usr/include/netinet/in.h:64: previous declaration of `IPPROTO_ESP'
/usr/src/linux/include/linux/in.h:42: conflicting types for `IPPROTO_AH'
/usr/include/netinet/in.h:66: previous declaration of `IPPROTO_AH'
/usr/src/linux/include/linux/in.h:43: conflicting types for `IPPROTO_COMP'
/usr/include/netinet/in.h:80: previous declaration of `IPPROTO_COMP'
/usr/src/linux/include/linux/in.h:45: conflicting types for `IPPROTO_RAW'
/usr/include/netinet/in.h:82: previous declaration of `IPPROTO_RAW'
/usr/src/linux/include/linux/in.h:47: conflicting types for `IPPROTO_MAX'
/usr/include/netinet/in.h:85: previous declaration of `IPPROTO_MAX'
/usr/src/linux/include/linux/in.h:51: redefinition of `struct in_addr'
/usr/src/linux/include/linux/in.h:92: redefinition of `struct ip_mreq'
/usr/src/linux/include/linux/in.h:98: redefinition of `struct ip_mreqn'
/usr/src/linux/include/linux/in.h:105: redefinition of `struct in_pktinfo'
/usr/src/linux/include/linux/in.h:113: redefinition of `struct sockaddr_in'
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:130:1: warning: "IN_CLASSA" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:145:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:136:1: warning: "IN_CLASSB" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:151:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:142:1: warning: "IN_CLASSC" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:157:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:147:1: warning: "IN_CLASSD" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:162:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:151:1: warning: "IN_EXPERIMENTAL" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:165:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:152:1: warning: "IN_BADCLASS" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:166:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:155:1: warning: "INADDR_ANY" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:169:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:158:1: warning: "INADDR_BROADCAST" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:171:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:161:1: warning: "INADDR_NONE" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:173:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:167:1: warning: "INADDR_LOOPBACK" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:179:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:171:1: warning: "INADDR_UNSPEC_GROUP" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:183:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:172:1: warning: "INADDR_ALLHOSTS_GROUP" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:184:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:173:1: warning: "INADDR_ALLRTRS_GROUP" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:185:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/in.h:174:1: warning: "INADDR_MAX_LOCAL_GROUP" redefined
In file included from /usr/include/netdb.h:28,
                 from extensions/libipt_conntrack.c:6:
/usr/include/netinet/in.h:186:1: warning: this is the location of the previous definition
In file included from /usr/src/linux/include/asm/smp.h:15,
                 from /usr/src/linux/include/linux/smp.h:14,
                 from /usr/src/linux/include/linux/interrupt.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/asm/fixmap.h:77: `FIX_ACPI_PAGES' undeclared here (not in a function)
/usr/src/linux/include/asm/fixmap.h:77: enumerator value for `FIX_ACPI_END' not integer constant
/usr/src/linux/include/asm/fixmap.h:88: parse error before "pgprot_t"
/usr/src/linux/include/asm/fixmap.h: In function `virt_to_fix':
/usr/src/linux/include/asm/fixmap.h:137: warning: implicit declaration of function `BUG'
In file included from /usr/src/linux/include/asm/smp.h:17,
                 from /usr/src/linux/include/linux/smp.h:14,
                 from /usr/src/linux/include/linux/interrupt.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/asm/mpspec.h: At top level:
/usr/src/linux/include/asm/mpspec.h:223: parse error before "id"
/usr/src/linux/include/asm/mpspec.h:224: parse error before "address"
/usr/src/linux/include/asm/mpspec.h:227: parse error before "id"
/usr/src/linux/include/asm/mpspec.h:228: parse error before "bus_irq"
In file included from /usr/src/linux/include/asm/smp.h:21,
                 from /usr/src/linux/include/linux/smp.h:14,
                 from /usr/src/linux/include/linux/interrupt.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/asm/apic.h:85: parse error before "unsigned"
In file included from /usr/src/linux/include/linux/interrupt.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/smp.h:29: parse error before '(' token
In file included from /usr/src/linux/include/linux/irq.h:19,
                 from /usr/src/linux/include/asm/hardirq.h:6,
                 from /usr/src/linux/include/linux/interrupt.h:46,
                 from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/asm/irq.h:40: warning: `struct task_struct' declared inside parameter list
/usr/src/linux/include/asm/irq.h:40: warning: its scope is only this definition or declaration, which is probably not what you want
In file included from /usr/src/linux/include/linux/irq.h:69,
                 from /usr/src/linux/include/asm/hardirq.h:6,
                 from /usr/src/linux/include/linux/interrupt.h:46,
                 from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/asm/hw_irq.h:78: parse error before '(' token
/usr/src/linux/include/asm/hw_irq.h: In function `x86_do_profile':
/usr/src/linux/include/asm/hw_irq.h:210: `current' undeclared (first use in this function)
/usr/src/linux/include/asm/hw_irq.h:210: (Each undeclared identifier is reported only once
/usr/src/linux/include/asm/hw_irq.h:210: for each function it appears in.)
/usr/src/linux/include/asm/hw_irq.h: In function `hw_resend_irq':
/usr/src/linux/include/asm/hw_irq.h:228: warning: implicit declaration of function `send_IPI_self'
In file included from /usr/src/linux/include/linux/interrupt.h:46,
                 from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/asm/hardirq.h: In function `irq_enter':
/usr/src/linux/include/asm/hardirq.h:77: warning: implicit declaration of function `cpu_relax'
In file included from /usr/src/linux/include/linux/netfilter_ipv4/lockhelp.h:7,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:10,
                 from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/interrupt.h: At top level:
/usr/src/linux/include/linux/interrupt.h:75: syntax error before "void"
/usr/src/linux/include/linux/interrupt.h:79: parse error before '(' token
/usr/src/linux/include/linux/interrupt.h:80: parse error before '(' token
/usr/src/linux/include/linux/interrupt.h: In function `tasklet_unlock':
/usr/src/linux/include/linux/interrupt.h:142: warning: implicit declaration of function `barrier'
/usr/src/linux/include/linux/interrupt.h: At top level:
/usr/src/linux/include/linux/interrupt.h:156: parse error before '(' token
/usr/src/linux/include/linux/interrupt.h: In function `tasklet_schedule':
/usr/src/linux/include/linux/interrupt.h:161: warning: implicit declaration of function `__tasklet_schedule'
/usr/src/linux/include/linux/interrupt.h: At top level:
/usr/src/linux/include/linux/interrupt.h:164: parse error before '(' token
/usr/src/linux/include/linux/interrupt.h: In function `tasklet_hi_schedule':
/usr/src/linux/include/linux/interrupt.h:169: warning: implicit declaration of function `__tasklet_hi_schedule'
make: *** [extensions/libipt_conntrack_sh.o] Error 1


-Cory


