From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: ftp server issue, trying to DL 1.2.7a
Date: Fri, 6 Sep 2002 08:05:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2556b$671f2070$0401000a@win2k>
References: <NEENJAPFEAIEMGMNIGFLAELBCCAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEENJAPFEAIEMGMNIGFLAELBCCAA.rwideman@austin.rr.com>
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
To: netfilter@lists.netfilter.org

> GREAT, Thanks
You're welcome :o)

> new problem...i compiled the kernel and i get these errors:
<snip>
> gcc -D__KERNEL__ -I/usr/src/linux/include -Wall
> -Wstrict-prototypes -Wno-tri
> graphs -O2 -fno-strict-aliasing -fno-common
> -fomit-frame-pointer -pipe -mpre
> ferred-stack-boundary=2 -march=i586   -nostdinc -I
> /usr/lib/gcc-lib/i386-redhat-linux/2.96/include
> -DKBUILD_BASENAME=ipt_helper
>   -c -o ipt_helper.o ipt_helper.c
> ipt_helper.c: In function `match':
> ipt_helper.c:46: wrong type argument to unary exclamation mark
> ipt_helper.c:51: incompatible types in assignment
> ipt_helper.c:67: structure has no member named `name'
> ipt_helper.c:68: structure has no member named `name'
> make[3]: *** [ipt_helper.o] Error 1
> make[3]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
> make[2]: *** [first_rule] Error 2
> make[2]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
> make[1]: *** [_subdir_ipv4/netfilter] Error 2
> make[1]: Leaving directory `/usr/src/linux/net'
> make: *** [_dir_net] Error 2
>
Uh.. Dunno. I'm still no guru :o) I guess there's some patch missing ?
I started patching with ./runme submitted, and I didn't have the
problem that you have (but I did when I didn't start with
submitted...).

I read somewhere about a week ago that patching should start with
submitted, but if you go further down the line (pending, base, extra)
it looks like it checks if the kernel is patched with options of the
previous stage, only it continues where the previous one stopped.
If that is really so, then I don't understand why patching should
start at submitted instead of, let's say extra.
Can someone please explain how this actually works : if I want patches
from extra, should I really start with submitted ?


Rob


