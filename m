From: "Filip Sneppe (Cronos)" <filip.sneppe@cronos.be>
Subject: Re: Cuseeme-Nat
Date: 18 Apr 2003 02:15:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050624945.1900.10.camel@exile>
References: <NGBBLGFEALDADHNDAAFFMEHJDJAA.ksmith@perfht.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBLGFEALDADHNDAAFFMEHJDJAA.ksmith@perfht.com>
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
To: Kevin Smith <ksmith@perfht.com>
Cc: netfilter@lists.netfilter.org

Hi Kevin,

On Thu, 2003-04-17 at 15:20, Kevin Smith wrote:

>Well I upgraded my Kernel to 2.4.20 and patched cuseeme-nat and the
>other required file to it (Patch-o-matic says verifies this). But I
>still get the same problem with some reflectors, where they read the
>machine IP and refuse to let me in. 
>
>I did however get curious error while compiling: 
...
>ip_nat_helper.c: In function `ip_nat_resize_packet':
>ip_nat_helper.c:87: warning: unused variable `data' <-------- This one
>
>
>Might this cause the patch to malfunction? If so, since Im new to all

No, this warning is not really an issue. I think there's already
a small patch in patch-o-matic to fix this compile warning.

>this patching/compiling stuff, can someone point me in the right
>direction to correct this? Ive been compiling for about a week now so
>Id liekto NOT have to do that again, but If I must. 
>
Can you recompile the CuSeeMe module with debugging enabled ?
there's no need for a full kernel recompile.

Just edit net/ipv4/netfilter/ip_nat_cuseeme.c in the kernel tree
and change the lines:

#if 0
#define DEBUGP printk
#else
#define DEBUGP(format, args...)
#endif

into this (it's really just a one-line change):

#if 1
#define DEBUGP printk
#else
#define DEBUGP(format, args...)
#endif

then do (from your kernel source tree):

rm net/ipv4/netfilter/ip_nat_cuseeme.o
make SUBDIRS=net/ipv4/netfilter modules
make modules_install

then you can do 'rmmod ip_nat_cuseeme' and 'modprobe ip_nat_cuseeme'
again.

Debugging messages should be logged depending on your
syslog configuration. Most likely they will show
up in /var/log/messages. Can you copy-paste the
debugging messages ?

Thanks in advance,
Filip


