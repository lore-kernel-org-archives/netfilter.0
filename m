From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: RE: Static compile issues
Date: 29 May 2003 21:01:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054234869.749.42.camel@tux.rsn.bth.se>
References: <Pine.LNX.4.30.0305291140260.18659-100000@phear.lwz.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.30.0305291140260.18659-100000@phear.lwz.org>
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
To: Cory Visi <merlin@phear.lwz.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-05-29 at 17:45, Cory Visi wrote:

> > Recompile iptables against your new kernel and it _will_ work again.
> 
> Ahh, but that's the best part:
> (This is iptables-1.2.7a)
> 
> # make
> Extensions found: IPv4:ipv4options IPv4:IPV4OPTSSTRIP IPv4:mport IPv4:NETMAP IPv4:nth IPv4:pool IPv4:POOL IPv4:psd IPv4:quota IPv4:random IPv4:realm IPv4:time IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:REJECT IPv6:rt
> cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
> In file included from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:9,
>                  from /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:69,
>                  from extensions/libipt_conntrack.c:12:
> /usr/src/linux/include/linux/in.h:25: conflicting types for `IPPROTO_IP'
> /usr/include/netinet/in.h:32: previous declaration of `IPPROTO_IP'

[snip lots of warnings and errors]

> make: *** [extensions/libipt_conntrack_sh.o] Error 1

I just tested to compile iptables from cvs and it compiled just fine,
I've never seen the errors you got before, you appear to have seriously
screwed up includes.

-- 
/Martin

